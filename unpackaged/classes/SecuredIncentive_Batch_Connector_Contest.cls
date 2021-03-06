global class SecuredIncentive_Batch_Connector_Contest implements Database.batchable<sObject>,Database.Stateful{
    private Map<id,Decimal> Salesperson_Incentive_Map = new Map<id,decimal>();
    private Map<id,Decimal> DSA_Connector_Incentive_Map = new Map<id,decimal>();
    
    global SecuredIncentive_Batch_Connector_Contest(Map<id,Decimal> salesperson, Map<id,Decimal> dsa){
        Salesperson_Incentive_Map = salesperson;
        DSA_Connector_Incentive_Map = dsa;
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        Integer mnth = System.Today().MOnth();
        Integer yr = System.Today().Year();
        String product = 'Lead - VYAPAR (SECURED LOAN)';
        String product2 = 'Lead - Rural Vyapar';
        string type = 'Connector';
        String query = 'Select Id,name,Disbursal_Amount__c,Disbursal_Date__c,ROI__c,OwnerId,DSA_Connector__r.DSA_Connector__c From Loan_Account__c WHERE (Applicant__r.Product__c=:Product2 OR Applicant__r.Product__c=:Product) AND DSA_Connector__r.DSA_Connector__c=:type and CALENDAR_MONTH(Disbursal_Date__c) =:mnth and CALENDAR_YEAR(Disbursal_Date__c) =:yr';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Loan_Account__c> scope){
        if(scope != null && scope.size()>0){
            Incentive_Setup__mdt[] Inc = [select MasterLabel,Start_Date__c,End_Date__c, Incentive__c from Incentive_Setup__mdt where Sourcing__c = 'DSA'AND
                                          Product__c ='Lead - VYAPAR (SECURED LOAN)' AND Type__c ='Salesperson' AND Active__c=true AND RecordType__c='Contest' LIMIT 1];
            if(Inc[0] !=null && Inc[0].Start_Date__c!=null && Inc[0].End_Date__c !=null){
                /****** Incentives Calculation for Secured Loans- if sourcing through DSA, then for internal employee ******/
                
                Map<id,List<Loan_Account__c>> Agent_SecuredLoanList_Map = new Map<id,List<Loan_Account__c>>();
                Map<id,List<Loan_Account__c>> DSA_ConnectorLoans_Map = new Map<id,List<Loan_Account__c>>();
                Map<id,decimal> Agent_WIRR_Secured_Map = new Map<id,decimal>();
                Map<id,decimal> Agent_LoanAmt_Secured_Map = new Map<id,decimal>();
                Map<id,Decimal> dsa_LoanAmt_Map = new Map<id,Decimal>();
                for(Loan_Account__c Loan:scope){
                    if(Loan.Disbursal_Date__c <=Inc[0].End_Date__c && Loan.Disbursal_Date__c >=Inc[0].Start_Date__c){
                        if(Agent_SecuredLoanList_Map.get(loan.OwnerId)==null){
                            Agent_SecuredLoanList_Map.put(loan.OwnerId,new List<Loan_Account__c>{loan});
                        }else{
                            Agent_SecuredLoanList_Map.get(loan.OwnerId).add(loan);
                        }
                        if(DSA_ConnectorLoans_Map.get(loan.DSA_Connector__c)==null){
                            DSA_ConnectorLoans_Map.put(loan.DSA_Connector__c,new List<Loan_Account__c>{loan});
                        }else{
                            DSA_ConnectorLoans_Map.get(loan.DSA_Connector__c).add(loan);
                        }
                    }
                }
                
                //calculate wirr of all loan accounts against each agent
                for(id personId:Agent_SecuredLoanList_Map.keyset()){
                    decimal Amt_ROI_Mul = 0;
                    decimal Sum_Amt = 0;
                    for(Loan_Account__c la:Agent_SecuredLoanList_Map.get(personId)){
                        if(la.Disbursal_Amount__c != null && la.ROI__c !=null){
                            Amt_ROI_Mul = Amt_ROI_Mul + (la.Disbursal_Amount__c * la.ROI__c);
                            Sum_Amt = Sum_Amt+la.Disbursal_Amount__c;
                        }
                    }
                    Agent_LoanAmt_Secured_Map.put(personId,Sum_Amt);
                    Agent_WIRR_Secured_Map.put(personId,Amt_ROI_Mul/Sum_Amt);
                }
                //WIRR Calculation ended
                
                //total loans of DSA
                for(id dsa:DSA_ConnectorLoans_Map.keyset()){
                    decimal Sum_Amt = 0;
                    for(Loan_Account__c la:DSA_ConnectorLoans_Map.get(dsa)){
                        if(la.Disbursal_Amount__c != null && la.ROI__c !=null){
                            Sum_Amt = Sum_Amt+la.Disbursal_Amount__c;
                        }
                    }
                    dsa_LoanAmt_Map.put(dsa,Sum_Amt);
                }
                //DSA Loans total
                
                /****** get incentive mapping from metadata *******/
                for(id salesperson:Agent_LoanAmt_Secured_Map.keyset()){
                    decimal WIRR = Agent_WIRR_Secured_Map.get(salesperson);
                    Incentive_Setup__mdt[] Incentive = [select MasterLabel, Incentive__c from Incentive_Setup__mdt where WIRR_Lower_Limit__c <=: WIRR AND Sourcing__c ='Connector' AND
                                                        WIRR_Higher_Limit__c >=: WIRR AND Product__c ='Lead - VYAPAR (SECURED LOAN)' AND Type__c ='Salesperson' AND Active__c=true AND RecordType__c='Contest' LIMIT 1];
                    if(Incentive != null && Incentive[0].Incentive__c != null){
                        decimal incent = Agent_LoanAmt_Secured_Map.get(salesperson)*0.01*Incentive[0].Incentive__c;
                        if(Salesperson_Incentive_Map.containsKey(salesperson)){
                            Salesperson_Incentive_Map.put(salesperson,Salesperson_Incentive_Map.get(salesperson)+incent);
                        }else{
                            Salesperson_Incentive_Map.put(salesperson,incent);
                        }
                    }
                }
                Incentive_Setup__mdt[] ConnectorIncentive = [select MasterLabel, Incentive__c from Incentive_Setup__mdt where Sourcing__c = 'Connector' AND
                                                             Product__c ='Lead - VYAPAR (SECURED LOAN)' AND Type__c ='Connector' AND Active__c=true AND RecordType__c='Contest' LIMIT 1];
                if(ConnectorIncentive != null && ConnectorIncentive[0].Incentive__c != null){
                    for(id dsa:dsa_LoanAmt_Map.keyset()){
                        decimal incent = dsa_LoanAmt_Map.get(dsa)*0.01*ConnectorIncentive[0].Incentive__c;
                        if(DSA_Connector_Incentive_Map.containskey(dsa)){
                            DSA_Connector_Incentive_Map.put(dsa,DSA_Connector_Incentive_Map.get(dsa)+incent);
                        }else{
                            DSA_Connector_Incentive_Map.put(dsa,incent);
                        }
                    }
                }
            }
        }
    }
    
    global void finish(Database.BatchableContext BC){
        SecuredIncentive_Batch_Direct_Contest bt = new SecuredIncentive_Batch_Direct_Contest(Salesperson_Incentive_Map,DSA_Connector_Incentive_Map);
        database.executebatch(bt);
    }
}
/***  Sales Incentive Forecast batch for secured loans (DSA)- By Ashwini kumar ***/
global class SecuredIncentiveForecast_Batch_DSA implements Database.batchable<sObject>, Schedulable,Database.Stateful {
     private Map<id,Decimal> Salesperson_Incentive_Map = new Map<id,decimal>();
    private Map<id,Decimal> DSA_Incentive_Map = new Map<id,decimal>();
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        Integer mnth = System.Today().MOnth();
        Integer yr = System.Today().Year();
        String product = 'Lead - VYAPAR (SECURED LOAN)';
        String product2 = 'Lead - Rural Vyapar';
        string type = 'DSA';
        String loanstatus= 'Disbursed';
        String loanstatus1= 'Rejected';
       
        String query = 'Select Id,Disbursal_Amount__c,name,ROI__c,DSA_Connector__r.DSA_Connector__c,OwnerId,Applicant__r.Product__c,created_month__c,create_year__c,Applicant__r.Rate_Of_Interest__c,Applicant__r.Loan_Amount__c,Disbursal_Date__c From Loan_Account__c WHERE (Applicant__r.Product__c=:Product2 OR Applicant__r.Product__c=:Product) AND DSA_Connector__r.DSA_Connector__c=:type and create_year__c=:yr and  LOAN_STATUS__c!= \'' + loanstatus + '\' and LOAN_STATUS__c!= \'' + loanstatus + '\'';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Loan_Account__c> scope){
        if(scope != null && scope.size()>0){
            
            /****** Incentives Calculation for Secured Loans- if sourcing through DSA, then for internal employee ******/
            
            Map<id,List<Loan_Account__c>> Agent_SecuredLoanList_Map = new Map<id,List<Loan_Account__c>>();
            Map<id,List<Loan_Account__c>> DSA_ConnectorLoans_Map = new Map<id,List<Loan_Account__c>>();
            Map<id,decimal> Agent_WIRR_Secured_Map = new Map<id,decimal>();
            Map<id,decimal> Agent_LoanAmt_Secured_Map = new Map<id,decimal>();
            Map<id,Decimal> dsa_LoanAmt_Map = new Map<id,Decimal>();
            for(Loan_Account__c Loan:scope){
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
           
            //calculate wirr of all loan accounts against each agent
            for(id personId:Agent_SecuredLoanList_Map.keyset()){
                decimal Amt_ROI_Mul = 0;
                decimal Sum_Amt = 0;
                for(Loan_Account__c la:Agent_SecuredLoanList_Map.get(personId)){
                    if(la.Applicant__r.Loan_Amount__c!=null && la.Applicant__r.Rate_Of_Interest__c!=null){
                        Amt_ROI_Mul = Amt_ROI_Mul + (la.Applicant__r.Loan_Amount__c *la.Applicant__r.Rate_Of_Interest__c);
                        Sum_Amt = Sum_Amt+la.Applicant__r.Loan_Amount__c;
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
                    if(la.Applicant__r.Loan_Amount__c!=null){
                        Sum_Amt = Sum_Amt+la.Applicant__r.Loan_Amount__c;
                    }
                }
                dsa_LoanAmt_Map.put(dsa,Sum_Amt);
            }
            //DSA Loans total
            
            /****** get incentive mapping from metadata *******/
            for(id salesperson:Agent_LoanAmt_Secured_Map.keyset()){
                decimal WIRR = Agent_WIRR_Secured_Map.get(salesperson);
                Incentive_Setup__mdt[] Incentive = [select MasterLabel, Incentive__c from Incentive_Setup__mdt where WIRR_Lower_Limit__c <=: WIRR AND Sourcing__c = 'DSA'AND
                                                    WIRR_Higher_Limit__c >=: WIRR AND Product__c ='Lead - VYAPAR (SECURED LOAN)' AND Type__c ='Salesperson' AND RecordType__c='Regular Incentive' LIMIT 1];
                if(Incentive != null && Incentive[0].Incentive__c != null){
                    Salesperson_Incentive_Map.put(salesperson,Agent_LoanAmt_Secured_Map.get(salesperson)*0.01*Incentive[0].Incentive__c);
                }
            }
            for(id dsa:dsa_LoanAmt_Map.keyset()){
                decimal amt= dsa_LoanAmt_Map.get(dsa);
                Incentive_Setup__mdt[] Incentive = [select MasterLabel, Incentive__c from Incentive_Setup__mdt where Minimum_Amount__c <=: amt AND Sourcing__c = 'DSA'AND
                                                    Maximum_Amount__c >=: amt AND Product__c ='Lead - VYAPAR (SECURED LOAN)' AND Type__c ='DSA'  AND RecordType__c='Regular Incentive' LIMIT 1];
                if(Incentive != null && Incentive[0].Incentive__c != null){
                    DSA_Incentive_Map.put(dsa,dsa_LoanAmt_Map.get(dsa)*0.01*Incentive[0].Incentive__c);
                }
            }
            
        }
    }
    global void finish(Database.BatchableContext BC){
        SecuredIncentiveForecast_Batch_Connector bt = new SecuredIncentiveForecast_Batch_Connector(Salesperson_Incentive_Map,DSA_Incentive_Map);
        database.executebatch(bt);
    }
    global void execute(SchedulableContext sc){
        
    }

}
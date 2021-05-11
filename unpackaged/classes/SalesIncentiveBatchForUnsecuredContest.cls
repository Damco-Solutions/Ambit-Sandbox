global class SalesIncentiveBatchForUnsecuredContest implements Database.Batchable<sObject>,Schedulable,Database.Stateful {
    global DateTime dt = Datetime.now();
    global string premnth=string.valueOf(dt.format('MMMM'));
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        Integer mnth = System.Today().MOnth();
        String Product='Lead - UDYAM (UNSECURED LOAN)';
        String product2 = 'Lead - Rural Udyam';
        Integer yr = System.Today().Year();
        String query = 'Select Id,name,Disbursal_Amount__c,ROI__c,OwnerId,DSA_Connector__c,Applicant__r.Product__c,DSA_Connector__r.DSA_Connector__c,Disbursal_Date__c From Loan_Account__c WHERE CALENDAR_MONTH(Disbursal_Date__c) =:mnth and CALENDAR_YEAR(Disbursal_Date__c) =:yr and (Applicant__r.Product__c=:Product2 OR Applicant__r.Product__c=:Product)';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Loan_Account__c> scope){
        if(scope != null && scope.size()>0){
          
            /****** Incentives Calculation for UnSecured Loans ******/
            Map<id,List<Loan_Account__c>> Agent_UnSecuredLoanList_Map = new Map<id,List<Loan_Account__c>>();
            Map<id,double> Agent_WIRR_UnSecured_Map = new Map<id,double>();
            Map<id,double> Agent_LoanAmt_UnSecured_Map = new Map<id,double>();
            Map< id,id > Agent_SalesIncentive_Map = new Map< id,id >();
            Map<id,integer> Agent_NOOFLoan_UnSecured_Map = new Map<id,integer>();
            Map<id,List<Loan_Account__c>> DSA_ConnectorLoans_Map = new Map<id,List<Loan_Account__c>>();
            Map<id,Decimal> dsa_LoanAmt_Map = new Map<id,Decimal>();
            Map<id,Decimal> DSA_Incentive_Map = new Map<id,decimal>();
            Map<id,date>Agent_Disbdate_UnSecured_Map= new Map<id,date>();
            Map<id,date>Agent_DSADisbdate_UnSecured_Map= new Map<id,date>();
            
            for(Loan_Account__c Loan:scope){
                    if(Agent_UnSecuredLoanList_Map.get(loan.OwnerId)==null){
                        Agent_UnSecuredLoanList_Map.put(loan.OwnerId,new List<Loan_Account__c>{loan});
                    }else{
                        Agent_UnSecuredLoanList_Map.get(loan.OwnerId).add(loan);
                    }
                    if(DSA_ConnectorLoans_Map.get(loan.DSA_Connector__c)==null){
                        DSA_ConnectorLoans_Map.put(loan.DSA_Connector__c,new List<Loan_Account__c>{loan});
                    }else{
                        DSA_ConnectorLoans_Map.get(loan.DSA_Connector__c).add(loan);
                    }
                }
                          
            //calculate wirr of all loan accounts against each agent
            for(id personId:Agent_UnSecuredLoanList_Map.keyset()){
                Double Amt_ROI_Mul = 0;
                Double Sum_Amt = 0;
                integer NO_of_loan= 0;
                Date Disbrualdate;
                for(Loan_Account__c la:Agent_UnSecuredLoanList_Map.get(personId)){
                    if(la.Disbursal_Amount__c != null && la.ROI__c !=null){
                        Amt_ROI_Mul = Amt_ROI_Mul + (la.Disbursal_Amount__c * la.ROI__c);
                        Sum_Amt = Sum_Amt+la.Disbursal_Amount__c;
                        Disbrualdate=la.Disbursal_Date__c;
                        if(Agent_UnSecuredLoanList_Map.containsKey(personId)){
                            NO_of_loan= NO_of_loan+1;
                        }

                    }
                }
                Agent_LoanAmt_UnSecured_Map.put(personId,Sum_Amt);
                Agent_WIRR_UnSecured_Map.put(personId,Amt_ROI_Mul/Sum_Amt);
                Agent_NOOFLoan_UnSecured_Map.put(personId,NO_of_loan);
                Agent_Disbdate_UnSecured_Map.put(personId,Disbrualdate);
            }
            //WIRR Calculation ended
            
            //total loans of DSA
            for(id dsa:DSA_ConnectorLoans_Map.keyset()){
                Double Sum_Amt = 0;
                date DsaDisbrualdate;
                for(Loan_Account__c la:DSA_ConnectorLoans_Map.get(dsa)){
                    if(la.Disbursal_Amount__c != null && la.ROI__c !=null){
                        Sum_Amt = Sum_Amt+la.Disbursal_Amount__c;
                        DsaDisbrualdate=la.Disbursal_Date__c;
                    }
                }
                dsa_LoanAmt_Map.put(dsa,Sum_Amt);
                Agent_DSADisbdate_UnSecured_Map.put(dsa,DsaDisbrualdate);
                
            }
             
            /****** get incentive mapping from metadata and create sales incentive record *******/
            Map<Integer,String> monthMap = new Map<Integer,String>();
            monthMap.put(1, 'January'); monthMap.put(2, 'February');
            monthMap.put(3, 'March'); monthMap.put(4, 'April');
            monthMap.put(5, 'May'); monthMap.put(6, 'June');
            monthMap.put(7, 'july'); monthMap.put(8, 'August');
            monthMap.put(9, 'September'); monthMap.put(10, 'October');
            monthMap.put(11, 'November'); monthMap.put(12, 'December');
             //Check for already created incentive for agents
            Map<id,Sales_Incentive__c> Agent_IncentiveMap = new Map<id,Sales_Incentive__c>();
            Map<id,Sales_Incentive__c> DSA_Connector_SalesIncentive_Map = new Map<id,Sales_Incentive__c>();
            String year = string.valueOf(System.today().Year());
            List<Sales_Incentive__c> IncentivesList=[select id ,Salesperson_Agent__c,Month__c,Year__c,DSA_Connector__c from Sales_Incentive__c where Month__c=:premnth AND Year__c=:year];
            if(IncentivesList != null && IncentivesList.size()>0){
                for (Sales_Incentive__c Siduplicate :IncentivesList){
                    if(Siduplicate.Salesperson_Agent__c!=null && Siduplicate.DSA_Connector__c==null){
                        Agent_SalesIncentive_Map.put(Siduplicate.Salesperson_Agent__c,Siduplicate.Id);
                    }
                    if(Siduplicate.Salesperson_Agent__c==null && Siduplicate.DSA_Connector__c!=null){
                        DSA_Connector_SalesIncentive_Map.put(Siduplicate.DSA_Connector__c,Siduplicate);
                    }
                
              }
          }
            /****** get incentive mapping from metadata for Dsa *******/
            for(id dsa:dsa_LoanAmt_Map.keyset()){
                decimal amt= dsa_LoanAmt_Map.get(dsa);
                date disdate;
                if(Agent_DSADisbdate_UnSecured_Map.containsKey(dsa)){
                    disdate=Agent_DSADisbdate_UnSecured_Map.get(dsa);
                    system.debug('disdate for dsa'+disdate);
                }
                Incentive_Setup__mdt[] Incentive = [select MasterLabel, Incentive__c,RecordType__c,Active__c,End_Date__c,Start_Date__c from Incentive_Setup__mdt where Minimum_Amount__c <=: amt AND Sourcing__c = 'DSA'AND
                                                    Maximum_Amount__c >=: amt AND Product__c ='Lead - UDYAM (UNSECURED LOAN)' AND Type__c ='DSA' AND RecordType__c='Contest'  AND Active__c=true LIMIT 1];
                if(Incentive != null && Incentive[0].Incentive__c != null && (disdate>=Incentive[0].Start_Date__c && disdate<=Incentive[0].End_Date__c)){
                    DSA_Incentive_Map.put(dsa,dsa_LoanAmt_Map.get(dsa)*0.01*Incentive[0].Incentive__c);
                }
            }
            
            for(id personId:Agent_WIRR_UnSecured_Map.keyset()){
                double WIRR = Agent_WIRR_UnSecured_Map.get(personId);
                integer TotalNoLoan=Agent_NOOFLoan_UnSecured_Map.get(personId);
                date disdate;
                if(Agent_Disbdate_UnSecured_Map.containsKey(personId)){
                    disdate=Agent_Disbdate_UnSecured_Map.get(personId);
                    system.debug('disdate for salesperson'+disdate);
                }
                Incentive_Setup__mdt[] Incentive = [select Incentive__c,Minimum_File_Input__c,RecordType__c,Active__c,End_Date__c,Start_Date__c from Incentive_Setup__mdt where WIRR_Lower_Limit__c <=: WIRR AND WIRR_Higher_Limit__c >=: WIRR AND Product__c='Lead - UDYAM (UNSECURED LOAN)' AND Type__c ='Salesperson' AND RecordType__c='Contest' AND Active__c=true ];
                if(Incentive[0] != null && Incentive[0].Incentive__c !=null && TotalNoLoan>=Incentive[0].Minimum_File_Input__c && (disdate>=Incentive[0].Start_Date__c && disdate<=Incentive[0].End_Date__c) ){
                    Sales_Incentive__c incent = new Sales_Incentive__c();
                    if(Agent_SalesIncentive_Map.containsKey(personId)){
                        incent.id=Agent_SalesIncentive_Map.get(personId);
                    }
                    incent.Salesperson_Agent__c = personId;
                    incent.Month__c = monthMap.get(system.today().month());
                    incent.Year__c = string.valueOf(system.today().Year());
                    incent.Contest_Incentive_for_Unsecured_Loans__c = 0.01*Incentive[0].Incentive__c*Agent_LoanAmt_UnSecured_Map.get(personId);
                    Agent_IncentiveMap.put(incent.Salesperson_Agent__c, incent);
                }
            }
            for(id dsa:DSA_Incentive_Map.keyset()){
                Sales_Incentive__c incent = new Sales_Incentive__c();
                incent.DSA_Connector__c = dsa;
                incent.Month__c = monthMap.get(system.today().month());
                incent.Year__c = string.valueOf(system.today().Year());
                incent.Contest_Incentive_for_Unsecured_Loans__c= DSA_Incentive_Map.get(dsa);
                if(DSA_Connector_SalesIncentive_Map.containskey(dsa)){
                    incent.id = DSA_Connector_SalesIncentive_Map.get(dsa).id;
                }
                DSA_Connector_SalesIncentive_Map.put(incent.DSA_Connector__c, incent);
            }
            
            /*Incentive added for secure Loans*/
            if(Agent_IncentiveMap != null && Agent_IncentiveMap.size()>0){
                try{
                    upsert Agent_IncentiveMap.values();
                }
                catch(dmlException ex){
                    
                }
            }
             if(DSA_Connector_SalesIncentive_Map != null && DSA_Connector_SalesIncentive_Map.size()>0){
                try{
                    upsert DSA_Connector_SalesIncentive_Map.values();
                }
                catch(dmlException ex){
                    
                }
            }
        }
    }
    global void finish(Database.BatchableContext BC){
           
    }
    global void execute(SchedulableContext sc){
        SalesIncentiveBatchForUnsecured conInstance = new SalesIncentiveBatchForUnsecured();
        database.executebatch(conInstance);
    }

}
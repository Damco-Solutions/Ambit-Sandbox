/***  Sales Incentive Forecast batch for secured loans (Direct)- By Ashwini kumar ***/
global class SecuredIncentiveForecast_Batch_Direct implements Database.batchable<sObject>,Database.Stateful {
    private Map<id,Decimal> Salesperson_Incentive_Map = new Map<id,decimal>();
    private Map<id,Decimal> DSA_Connector_Incentive_Map = new Map<id,decimal>();
    
    global SecuredIncentiveForecast_Batch_Direct(Map<id,Decimal> salesperson, Map<id,Decimal> dsa){
        Salesperson_Incentive_Map = salesperson;
        DSA_Connector_Incentive_Map = dsa;
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        Integer mnth = System.Today().MOnth();
        Integer yr = System.Today().Year();
        String product = 'Lead - VYAPAR (SECURED LOAN)';
        String product2 = 'Lead - Rural Vyapar';
        String loanstatus= 'Disbursed';
        String loanstatus1= 'Rejected';
       
        String query = 'Select Id,Disbursal_Amount__c,name,ROI__c,DSA_Connector__c,OwnerId,Applicant__r.Product__c,created_month__c,create_year__c,Applicant__r.Rate_Of_Interest__c,Applicant__r.Loan_Amount__c,Disbursal_Date__c From Loan_Account__c WHERE (Applicant__r.Product__c=:Product2 OR Applicant__r.Product__c=:Product) AND DSA_Connector__c=null and  created_month__c=:mnth and create_year__c=:yr and  LOAN_STATUS__c!= \'' + loanstatus + '\' and LOAN_STATUS__c!= \'' + loanstatus + '\'';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Loan_Account__c> scope){
        if(scope != null && scope.size()>0){
            Map<id,List<Loan_Account__c>> Agent_SecuredLoanList_Map = new Map<id,List<Loan_Account__c>>();
            Map<id,decimal> Agent_LoanAmt_Secured_Map = new Map<id,decimal>();
            for(Loan_Account__c loan:scope){
                system.debug('loan: '+loan.name);
                 if(Agent_SecuredLoanList_Map.get(loan.OwnerId)==null){
                    Agent_SecuredLoanList_Map.put(loan.OwnerId,new List<Loan_Account__c>{loan});
                }else{
                    Agent_SecuredLoanList_Map.get(loan.OwnerId).add(loan);
                }   
              
                
            }
            
            //calculate total of all loan amount against each agent
            for(id personId:Agent_SecuredLoanList_Map.keyset()){
                decimal Sum_Amt = 0;
                for(Loan_Account__c la:Agent_SecuredLoanList_Map.get(personId)){
                    if(la.Applicant__r.Loan_Amount__c!=null){
                        Sum_Amt = Sum_Amt+la.Applicant__r.Loan_Amount__c;
                    }
                }
                Agent_LoanAmt_Secured_Map.put(personId,Sum_Amt);
            }
           
            //total Calculation ended
            //
            Incentive_Setup__mdt[] DirectIncentive = [select MasterLabel, Incentive__c,RecordType__c from Incentive_Setup__mdt where Sourcing__c = 'Direct' AND
                                                    Product__c ='Lead - VYAPAR (SECURED LOAN)' AND Type__c ='Salesperson' AND RecordType__c='Regular Incentive' LIMIT 1];
            if(DirectIncentive != null && DirectIncentive[0].Incentive__c !=null){
                for(id agent:Agent_LoanAmt_Secured_Map.keyset()){
                    decimal incent = Agent_LoanAmt_Secured_Map.get(agent)*0.01*DirectIncentive[0].Incentive__c;
                    if(Salesperson_Incentive_Map.containskey(agent)){
                        Salesperson_Incentive_Map.put(agent,Salesperson_Incentive_Map.get(agent)+incent);
                    }else{
                        Salesperson_Incentive_Map.put(agent,incent);
                    }
                }
            }
            
            /******process sales incentives for all******/
            Map<Integer,String> monthMap = new Map<Integer,String>();
            monthMap.put(1, 'January'); monthMap.put(2, 'February');
            monthMap.put(3, 'March'); monthMap.put(4, 'April');
            monthMap.put(5, 'May'); monthMap.put(6, 'June');
            monthMap.put(7, 'july'); monthMap.put(8, 'August');
            monthMap.put(9, 'September'); monthMap.put(10, 'October');
            monthMap.put(11, 'November'); monthMap.put(12, 'December');
            
            //Check for already created incentive for agents
            Map<id,Sales_Incentive__c> Agent_SalesIncentive_Map = new Map<id,Sales_Incentive__c>();
            Map<id,Sales_Incentive__c> DSA_Connector_SalesIncentive_Map = new Map<id,Sales_Incentive__c>();
            String year = string.valueOf(System.today().Year());
            List<Sales_Incentive__c> IncentivesList = [select id,name,Salesperson_Agent__c,DSA_Connector__c from Sales_Incentive__c where Month__c=:monthMap.get(System.Today().Month()) AND Year__c=:year];
            if(IncentivesList != null && IncentivesList.size()>0){
                for(Sales_Incentive__c si:IncentivesList){
                    if(si.Salesperson_Agent__c != null){
                        Agent_SalesIncentive_Map.put(si.Salesperson_Agent__c,si);
                    }
                    if(si.DSA_Connector__c !=null){
                        DSA_Connector_SalesIncentive_Map.put(si.DSA_Connector__c,si);
                    }
                }
            }
            /****** Create sales incentive record *******/
            for(id personId:Salesperson_Incentive_Map.keyset()){
                Sales_Incentive__c incent = new Sales_Incentive__c();
                incent.Salesperson_Agent__c = personId;
                incent.Month__c = monthMap.get(system.today().month());
                incent.Year__c = string.valueOf(system.today().Year());
                incent.Incentive_forecast_for_Secured_Loans__c = Salesperson_Incentive_Map.get(personId);
                if(Agent_SalesIncentive_Map.containskey(personId)){
                    incent.id = Agent_SalesIncentive_Map.get(personId).id;
                }
                Agent_SalesIncentive_Map.put(incent.Salesperson_Agent__c, incent);
            }
            for(id dsa:DSA_Connector_Incentive_Map.keyset()){
                Sales_Incentive__c incent = new Sales_Incentive__c();
                incent.DSA_Connector__c = dsa;
                incent.Month__c = monthMap.get(system.today().month());
                incent.Year__c = string.valueOf(system.today().Year());
                incent.Incentive_forecast_for_Secured_Loans__c = DSA_Connector_Incentive_Map.get(dsa);
                if(DSA_Connector_SalesIncentive_Map.containskey(dsa)){
                    incent.id = DSA_Connector_SalesIncentive_Map.get(dsa).id;
                }
                DSA_Connector_SalesIncentive_Map.put(incent.DSA_Connector__c, incent);
            }
            
            /*Incentive added for secure Loans*/
            if(Agent_SalesIncentive_Map != null && Agent_SalesIncentive_Map.size()>0){
                try{
                    upsert Agent_SalesIncentive_Map.values();
                    
                }
                catch(dmlException ex){
                    system.debug('error: '+ex.getLineNumber() +'>> '+ ex.getMessage());
                }
            }
            if(DSA_Connector_SalesIncentive_Map != null && DSA_Connector_SalesIncentive_Map.size()>0){
                try{
                    upsert DSA_Connector_SalesIncentive_Map.values();
                   
                }
                catch(dmlException ex){
                    system.debug('error: '+ex.getLineNumber() +'>> '+ ex.getMessage());
                }
            }
        }
    }
    
    global void finish(Database.BatchableContext BC){
       
    }

}
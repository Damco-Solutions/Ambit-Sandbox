global class SalesIncentiveRuralBatch implements Database.Batchable<sObject>,Database.Stateful {
    global integer Totalnorecordcreated=0;
    global DateTime dt = Datetime.now();
    global string premnth=string.valueOf(dt.format('MMMM'));
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        
        String Status='Disbursed';
        String Secured='Lead - Rural Vyapar';
        String UnSecured='Lead - Rural Udyam';
        Integer mnth = System.Today().MOnth();
        Integer yr = System.Today().Year();
        String query = 'Select Id,Disbursal_Amount__c,ROI__c,OwnerId,Applicant__r.Product__c,LOAN_STATUS__c From Loan_Account__c where LOAN_STATUS__c=:Status and CALENDAR_MONTH(Disbursal_Date__c) =:mnth and CALENDAR_YEAR(Disbursal_Date__c) =:yr and ( Applicant__r.Product__c=:Secured or Applicant__r.Product__c=:UnSecured)';
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Loan_Account__c> scope) {
        Map<id,List<Loan_Account__c>> Agent_SecuredLoanList_Map = new Map<id,List<Loan_Account__c>>();
            Map<id,List<Loan_Account__c>> Agent_UnSecuredLoanList_Map = new Map<id,List<Loan_Account__c>>();
             Map<id,double> Agent_LoanAmt_Secured_Map = new Map<id,double>();
         Map<id,double> Agent_LoanAmt_UnSecured_Map = new Map<id,double>();
        Map<id,double> Agent_NOOFLoan_Secured_Map = new Map<id,double>();
        Map<id,double> Agent_NOOFLoan_UnSecured_Map = new Map<id,double>();
        Map< id,id > Agent_SalesIncentive_Map = new Map< id,id >();

  
        // process each batch of records default size is 200
        if(scope != null && scope.size()>0){
            /****** Incentives Calculation for Rural Secured Loans and Rural UnSecured Loans  ******/
             
            for(Loan_Account__c Loan:scope){
                if(loan.Applicant__r.Product__c=='Lead - Rural Vyapar'){
                    if(Agent_SecuredLoanList_Map.get(loan.OwnerId)==null){
                        Agent_SecuredLoanList_Map.put(loan.OwnerId,new List<Loan_Account__c>{loan});
                    }else{
                        Agent_SecuredLoanList_Map.get(loan.OwnerId).add(loan);
                    }   
                }
                if(loan.Applicant__r.Product__c=='Lead - Rural Udyam'){
                    if(Agent_UnSecuredLoanList_Map.get(loan.OwnerId)==null){
                        Agent_UnSecuredLoanList_Map.put(loan.OwnerId,new List<Loan_Account__c>{loan});
                    }else{
                        Agent_UnSecuredLoanList_Map.get(loan.OwnerId).add(loan);
                    }   
                }
            }
            system.debug('Agent_SecuredLoanList_Map>>'+Agent_SecuredLoanList_Map);
            system.debug('Agent_UnSecuredLoanList_Map>>'+Agent_UnSecuredLoanList_Map);
        }
        if(Agent_SecuredLoanList_Map!=null && !Agent_SecuredLoanList_Map.isEmpty()){
        //calculate Number of Disbursal Amount and total no account of all loan accounts against each agent for Lead - Rural Vyapar
        for(id personId:Agent_SecuredLoanList_Map.keyset()){
                Double Sum_Amt = 0;
               Double NO_of_loan= 0;
                for(Loan_Account__c la:Agent_SecuredLoanList_Map.get(personId)){
                    if(la.Disbursal_Amount__c != null){
                        
                        Sum_Amt = Sum_Amt+la.Disbursal_Amount__c;
                        if(Agent_SecuredLoanList_Map.containsKey(personId)){
                            NO_of_loan= NO_of_loan+1;
                        }
                    }
                }
                Agent_LoanAmt_Secured_Map.put(personId,Sum_Amt);
                Agent_NOOFLoan_Secured_Map.put(personId,NO_of_loan);
               
            }
            system.debug('Agent_NOOFLoan_Secured_Map>>'+Agent_NOOFLoan_Secured_Map);
            system.debug('Agent_LoanAmt_Secured_Map>>'+Agent_LoanAmt_Secured_Map);
        /****** get incentive mapping from mothns and create sales incentive record *******/
            Map<Integer,String> monthMap = new Map<Integer,String>();
            monthMap.put(1, 'January'); monthMap.put(2, 'February');
            monthMap.put(3, 'March'); monthMap.put(4, 'April');
            monthMap.put(5, 'May'); monthMap.put(6, 'June');
            monthMap.put(7, 'july'); monthMap.put(8, 'August');
            monthMap.put(9, 'September'); monthMap.put(10, 'October');
            monthMap.put(11, 'November'); monthMap.put(12, 'December');
           
            
           Map<id,Sales_Incentive__c> Agent_IncentiveMap = new Map<id,Sales_Incentive__c>();
            String year = string.valueOf(System.today().Year());
             List<Sales_Incentive__c> IncentivesList=[select id ,Salesperson_Agent__c,Month__c,Year__c from Sales_Incentive__c where Month__c=:premnth AND Year__c=:year and Salesperson_Agent__c=:Agent_LoanAmt_Secured_Map.keyset()];
            if(IncentivesList != null && IncentivesList.size()>0){
                for (Sales_Incentive__c Siduplicate :IncentivesList){
                Agent_SalesIncentive_Map.put(Siduplicate.Salesperson_Agent__c,Siduplicate.Id);
              }
          }
            
            for(id personId:Agent_LoanAmt_Secured_Map.keyset()){
               double TotalDisbrusamt=Agent_LoanAmt_Secured_Map.get(personId);
                system.debug('TotalDisbrusamt>>'+TotalDisbrusamt);
                if(TotalDisbrusamt>500000 ){
                    
                    Sales_Incentive__c incent = new Sales_Incentive__c();
                    if(Agent_SalesIncentive_Map.containsKey(personId)){
                        incent.id=Agent_SalesIncentive_Map.get(personId);
                        system.debug('incent.id-->'+incent.id);
                    }
                    incent.Salesperson_Agent__c = personId;
                    incent.Month__c = monthMap.get(system.today().month());
                    incent.Year__c = string.valueOf(system.today().Year());
                    incent.Incentive_for_Rural_Secured_Loans__c = 0.007*Agent_LoanAmt_Secured_Map.get(personId);
                    Agent_IncentiveMap.put(incent.Salesperson_Agent__c, incent);
                    system.debug(' Agent_IncentiveMap>>'+ Agent_IncentiveMap);
                }
            }
         if(Agent_IncentiveMap != null && Agent_IncentiveMap.size()>0){
                try{
                    upsert Agent_IncentiveMap.values();
                }
                catch(dmlException ex){
                    system.debug('error: '+ex.getLineNumber() +'>> '+ ex.getMessage());
                }
            }
            
        }

         if(Agent_UnSecuredLoanList_Map!=null && !Agent_UnSecuredLoanList_Map.isEmpty()){
             String year = string.valueOf(System.today().Year());
              List<Sales_Incentive__c> IncentivesList=[select id ,Salesperson_Agent__c,Month__c,Year__c from Sales_Incentive__c where Month__c=:premnth AND Year__c=:year and Salesperson_Agent__c=:Agent_UnSecuredLoanList_Map.keyset()];
            if(IncentivesList != null && IncentivesList.size()>0){
                for (Sales_Incentive__c Siduplicate :IncentivesList){
                Agent_SalesIncentive_Map.put(Siduplicate.Salesperson_Agent__c,Siduplicate.Id);
              }
          }
        //calculate Number of Disbursal Amount and total no account of all loan accounts against each agent for Lead - Rural Udyam
        for(id personId:Agent_UnSecuredLoanList_Map.keyset()){
                Double Sum_Amt = 0;
                Double NO_of_loan= 0;
                for(Loan_Account__c la:Agent_UnSecuredLoanList_Map.get(personId)){
                    if(la.Disbursal_Amount__c != null){
                        
                        Sum_Amt = Sum_Amt+la.Disbursal_Amount__c;
                        if(Agent_UnSecuredLoanList_Map.containsKey(personId)){
                            NO_of_loan= NO_of_loan+1;
                        }
                    }
                }
                Agent_LoanAmt_UnSecured_Map.put(personId,Sum_Amt);
               Agent_NOOFLoan_UnSecured_Map.put(personId,NO_of_loan);
            }
            
            system.debug('Agent_LoanAmt_UnSecured_Map>>'+Agent_LoanAmt_UnSecured_Map);
        /****** get incentive mapping from mothns and create sales incentive record *******/
            Map<Integer,String> monthMap = new Map<Integer,String>();
            monthMap.put(1, 'January'); monthMap.put(2, 'February');
            monthMap.put(3, 'March'); monthMap.put(4, 'April');
            monthMap.put(5, 'May'); monthMap.put(6, 'June');
            monthMap.put(7, 'july'); monthMap.put(8, 'August');
            monthMap.put(9, 'September'); monthMap.put(10, 'October');
            monthMap.put(11, 'November'); monthMap.put(12, 'December');
           Map<id,Sales_Incentive__c> Agent_IncentiveMap = new Map<id,Sales_Incentive__c>();
             
            for(id personId:Agent_LoanAmt_UnSecured_Map.keyset()){
              
               double TotalDisbrusamt=Agent_LoanAmt_UnSecured_Map.get(personId);
                double TotalNoLoan=Agent_NOOFLoan_UnSecured_Map.get(personId);
                if(TotalNoLoan<=4 ){
                   
                    Sales_Incentive__c incent = new Sales_Incentive__c();
                    if(Agent_SalesIncentive_Map.containsKey(personId)){
                        incent.id=Agent_SalesIncentive_Map.get(personId);
                        system.debug('incent.id-->'+incent.id);
                    }
                    incent.Salesperson_Agent__c = personId;
                    incent.Month__c = monthMap.get(system.today().month());
                    incent.Year__c = string.valueOf(system.today().Year());
                    incent.Incentive_for_Rural_Unsecured_Loans__c = 0.00;
                    Agent_IncentiveMap.put(incent.Salesperson_Agent__c, incent);
                    
                }
                else if(TotalNoLoan<=5 && TotalNoLoan<=6 ){
                   
                    Sales_Incentive__c incent = new Sales_Incentive__c();
                    if(Agent_SalesIncentive_Map.containsKey(personId)){
                        incent.id=Agent_SalesIncentive_Map.get(personId);
                        system.debug('incent.id-->'+incent.id);
                    }
                    incent.Salesperson_Agent__c = personId;
                    incent.Month__c = monthMap.get(system.today().month());
                    incent.Year__c = string.valueOf(system.today().Year());
                    incent.Incentive_for_Rural_Unsecured_Loans__c = 0.0080*Agent_LoanAmt_UnSecured_Map.get(personId);
                    Agent_IncentiveMap.put(incent.Salesperson_Agent__c, incent);
                }
               else if(TotalNoLoan<=7 && TotalNoLoan<=8  ){
                   
                    Sales_Incentive__c incent = new Sales_Incentive__c();
                   if(Agent_SalesIncentive_Map.containsKey(personId)){
                        incent.id=Agent_SalesIncentive_Map.get(personId);
                        system.debug('incent.id-->'+incent.id);
                    }
                    incent.Salesperson_Agent__c = personId;
                    incent.Month__c = monthMap.get(system.today().month());
                    incent.Year__c = string.valueOf(system.today().Year());
                    incent.Incentive_for_Rural_Unsecured_Loans__c = 0.0085*Agent_LoanAmt_UnSecured_Map.get(personId);
                    Agent_IncentiveMap.put(incent.Salesperson_Agent__c, incent);
                }
                else if(TotalNoLoan>=8  ){
                   
                    Sales_Incentive__c incent = new Sales_Incentive__c();
                    if(Agent_SalesIncentive_Map.containsKey(personId)){
                        incent.id=Agent_SalesIncentive_Map.get(personId);
                        system.debug('incent.id-->'+incent.id);
                    }
                    incent.Salesperson_Agent__c = personId;
                    incent.Month__c = monthMap.get(system.today().month());
                    incent.Year__c = string.valueOf(system.today().Year());
                    incent.Incentive_for_Rural_Unsecured_Loans__c = 0.0090*Agent_LoanAmt_UnSecured_Map.get(personId);
                    Agent_IncentiveMap.put(incent.Salesperson_Agent__c, incent);
                }
            }
         if(Agent_IncentiveMap != null && Agent_IncentiveMap.size()>0){
                try{
                    upsert Agent_IncentiveMap.values();
                }
                catch(dmlException ex){
                    system.debug('error: '+ex.getLineNumber() +'>> '+ ex.getMessage());
                }
            }
            
        }        
         
    }   
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
        Database.executeBatch(new SalesIncentiveBatchForUnsecured(),200); 
    }
}
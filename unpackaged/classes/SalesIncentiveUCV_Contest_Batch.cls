global class SalesIncentiveUCV_Contest_Batch implements Database.batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        Integer mnth = System.Today().MOnth();
        Integer yr = System.Today().Year();
        String Product = 'Lead - UCV';
        String query = 'Select Id,Disbursal_Amount__c,Disbursal_Date__c,name,ROI__c,DSA_Connector__c,OwnerId,Applicant__r.Product__c From Loan_Account__c WHERE Applicant__r.Product__c=\''+String.escapeSingleQuotes(Product)+'\' and CALENDAR_MONTH(Disbursal_Date__c) =:mnth and CALENDAR_YEAR(Disbursal_Date__c) =:yr';
        system.debug(query);
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Loan_Account__c> scope){
        system.debug('List: '+scope);
        Incentive_Setup__mdt[] Inc = [select Incentive__c,Start_Date__c,End_Date__c from Incentive_Setup__mdt where Product__c ='Lead - UCV' AND Type__c ='Salesperson' AND Sourcing__c ='Direct' AND Active__c=true AND RecordType__c='Contest'LIMIT 1];
        if(Inc[0] !=null && Inc[0].Start_Date__c!=null && Inc[0].End_Date__c !=null){
            Map<Integer,String> monthMap = new Map<Integer,String>();
            monthMap.put(1, 'January'); monthMap.put(2, 'February');
            monthMap.put(3, 'March'); monthMap.put(4, 'April');
            monthMap.put(5, 'May'); monthMap.put(6, 'June');
            monthMap.put(7, 'july'); monthMap.put(8, 'August');
            monthMap.put(9, 'September'); monthMap.put(10, 'October');
            monthMap.put(11, 'November'); monthMap.put(12, 'December');
            
            Map<id,List<Loan_Account__c>> Agent_UCVLoanList_Map = new Map<id,List<Loan_Account__c>>();
            Map<id,Decimal> Agent_WIRR_UCV_DS_Map = new Map<id,Decimal>();
            Map<id,Decimal> Agent_WIRR_UCV_NDS_Map = new Map<id,Decimal>();
            Map<id,Decimal> Agent_TotalLoanAmt_UCV_Map = new Map<id,Decimal>();
            Map<id,Decimal> Agent_LoanAmt_UCV_DS_Map = new Map<id,Decimal>();
            Map<id,Decimal> Agent_LoanAmt_UCV_NDS_Map = new Map<id,Decimal>();
            
            for(Loan_Account__c Loan:scope){
                if(Loan.Disbursal_Date__c <=Inc[0].End_Date__c && Loan.Disbursal_Date__c >=Inc[0].Start_Date__c){
                    if(Agent_UCVLoanList_Map.get(loan.OwnerId)==null){
                        Agent_UCVLoanList_Map.put(loan.OwnerId,new List<Loan_Account__c>{loan});
                    }else{
                        Agent_UCVLoanList_Map.get(loan.OwnerId).add(loan);
                    }
                }
            }
            
            //calculate wirr of all loan accounts against each agent
            for(id personId:Agent_UCVLoanList_Map.keyset()){
                Decimal Amt_ROI_Mul_Direct = 0;
                Decimal Amt_ROI_Mul_NonDirect = 0;
                Decimal Sum_Amt_Direct = 0;
                Decimal Sum_Amt_NonDirect = 0;
                
                for(Loan_Account__c la:Agent_UCVLoanList_Map.get(personId)){
                    if(la.Disbursal_Amount__c != null && la.ROI__c !=null){
                        if(la.DSA_Connector__c == null && la.Disbursal_Amount__c !=null && la.ROI__c !=null){
                            Amt_ROI_Mul_Direct = Amt_ROI_Mul_Direct + (la.Disbursal_Amount__c * la.ROI__c);
                            Sum_Amt_Direct = Sum_Amt_Direct +la.Disbursal_Amount__c;
                            system.debug('loan: '+la.Name);
                        }else if(la.DSA_Connector__c != null && la.Disbursal_Amount__c !=null && la.ROI__c !=null){
                            system.debug('loan: '+la.Name);
                            Amt_ROI_Mul_NonDirect = Amt_ROI_Mul_NonDirect + (la.Disbursal_Amount__c * la.ROI__c);
                            Sum_Amt_NonDirect = Sum_Amt_NonDirect+la.Disbursal_Amount__c;
                        }
                    }
                }
                Agent_LoanAmt_UCV_DS_Map.put(personId,Sum_Amt_Direct);
                Agent_LoanAmt_UCV_NDS_Map.put(personId,Sum_Amt_NonDirect);
                Decimal Sum_Amt = Sum_Amt_Direct+Sum_Amt_NonDirect;
                Agent_TotalLoanAmt_UCV_Map.put(personId,Sum_Amt.SetScale(2));
                if(Amt_ROI_Mul_Direct !=0 && Sum_Amt_Direct !=0)
                    Agent_WIRR_UCV_DS_Map.put(personId,Amt_ROI_Mul_Direct/Sum_Amt_Direct);
                if(Amt_ROI_Mul_NonDirect !=0 && Sum_Amt_NonDirect !=0)
                    Agent_WIRR_UCV_NDS_Map.put(personId,Amt_ROI_Mul_NonDirect/Sum_Amt_NonDirect);
            }
            system.debug('Agent_WIRR_UCV_DS_Map>>'+Agent_WIRR_UCV_DS_Map);
            system.debug('Agent_WIRR_UCV_NDS_Map>>'+Agent_WIRR_UCV_NDS_Map);
            system.debug('Agent_TotalLoanAmt_UCV_Map>>'+Agent_TotalLoanAmt_UCV_Map);
            //WIRR Calculation ended
            
            //Map of user and role name
            Map<id,string> Agent_Role_Map = new Map<id,string>();
            for(user u:[select id, UserRole.Name FROM User WHERE id=:Agent_UCVLoanList_Map.keyset()]){
                if(String.isNotBlank(u.UserRole.Name))
                    Agent_Role_Map.put(u.id,u.UserRole.Name);
            }
            
            //Check for already created incentive for agents
            Map<id,Sales_Incentive__c> Agent_SalesIncentive_Map = new Map<id,Sales_Incentive__c>();
            String year = string.valueOf(System.today().Year());
            List<Sales_Incentive__c> IncentivesList = [select id,Salesperson_Agent__c from Sales_Incentive__c where Salesperson_Agent__c 
                                                       =:Agent_UCVLoanList_Map.keyset() and Month__c=:monthMap.get(System.Today().Month()) AND Year__c=:year];
            if(IncentivesList != null && IncentivesList.size()>0){
                for(Sales_Incentive__c si:IncentivesList){
                    Agent_SalesIncentive_Map.put(si.Salesperson_Agent__c,si);
                }
            }
            
            /****** get incentive mapping from metadata and create sales incentive record *******/
            Map<id,Decimal> Agent_TotalIncentive = new Map<id,Decimal>();
            // Direct Sourcing
            Decimal Direct_Sourcing_Incentive = 0;
            for(id personId:Agent_WIRR_UCV_DS_Map.keyset()){
                system.debug('person: '+personId);
                Decimal WIRR = Agent_WIRR_UCV_DS_Map.get(personId);
                system.debug('WIRR: '+WIRR);
                string RoleName = Agent_Role_Map.get(personId);
                system.debug('RoleName: '+RoleName);
                Decimal LoanAmount = Agent_TotalLoanAmt_UCV_Map.get(personId);
                system.debug('LoanAmount: '+LoanAmount);
                List<Incentive_Setup__mdt> Incentive = [select Incentive__c from Incentive_Setup__mdt where WIRR_Lower_Limit__c <=: WIRR AND WIRR_Higher_Limit__c >=: WIRR AND Product__c ='Lead - UCV' AND Type__c ='Salesperson'
                                                        AND Eligible_Role__c=:RoleName AND Minimum_Amount__c <:LoanAmount AND Maximum_Amount__c >=:LoanAmount AND Sourcing__c ='Direct' AND Active__c=true AND RecordType__c='Contest'];
                if(Incentive != null && Incentive.size()>0 && Incentive[0].Incentive__c !=null){
                    system.debug('metadata id: '+Incentive[0].id+'inc: '+Incentive[0].Incentive__c);
                    Direct_Sourcing_Incentive = 0.01*Incentive[0].Incentive__c*Agent_LoanAmt_UCV_DS_Map.get(personId);
                    Agent_TotalIncentive.put(personId,Direct_Sourcing_Incentive);
                }
            }
            // Non Direct Sourcing
            Decimal NonDirect_Sourcing_Incentive = 0;
            for(id personId:Agent_WIRR_UCV_NDS_Map.keyset()){
                Decimal WIRR = Agent_WIRR_UCV_NDS_Map.get(personId);
                string RoleName = Agent_Role_Map.get(personId);
                Decimal LoanAmount = Agent_TotalLoanAmt_UCV_Map.get(personId);
                List<Incentive_Setup__mdt> Incentive = [select Incentive__c from Incentive_Setup__mdt where WIRR_Lower_Limit__c <=: WIRR AND WIRR_Higher_Limit__c >=: WIRR AND Product__c ='Lead - UCV' AND Type__c ='Salesperson'
                                                        AND Eligible_Role__c=:RoleName AND Minimum_Amount__c <:LoanAmount AND Maximum_Amount__c >:LoanAmount AND Sourcing__c ='Non Direct' AND Active__c=true AND RecordType__c='Contest'];
                if(Incentive != null && Incentive.size()>0 && Incentive[0].Incentive__c !=null){
                    system.debug('metadata id: '+Incentive[0].id+'inc: '+Incentive[0].Incentive__c);
                    NonDirect_Sourcing_Incentive = 0.01*Incentive[0].Incentive__c*Agent_LoanAmt_UCV_NDS_Map.get(personId);
                    if(Agent_TotalIncentive.containsKey(personId)){
                        Agent_TotalIncentive.put(personId,Agent_TotalIncentive.get(personId)+NonDirect_Sourcing_Incentive);
                    }else{
                        Agent_TotalIncentive.put(personId,NonDirect_Sourcing_Incentive);
                    }
                }
            }
            
            for(id personId:Agent_TotalIncentive.keyset()){
                if(Agent_SalesIncentive_Map.containskey(personId)){
                    Agent_SalesIncentive_Map.get(personId).Contest_Incentive_for_UCV__c=Agent_TotalIncentive.get(personId);
                }else{
                    Sales_Incentive__c incent = new Sales_Incentive__c();
                    incent.Salesperson_Agent__c = personId;
                    incent.Month__c = monthMap.get(system.today().month());
                    incent.Year__c = string.valueOf(system.today().Year());
                    incent.Contest_Incentive_for_UCV__c=Agent_TotalIncentive.get(personId);
                    Agent_SalesIncentive_Map.put(personId,incent);
                }
                /*Incentive added for UCV Loans*/
                
                
            }
            if(Agent_SalesIncentive_Map != null && Agent_SalesIncentive_Map.size()>0){
                try{
                    upsert Agent_SalesIncentive_Map.values();
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
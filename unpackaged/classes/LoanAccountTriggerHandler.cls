public class LoanAccountTriggerHandler {
    
    public static void CreateCollectionTask(Set<Id> LoanAccIdSet,Map<Id,Loan_Account__c>OldMap,Map<Id,Loan_Account__c>NewMap){
        List<Collection_Task__c> tasksList = new List<Collection_Task__c>();
        List<Collection_Task__c> updatetasksList = new List<Collection_Task__c>();
        List<Loan_Account__c> LoanAccList = [SELECT id, Applicant__c,Applicant__r.OwnerId,DPD__c,EMI_Overdue_Amount__c,LOAN_STATUS__c,Other_Overdue_Amount__c FROM Loan_Account__c WHERE id=:LoanAccIdSet]; 
        list<Collection_Task__c>collectionlistcompleted=[SELECT id,Loan_Account__c,Name,Status__c from Collection_Task__c where Loan_Account__c=:LoanAccIdSet and (Status__c=:'Complete - Fully Recovered' or Status__c=:'Complete - Overdue amount Pending')];
        list<Collection_Task__c>collectionlistpending=[SELECT id,Loan_Account__c,Name,Status__c from Collection_Task__c where Loan_Account__c=:LoanAccIdSet and Status__c=:'Pending'];
        Group groupDetail =[select id, Name from Group where Type = 'Queue'];
        Integer AmountDpd;
        Integer Initaltoatlamount;
        if(LoanAccList != null && LoanAccList.size()>0 ){
            for(Loan_Account__c la:LoanAccList){
                if(la.DPD__c!=Oldmap.get(la.Id).DPD__c || la.EMI_Overdue_Amount__c!=Oldmap.get(la.Id).EMI_Overdue_Amount__c || la.Other_Overdue_Amount__c!=Oldmap.get(la.Id).Other_Overdue_Amount__c){
                    if(AmountDpd==null  && Initaltoatlamount==null && la.EMI_Overdue_Amount__c!=null && la.DPD__c!=null && (la.Other_Overdue_Amount__c!=null ||la.Other_Overdue_Amount__c==null) && la.LOAN_STATUS__c=='Disbursed'){
                        AmountDpd= Integer.valueOf(la.DPD__c);
                        if(la.EMI_Overdue_Amount__c!=null && la.Other_Overdue_Amount__c!=null ){
                            Initaltoatlamount= Integer.valueOf(la.EMI_Overdue_Amount__c)+Integer.valueOf(la.Other_Overdue_Amount__c);
                        }else if(la.Other_Overdue_Amount__c==null && la.EMI_Overdue_Amount__c!=null){
                            Initaltoatlamount= Integer.valueOf(la.EMI_Overdue_Amount__c);
                        }
                    }  
                }
                // if any pending record created on collection task already 
                if(!collectionlistpending.isEmpty()){
                    for(Collection_Task__c coll:collectionlistpending){
                        if(coll.Status__c=='Pending'){
                            coll.Loan_Account__c = la.id;
                            coll.Initial_Total_Amount_To_Be_Recovered__c=Initaltoatlamount;
                            coll.EMI_Overdue_Amount__c=la.EMI_Overdue_Amount__c;
                            if(la.Other_Overdue_Amount__c!=null){
                                coll.Other_Overdue_Amount__c=la.Other_Overdue_Amount__c; 
                            }
                            else if(la.Other_Overdue_Amount__c==null){
                                coll.Other_Overdue_Amount__c=0;
                            }
                            
                            updatetasksList.add(coll);
                        }
                        
                    }
                }
                //if collection task create on loan with all the value as completed
                if(!collectionlistcompleted.isEmpty() && collectionlistpending.isEmpty()){
                    if(la.LOAN_STATUS__c=='Disbursed' && AmountDpd > 0){
                        Collection_Task__c ct = new Collection_Task__c();
                        ct.Loan_Account__c = la.id;
                        if(la.Applicant__c != null)
                            ct.Customer__c = la.Applicant__c;
                        ct.Status__c = 'Pending';
                        ct.Assigned_Date__c = system.today();
                        ct.Initial_Total_Amount_To_Be_Recovered__c=Initaltoatlamount;
                        ct.EMI_Overdue_Amount__c=la.EMI_Overdue_Amount__c;
                        if(la.Other_Overdue_Amount__c!=null){
                            ct.Other_Overdue_Amount__c=la.Other_Overdue_Amount__c; 
                        }
                        else if(la.Other_Overdue_Amount__c==null){
                            ct.Other_Overdue_Amount__c=0;
                        }
                        
                        tasksList.add(ct);
                    }   
                } 
                
                //no collection task is created yet for loan account
                
                if(collectionlistcompleted.isEmpty() && collectionlistpending.isEmpty()){
                    if(la.LOAN_STATUS__c=='Disbursed' && AmountDpd > 0){
                        Collection_Task__c ct = new Collection_Task__c();
                        ct.Loan_Account__c = la.id;
                        if(la.Applicant__c != null)
                            ct.Customer__c = la.Applicant__c;
                        ct.Status__c = 'Pending';
                        ct.Assigned_Date__c = system.today();
                        ct.Initial_Total_Amount_To_Be_Recovered__c=Initaltoatlamount;
                        ct.EMI_Overdue_Amount__c=la.EMI_Overdue_Amount__c;
                        ct.OwnerId=groupDetail.id;
                        if(la.Other_Overdue_Amount__c!=null){
                            ct.Other_Overdue_Amount__c=la.Other_Overdue_Amount__c; 
                        }
                        else if(la.Other_Overdue_Amount__c==null){
                            ct.Other_Overdue_Amount__c=0;
                        }
                        
                        tasksList.add(ct);
                    } 
                }
                
            }
            if(tasksList != null && tasksList.size()>0){
                try{
                    insert tasksList;
                }
                catch(exception e){
                    system.debug('error: '+e.getMessage());
                }
            }
            if(updatetasksList != null && updatetasksList.size()>0){
                try{
                    upsert updatetasksList;
                }
                catch(exception e){
                    system.debug('error: '+e.getMessage());
                }
            }
        }
        
    }
    
}
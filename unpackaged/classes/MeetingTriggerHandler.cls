public class MeetingTriggerHandler {
    public static void validationcheckonReScheduled(Map<Id,Meeting__c> OldMap,Map<Id,Meeting__c> NewMap){
        for(Meeting__c ma:newMap.values()){
            datetime da=system.now();
            if(ma.Status__c=='Re-Scheduled' && Oldmap.get(ma.Id).Status__c!='Re-Scheduled' && Oldmap.get(ma.Id).Scheduled_Start_Time__c==ma.Scheduled_Start_Time__c){
                ma.addError('Please enter a new Scheduled Start Time');
            }
            if(ma.Status__c!='Completed' && Oldmap.get(ma.Id).Status__c=='Completed'){
                ma.addError('Status of completed meetings cannot be changed');
            }
            
            if(ma.Status__c=='Scheduled' && Oldmap.get(ma.Id).Status__c=='Scheduled'){
                if(da>=ma.Scheduled_Start_Time__c){
                    ma.addError('Scheduled Meeting can not be added in back date');
                }  
            }
            if(ma.Status__c=='Completed' ){
                
                if(ma.Type__c!=Oldmap.get(ma.Id).Type__c || ma.Category__c!=Oldmap.get(ma.Id).Category__c || ma.Meeting_Outcome__c!=Oldmap.get(ma.Id).Meeting_Outcome__c
                  || ma.Salesperson__c!=Oldmap.get(ma.Id).Salesperson__c || ma.OwnerId!=Oldmap.get(ma.Id).OwnerId||ma.Scheduled_Start_Time__c!=Oldmap.get(ma.Id).Scheduled_Start_Time__c
                  || ma.Scheduled_End_Time__c!=Oldmap.get(ma.Id).Scheduled_End_Time__c || ma.Scheduled_End_Time__c!=Oldmap.get(ma.Id).Scheduled_End_Time__c
                  || ma.Applicant__c!=Oldmap.get(ma.Id).Applicant__c || ma.Loan_Account__c!=Oldmap.get(ma.Id).Loan_Account__c || ma.Collection_Task__c!=Oldmap.get(ma.Id).Collection_Task__c ||
                   ma.DSA_Connector__c!=Oldmap.get(ma.Id).DSA_Connector__c) 
                  {
                 
                    
                    ma.addError('On Completed Stage We Can Not Update Type,Category,Purpose,Salesperson,Owner,Scheduled Start Time,Scheduled End Time,Applicant,Collection Task,Loan Account,DSA/Connector');
            }
                
            }
               
            }
            
            
        }
    
    public static void Ownerupdateoninsert(List<Meeting__c> newmeeting){
        for(Meeting__c ma:newmeeting){
            if(ma.Salesperson__c!=null){              
                   ma.OwnerId=ma.Salesperson__c;           
            
         }
      }
    }
    
     public static void Ownerupdate(List<Meeting__c> newmeeting,Map<Id,Meeting__c> OldMap){
        for(Meeting__c ma:newmeeting){
            if(ma.Salesperson__c!=null && Oldmap.get(ma.Id).Salesperson__c!=ma.Salesperson__c){              
                   ma.OwnerId=ma.Salesperson__c;           
            
         }
      }
    }
    
}
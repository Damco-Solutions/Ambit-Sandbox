public class RefreshBatchStatus {
    @AuraEnabled
    public static Batch_Log__c getAPIError(string recordId){
        system.debug('recordId '+recordId);
        Batch_Log__c obj=new Batch_Log__c();
        Batch_Log__c[] groupedResults = [SELECT Id, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Batch_Id__c, Status__c, Message__c, Error_details__c, Applicant__c, MessageViewed__c FROM Batch_Log__c where Applicant__c=:recordId and MessageViewed__c=false order by createddate desc limit 1];
       if(!groupedResults.isEmpty())
       {
           obj=groupedResults[0];
           obj.MessageViewed__c=true;
           update obj;
       }
        
        return  obj ;
    }
    
}
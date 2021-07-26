@istest
public class MeetingFeedback_CTR_Test {
    Public static testmethod void Meetingrating_Method(){
        string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string product='Lead - VYAPAR (SECURED LOAN)';
        string dsaorconnector='DSA';
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        
        // create the User
        user u1=TestDataFactory.CreateUser();
        
        system.runAs(u1){
            // create the Dsa Account
            Account acc=TestDataFactory.CreateAccount(accrecordtypeid, dsaorconnector);
            
            // create the applicant-1 
            Contact c1=TestDataFactory.CreateApplicantbulk(recordtypeid, product,true);
            
            //create the meeting
            
            Meeting__c ma= new Meeting__c();
            ma.Category__c='New Customer';
            ma.Status__c='Scheduled';
            ma.Type__c='Meeting';
            ma.Scheduled_Start_Time__c=system.now()+2;
            ma.OwnerId=u1.id;
            ma.Applicant__c=c1.Id;
            ma.Meeting_Outcome__c='Lead Generation( DSA )';
            
            insert ma;
  
            ma.Meeting_Details__c='Customer Interested';
            ma.Status__c='Completed';
            update ma;
            
            test.startTest();
            ApexPages.currentPage().getParameters().put('id', String.valueOf(ma.Id));
            MeetingFeedback_CTR testctr= new MeetingFeedback_CTR();
            testctr.InitPage();
            testctr.rating=4;
            testctr.save();
            test.stopTest();
            
        }
    }
}
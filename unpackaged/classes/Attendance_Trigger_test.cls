@isTest
public class Attendance_Trigger_test {
  public static testmethod void test1(){
      
      Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u = new User(Alias = 'standt', Email='demouser1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='demouser1@damcogroup.com.ambit');
        insert u;
      
      Attendance__c atten = new Attendance__c();
      atten.Date__c=system.today();
      atten.High_Level_Work_Plan__c='test plan';
      atten.OwnerId=u.id;
       insert atten;
      
      
  }
}
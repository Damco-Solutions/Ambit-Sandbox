@istest
public class Achievement_Trigger_Test {
    public static testmethod void test1(){
        
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u = new User(Alias = 'standt', Email='demouser1@damcogroup.com',
                          EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='demouser1@damcogroup.com.ambit');
        insert u;
        Achievement__c ac= new Achievement__c();
        ac.Meeting_Achievement__c=10;
        ac.Lead_Generation_Achieved__c=5;
        ac.No_of_Files_Logged_In_Achieved__c=4;
        ac.User__c=u.id;
        
        insert ac;
        
        ac.Net_PF_Achieved__c=1.2;
        ac.IRR_Achieved__c=17;
        
        update ac;
        
    }
}
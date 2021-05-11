@isTest
public class SalePlanTrigger_Test {
    public static testmethod void test1(){
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u = new User(Alias = 'standt', Email='demouser1@damcogroup.com',
                          EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='demouser1@damcogroup.com.ambit');
        insert u;
        
        Sales_Plan__c sal = new Sales_Plan__c();
        sal.Month__c='March';
        sal.Plan_Type__c='Weekly';
        sal.No_Of_Lead__c=2;
        sal.No_of_disbursement__c=3;
        sal.No_of_Logins__c=3;
        sal.Week__c='2';
        sal.Year__c='2021';
        sal.No_of_login_value__c=150000;
        sal.volume_of_disbursement__c=12000;
        
        insert sal;
        
    }
}
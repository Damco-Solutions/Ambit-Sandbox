@isTest
public class SaleIncentive_Trigger_Test {
    public static testmethod void test1(){
      
      Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u = new User(Alias = 'standt', Email='demouser1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='demouser1@damcogroup.com.ambit');
        insert u;
      
      Sales_Incentive__c sa = new Sales_Incentive__c();
        sa.Incentive_for_Secured_Loans__c=1234.00;
       sa.Incentive_for_Unsecured_Loans__c=25000.00;
       insert sa;
      
      
  }

}
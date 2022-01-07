@isTest
public class Achievement_UserStaticsTest {
    public static TestMethod void doTest()
    {
        test.startTest();
        // User testUser= TestDataFactory.CreateUser();
        //  
        //   
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u = new User(Alias = 'standt', Email='demouser1@damcogroup.com',
                          EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='demouser1@damcogroup.com.ambit');
        insert u;
        Achievement__c Achievement= TestDataFactory.createAchievement(true, u.Id);

         RecursionHelper.disableRecursion=false;
       //Achievement_User_StatisticsHelper.insertUser_Statistics=null;
       Achievement__c Achievement1= TestDataFactory.createAchievement(true, u.Id);
        
        Sales_Plan__c testSales_Plan= TestDataFactory.createSales_Plan(true, u.Id);
        update testSales_Plan;
        test.stopTest();
        
    }
    
}
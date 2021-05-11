@isTest
public class SalesIncentiveUCV_Batch_Test {
    public static testmethod void testUCVDirect(){
        
        id RecordType = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        Contact c = TestDataFactory.CreateApplicant(RecordType,'Lead - UCV',system.today(),5000000,17);
        Loan_Account__c la2 =TestDataFactory.CreatLoanAccount(c.id,false);
         la2.Disbursal_Amount__c=6100000;
         la2.ROI__c=17;
         insert la2;
         UserRole ur = new UserRole(Name ='Sales Manager-UCV ');
        
        Profile pf = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
       
       
        
        User u = new User(Alias = 'standt', Email='demouser1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = pf.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='demouser1@damcogroup.com.ambit',
                           UserRoleId = ur.id);
        insert u;
         system.debug('user role-->'+u.UserRoleId);
        System.runAs(u){
          Test.startTest();
        SalesIncentiveUCV_Batch obj = new SalesIncentiveUCV_Batch();
        DataBase.executeBatch(obj); 
        Test.stopTest();    
        }
          
    }
    
    public static testmethod void testUCVNonDirect(){
        id AccRecordType = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        // create a Dsa account
        Account acc=TestDataFactory.CreateAccount(AccRecordType);
        id RecordType = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        // create Applicant
        Contact c = TestDataFactory.CreateApplicant(RecordType,'Lead - UCV',system.today(),5000000,17);
        // create Loan account
        Loan_Account__c la2 =TestDataFactory.CreatLoanAccount(c.id,false);
         la2.Disbursal_Amount__c=6100000;
         la2.ROI__c=17;
         la2.DSA_Connector__c=acc.Id;
         insert la2;
        Profile pf = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
       
        UserRole ur = new UserRole(Name ='Sales Manager-UCV ');
        
        User u = new User(Alias = 'standt', Email='demouser1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = pf.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='demouser1@damcogroup.com.ambit',
                           UserRoleId = ur.id);
        insert u;
        
        System.runAs(u){
            Test.startTest();
        SalesIncentiveUCV_Batch obj = new SalesIncentiveUCV_Batch();
        DataBase.executeBatch(obj); 
        Test.stopTest();  
            
        }
          
    }
   
}
@isTest
public class IncentiveBatchForUnsecuredContest_Test {
    Public static testmethod void UnSecuredMethod(){
        string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string product='Lead - UDYAM (UNSECURED LOAN)';
        string dsaorconnector='DSA';
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        
        // create the Dsa Account
        Account acc=TestDataFactory.CreateAccount(accrecordtypeid, dsaorconnector);
        
        // create the applicant-1 
        Contact c1=TestDataFactory.CreateApplicantbulk(recordtypeid, product,true);
        
        // create the applicant-2 
        Contact c2=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
        c2.FirstName = 'Test1';
        c2.LastName = 'Name1';
        c2.Email = 'test1@abc.com';
        c2.Phone = '865599442';
        insert c2;
        
        // create the applicant-3
        Contact c3=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
        c3.FirstName = 'Test2';
        c3.LastName = 'Name2';
        c3.Email = 'test2@abc.com';
        c3.Phone = '865599443';
        insert c3;
        
        // create the Loan Account 
        Loan_Account__c la1 =TestDataFactory.CreatLoanAccount(c1.id,false);
        la1.ROI__c=20;
        la1.DSA_Connector__c=acc.id;
        la1.Disbursal_Amount__c=500000;
        insert la1;
        
        // create the Loan Account 
        Loan_Account__c la2 =TestDataFactory.CreatLoanAccount(c2.id,false);
        la2.DSA_Connector__c=acc.id;
        la2.ROI__c=19;
        la2.Disbursal_Amount__c=600000;
        insert la2;
        
        // create the Loan Account 
        Loan_Account__c la3 =TestDataFactory.CreatLoanAccount(c1.id,false);
        la3.ROI__c=20;
        la3.DSA_Connector__c=acc.id;
        la3.Disbursal_Amount__c=700000;
        insert la3;   
        
        // create the User
        user u1=TestDataFactory.CreateUser();
        
        system.runAs(u1){
            Test.startTest();
            Incentive_Setup__mdt[] Incentive = [select Incentive__c,Minimum_File_Input__c,RecordType__c,Active__c,End_Date__c,Start_Date__c from Incentive_Setup__mdt where Product__c='Lead - UDYAM (UNSECURED LOAN)' AND Type__c ='Salesperson' AND Active__c=true AND RecordType__c='Contest'];
            SalesIncentiveBatchForUnsecuredContest obj = new SalesIncentiveBatchForUnsecuredContest();
            DataBase.executeBatch(obj); 
            Test.stopTest();  
            
        }
        
    } 

}
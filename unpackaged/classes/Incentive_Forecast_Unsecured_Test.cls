@isTest
public class Incentive_Forecast_Unsecured_Test {
     Public static testmethod void UnSecuredMethod(){
        string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string product='Lead - UDYAM (UNSECURED LOAN)';
        string dsaorconnector='DSA';
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        
        // create the Dsa Account
        Account acc=TestDataFactory.CreateAccount(accrecordtypeid, dsaorconnector);
        
        // create the applicant-1 
        Contact c1=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
         c1.FirstName = 'Test11';
        c1.LastName = 'Name11';
        c1.Email = 'test11@abc.com';
        c1.Phone = '8655994421';
        c1.Rate_Of_Interest__c=15;
        c1.Loan_Amount__c=150000;
        insert c1;
        
        // create the applicant-2 
        Contact c2=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
        c2.FirstName = 'Test1';
        c2.LastName = 'Name1';
        c2.Email = 'test1@abc.com';
        c2.Phone = '865599442';
        c2.Rate_Of_Interest__c=15;
         c2.Loan_Amount__c=150000;
        insert c2;
         // create the applicant-3 
        Contact c3=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
        c3.FirstName = 'Test3';
        c3.LastName = 'Name3';
        c3.Email = 'test3@abc.com';
        c3.Phone = '865599443';
         c3.Rate_Of_Interest__c=15;
         c3.Loan_Amount__c=150000;
        insert c3;
        
        
         // create the Loan Account 
        Loan_Account__c la1 =TestDataFactory.CreatLoanAccount(c1.id,false);
        la1.ROI__c=20;
        la1.DSA_Connector__c=acc.id;
        la1.Disbursal_Amount__c=null;
        la1.LOAN_STATUS__c='Applied';
        la1.Applicant__c=c1.id;
        insert la1;
        
       /* // create the Loan Account 
        Loan_Account__c la2 =TestDataFactory.CreatLoanAccount(c2.id,false);
        la2.DSA_Connector__c=acc.id;
        la2.ROI__c=19;
        la2.Disbursal_Amount__c=600000;
        la2.LOAN_STATUS__c='Applied';
        la2.Applicant__c=c2.id;
        insert la2;
        
        // create the Loan Account 
        Loan_Account__c la3 =TestDataFactory.CreatLoanAccount(c1.id,false);
        la3.ROI__c=20;
        la3.DSA_Connector__c=acc.id;
        la3.Disbursal_Amount__c=700000;
        la3.LOAN_STATUS__c='Applied';
        la3.Applicant__c=c3.id;
        insert la3;   
       */
          
        // create the User
        Profile pf = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
       
        UserRole ur = new UserRole(Name ='Sales Officer');
        
         User u = new User(Alias = 'standt', Email='demouser1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = pf.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='demouser1@damcogroup.com.ambit',Branch__c='Delhi',
                          CTC_Range_Max_In_Lakhs__c = 14,CTC_Range_Min_In_Lakhs__c = 12, UserRoleId = ur.id);
        insert u;
         
          Sales_Incentive__c sa = new Sales_Incentive__c();
          sa.Incentive_for_Secured_Loans__c=1234.00;
          sa.Incentive_for_Unsecured_Loans__c=25000.00;
          sa.OwnerId=u.id;
          insert sa;
         
        
        system.runAs(u){
            Test.startTest();
            Incentive_Setup__mdt[] Incentive = [select Incentive__c,Minimum_File_Input__c,RecordType__c,Active__c,End_Date__c,Start_Date__c from Incentive_Setup__mdt where Product__c='Lead - UDYAM (UNSECURED LOAN)' AND Type__c ='Salesperson'];
            Incentive_Forecast_Unsecured obj = new Incentive_Forecast_Unsecured();
            DataBase.executeBatch(obj); 
            Test.stopTest();  
            
        }

        
    } 

}
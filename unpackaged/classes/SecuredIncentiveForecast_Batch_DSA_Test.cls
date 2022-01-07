@isTest
public class SecuredIncentiveForecast_Batch_DSA_Test {
     Public static testmethod void Secured_Dsa_Method(){
        string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string product='Lead - VYAPAR (SECURED LOAN)';
        string dsaorconnector='DSA';
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        string connector='Connector';
        // create the Dsa Account
        Account acc=TestDataFactory.CreateAccount(accrecordtypeid, dsaorconnector);
        
         //creat the Connector account
         Account acc1=TestDataFactory.CreateAccount(accrecordtypeid, connector);
         
        // create the applicant-1 
        Contact c1=TestDataFactory.CreateApplicantbulk(recordtypeid, product,true);
        
        // create the applicant-2 
        Contact c2=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
        c2.FirstName = 'Test1';
        c2.LastName = 'Name1';
        c2.Email = 'test1@abc.com';
        c2.Phone = '865599442';
         c2.Loan_Amount__c=3500000;
         c2.Rate_Of_Interest__c=16;
        insert c2;
        
        // create the applicant-3
        Contact c3=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
        c3.FirstName = 'Test2';
        c3.LastName = 'Name2';
        c3.Email = 'test2@abc.com';
        c3.Phone = '865599443';
         c2.Rate_Of_Interest__c=15;
         c2.Loan_Amount__c=1500000;
        insert c3;
        
        // create the Loan Account 
        Loan_Account__c la1 =TestDataFactory.CreatLoanAccount(c1.id,false);
        la1.ROI__c=14;
         la1.Applicant__c=c1.Id;
         la1.Disbursal_Amount__c=null;
         la1.LOAN_STATUS__c='Applied';
        insert la1;
        
        // create the Loan Account 
        Loan_Account__c la2 =TestDataFactory.CreatLoanAccount(c2.id,false);
        la2.DSA_Connector__c=acc.id;
        la2.ROI__c=14.3;
         la2.Applicant__c=c2.id;
         la2.Disbursal_Amount__c=null;
         la2.LOAN_STATUS__c='Applied';
        insert la2;
        
        // create the Loan Account 
        Loan_Account__c la3 =TestDataFactory.CreatLoanAccount(c1.id,false);
        la3.ROI__c=15;
        la3.DSA_Connector__c=acc1.Id;
        la3.Applicant__c=c2.id;
         la3.Disbursal_Amount__c=null;
         la3.LOAN_STATUS__c='Applied';
        insert la3;   
        
        // create the User
         Profile pf = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
       
        UserRole ur = new UserRole(Name ='Sales Officer');
        
         User u = new User(Alias = 'standt', Email='demouser1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = pf.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='demouser1@damcogroup.com.ambit',Branch__c='Delhi',
                          CTC_Range_Max_In_Lakhs__c = 14,CTC_Range_Min_In_Lakhs__c = 12, UserRoleId = ur.id);
        insert u;
         
        system.runAs(u){
            Test.startTest();
            Incentive_Setup__mdt[] Incentive = [select Incentive__c from Incentive_Setup__mdt where (Sourcing__c = 'DSA'or Sourcing__c = 'Connector') and Product__c='Lead - VYAPAR (SECURED LOAN)' AND (Type__c ='Salesperson' or Type__c ='DSA' or Type__c ='Connector')];
            SecuredIncentiveForecast_Batch_DSA obj = new SecuredIncentiveForecast_Batch_DSA();
            DataBase.executeBatch(obj); 
            Test.stopTest();  
            
        }
    }


}
@isTest
public class SalesIncentiveRuralBatch_Test {
     Public static testmethod void SecuredMethod(){
         string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
         string product='Lead - Rural Vyapar';
         // create the applicant 
         Contact c1=TestDataFactory.CreateApplicant(recordtypeid, product);
         // create the Loan Account 
          Loan_Account__c la1 =TestDataFactory.CreatLoanAccount(c1.id,true);
         Loan_Account__c la2 =TestDataFactory.CreatLoanAccount(c1.id,false);
         la2.Disbursal_Amount__c=510000;
         insert la2;
         Test.startTest();
        SalesIncentiveRuralBatch obj = new SalesIncentiveRuralBatch();
        DataBase.executeBatch(obj); 
        Test.stopTest();    
     } 
     Public static testmethod void UnSecuredMethod(){
         string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
         string product='Lead - Rural Udyam';
        // create the applicant 
         Contact c=TestDataFactory.CreateApplicant(recordtypeid, product);
        // create the Loan Account 
          Loan_Account__c la =TestDataFactory.CreatLoanAccount(c.id,true);
         Test.startTest();
        SalesIncentiveRuralBatch obj = new SalesIncentiveRuralBatch();
        DataBase.executeBatch(obj); 
        Test.stopTest();
     }
      Public static testmethod void UnSecuredMethod5abv(){
          string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
         string product='Lead - Rural Udyam';
        // create the applicant 
         Contact c=TestDataFactory.CreateApplicant(recordtypeid, product);
        // create the Loan Account 
          Loan_Account__c la =TestDataFactory.CreatLoanAccount(c.id,true);
       list<Contact> c1 = new list<Contact>();
         for (integer i=0; i<=5;i++){
             Contact app = new Contact();
        app.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        app.FirstName = 'Test'+i;
        app.LastName = 'Name'+i;
        app.Email = 'test+i@abc.com';
        app.Phone = '86559944'+i;
        app.Product__c = 'Lead - Rural Udyam';
        app.CIBIL_ID__c = 'Passport Number';
        app.CIBIL_ID_Number__c = '123';
        app.status__c = 'Prospect';
             c1.add(app);
         }
        insert c1;
        list<Loan_Account__c> loan = new list<Loan_Account__c>();
         for(integer i=0 ;i<=c1.size()-i;i++){
        Loan_Account__c la1 = new Loan_Account__c();
        la1.Applicant__c = c1[i].id;
        la1.DPD__c=0;
        la1.Disbursal_Amount__c=50000;
        la1.Disbursal_Date__c=system.today();
        la1.LOAN_STATUS__c='Disbursed';
             loan.add(la1);
         }
         
        insert loan;
         Test.startTest();
        SalesIncentiveRuralBatch obj = new SalesIncentiveRuralBatch();
        DataBase.executeBatch(obj); 
        Test.stopTest();    
     }
    
    Public static testmethod void UnSecuredMethodfor6abov(){
        string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
         string product='Lead - Rural Udyam';
        // create the applicant 
         Contact c=TestDataFactory.CreateApplicant(recordtypeid, product);
        // create the Loan Account 
          Loan_Account__c la =TestDataFactory.CreatLoanAccount(c.id,true);
         
       list<Contact> c1 = new list<Contact>();
         for (integer i=0; i<=7;i++){
             Contact app = new Contact();
        app.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        app.FirstName = 'Test'+i;
        app.LastName = 'Name'+i;
        app.Email = 'test+i@abc.com';
        app.Phone = '86559944'+i;
        app.Product__c = 'Lead - Rural Udyam';
        app.CIBIL_ID__c = 'Passport Number';
        app.CIBIL_ID_Number__c = '123';
        app.status__c = 'Prospect';
             c1.add(app);
         }
        
        insert c1;
        
        list<Loan_Account__c> loan = new list<Loan_Account__c>();
         for(integer i=0 ;i<=c1.size()-i;i++){
        Loan_Account__c la1 = new Loan_Account__c();
        la1.Applicant__c = c1[i].id;
        la1.DPD__c=0;
        la1.Disbursal_Amount__c=50000;
        la1.Disbursal_Date__c=system.today();
        la1.LOAN_STATUS__c='Disbursed';
             loan.add(la1);
         }
         
        insert loan;
         
         Test.startTest();
        SalesIncentiveRuralBatch obj = new SalesIncentiveRuralBatch();
        DataBase.executeBatch(obj); 
        Test.stopTest();
         
        
     }       

}
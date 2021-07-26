@isTest
public class TestDataFactory {
    public static User CreateUser(){
         Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        UserRole ur = [select id,Name FROM UserRole WHERE Name ='Sales Manager-UCV'];
        //creating user
        User u = new User(Alias = 'standt', Email='demouser1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='demouser1@damcogroup.com.ambit',Branch__c='Delhi',
                          CTC_Range_Max_In_Lakhs__c = 14,CTC_Range_Min_In_Lakhs__c = 12, UserRoleId = ur.id);
        insert u;
        return u;
    }
    public static User CreateUser2(){
         Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        UserRole ur = [select id,Name FROM UserRole WHERE Name ='RSM / Zonal Sales Manager'];
        //creating user
        User u = new User(Alias = 'standt', Email='demouser2@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles',UserRoleId = ur.id, UserName='demouser2@damcogroup.com.ambit');
        insert u;
        return u;
    }
    public static Account CreateAccount(id recordTypeId,string dsaorconnector){
        Account acc = new Account();
        acc.RecordTypeId = recordTypeId;
        acc.FirstName = 'Test';
        acc.LastName = 'App';
        acc.Email__c = 'testmail@abc.com';
        acc.Phone = '6876875888';
        acc.DSA_Connector__c=dsaorconnector;
        insert acc;
        return acc;
    }
    public static Account CreateAaccountDsa(id recordTypeId,Boolean doInsert){
        Account acc = new Account();
        acc.RecordTypeId = recordTypeId;
        acc.FirstName = 'Test';
        acc.LastName = 'App';
        acc.Email__c = 'testmail@abc.com';
        acc.Phone = '6876875888';
        acc.DSA_Connector__c='DSA';
        if(doInsert)
        {
            insert acc;
        }
        return acc;
    }
    public static Contact CreateApplicant(id recordTypeId, String prouctType,Date DisbursalDate, integer DisbursalAmount, integer roi){
        Contact app = new Contact();
        app.RecordTypeId = recordTypeId;
        app.FirstName = 'Test';
        app.LastName = 'App';
        app.Email = 'testmail@abc.com';
        app.Phone = '6876875888';
        app.Product__c = prouctType;
        insert app;
        return app;
    }
    
    public static Contact CreateApplicantbulk(id recordTypeId, String prouctType,Boolean doInsert){
        Contact app = new Contact();
        app.RecordTypeId = recordTypeId;
        app.FirstName = 'Test';
        app.LastName = 'App';
        app.Email = 'testmail@abc.com';
        app.Phone = '6876875888';
        app.Product__c = prouctType;
        app.Applicant_Type__c='Applicant';
        if(doInsert)
        {
            insert app;
        }
        return app;
    }
    
    Public static Loan_Account__c CreatLoanAccount(id contact ,Boolean doInsert){
        Loan_Account__c la = new Loan_Account__c();
        la.Applicant__c = contact;
        la.DPD__c=0;
        la.Disbursal_Amount__c=500000;
        la.Disbursal_Date__c=system.today();
        la.LOAN_STATUS__c='Disbursed';
        if(doInsert)
        {
            insert la;
        }
        
        return la;
    }
    
    Public static Targets__c CreatTargets(Boolean doInsert ,id User ){
        
      Targets__c ta= new Targets__c();
        ta.Name='Test Traget';
        ta.Active__c=true;
        ta.Meeting_Targets__c=5;
        ta.Meeting_Lead_Conversation_Ratio__c=2;
        ta.Lead_Generation_Target__c=5;
        ta.No_of_Files_Logged_In_No__c=4;
        ta.No_of_Files_Logged_In__c=3;
        ta.No_of_Units_Disbursed__c=3;
        ta.Volume__c=12000.00;
        ta.IRR__c=3;
        ta.Net_PF__c=2;
        ta.Insurance_Penetration__c=2;
        ta.Direct_Biz_Sourced__c=3;
        ta.FTR__c=1;
        ta.Query_TAT_Resolution__c='test query';
        ta.Approval_Ratio__c=2;
        ta.OTC_PDD_above_norms__c='no';
        ta.Cases_Disbursed_in_last_3_days__c='no';
        ta.NPA__c='testnaps';
        ta.Salesperson__c=User;
        ta.Adherence_to_Ambit_Values__c='test ambit';
        ta.Communication_and_email_skillset__c='test com';
        ta.Overall_conduct_and_Cross_function_deali__c='test overall';
        ta.Overall_grooming_attendance_discipline__c='test'; 
        ta.Start_Date__c=date.newinstance(2021,4,1);
        ta.End_Date__c=system.today();
        if(doInsert){
             insert ta;
        }
         return ta;
        
    }
    
}
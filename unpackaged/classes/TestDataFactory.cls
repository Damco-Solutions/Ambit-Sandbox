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
    public static Contact CreateApplicant(id recordTypeId, String prouctType){
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
      Public static Achievement__c createAchievement(Boolean doInsert ,id User ){
        
      Achievement__c ta= new Achievement__c(Adherence_to_Ambit_Values_Target__c='Open rating to be available from 0 to 5',
                                            Cases_Disbursed_in_last_3_days_Target__c='Not more than 10%',Communication_and_email_skillset_Target__c='Open rating to be available from 0 to 5',
                                            Duration_Achievement__c='Monthly',Insurance_Penetration_Target__c=3,IRR_Target__c=15,Lead_Generation_Target__c=5,
                                            Meeting_Achievement__c=3,Meeting_Lead_Conversion_Ratio_Target__c=50,Meetings_Target__c=5,
                                    		Month__c='November',Net_PF_Target__c=5,No_of_Files_Logged_In_Target__c=5,No_of_Units_Disbursed_Target__c=5,
                                    		NPA_Achieved__c=5.5555,NPA_Target__c='As per Org Norms',
                                    		OTC_PDD_above_norms_Target__c='Nil OTC and PDD pending for more than 7 days and 90 days respectively',
                                            Overall_grooming_attendance_dis_Target__c='Open rating to be available from 0 to 5',
                                            Overallconduct_Crossfunction_deal_Target__c='Open rating to be available from 0 to 5',Query_TAT_Resolution_Target__c='80% cases to be resolved in T+4 days',
                                            User__c=User,Value_of_Files_Logged_In_Targets__c=1500000,Value_Target__c=50,Year__c='2021');
      
        if(doInsert){
             insert ta;
        }
         return ta;
        
    }
    Public static Sales_Plan__c createSales_Plan(Boolean doInsert ,id User ){
        
      Sales_Plan__c ta= new Sales_Plan__c(Month__c='November',No_of_disbursement__c=1,No_Of_Lead__c=2,
                                            No_of_login_value__c=5000000,No_of_Logins__c=1,No_of_Meetings__c=2,Plan_Type__c='Weekly',
                                            volume_of_disbursement__c=3000000,Week__c='1',Year__c='2021');
      
        if(doInsert){
             insert ta;
        }
         return ta;
        
    }
    
}
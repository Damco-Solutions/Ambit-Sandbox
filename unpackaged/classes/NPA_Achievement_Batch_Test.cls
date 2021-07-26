@istest
public class NPA_Achievement_Batch_Test {
    Public static testmethod void Secured_Direct_Method(){
        string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string product='Lead - VYAPAR (SECURED LOAN)';
        string dsaorconnector='DSA';
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        
        // create the User
        user u1=TestDataFactory.CreateUser();
        
        user u2=TestDataFactory.CreateUser2();
        system.runAs(u1){
        // create the Dsa Account
        Account acc=TestDataFactory.CreateAccount(accrecordtypeid, dsaorconnector);
        
        // create the applicant-1 
        Contact c1=TestDataFactory.CreateApplicantbulk(recordtypeid, product,true);
        // create the Loan Account 
        Loan_Account__c la1 =TestDataFactory.CreatLoanAccount(c1.id,false);
        la1.ROI__c=14;
        la1.Disbursal_Amount__c=500000.00;
        la1.Disbursal_Date__c=system.today()-10;
        la1.DPD__c=120;
        la1.Applicant__c=c1.id;
        la1.Insurance_Amount__c=50000;
        la1.PF_Amount__c=25000;
        la1.LOAN_STATUS__c='Disbursed';
        la1.Disbursal_Date__c=system.today();
        la1.Status__c='Disbursed';
        
        insert la1;
        
         
        
        Disbursement_Target_Table__c dtt = new Disbursement_Target_Table__c();
        dtt.Location__c = 'Delhi';
        dtt.CTC_Range_Max_In_Lakhs__c = 14;
        dtt.CTC_Range_Min_In_Lakhs__c = 12;
        dtt.Designation__c = 'Sales Manager-UCV';
        dtt.Product__c = 'UCV';
        dtt.Product_Multiplier_UCV__c = 100;
        insert dtt;
        
        
        
        //create the meeting
        
        Meeting__c ma= new Meeting__c();
        ma.Category__c='New Customer';
        ma.Status__c='Completed';
        ma.Type__c='Meeting';
        ma.Scheduled_Start_Time__c=system.now()+2;
        ma.OwnerId=u1.id;
        ma.Applicant__c=c1.Id;
        ma.Meeting_Outcome__c='Lead Generation( DSA )';
        
        insert ma;
        
        // creating Target
        
            Targets__c tg= new Targets__c();
            tg.Name='test target';
            tg.Meeting_Targets__c=10;
            tg.No_of_Files_Logged_In_No__c=10;
            tg.No_of_Files_Logged_In_Value__c=25000000;
            tg.Lead_Generation_Target__c=10;
            tg.IRR__c=16;
            tg.Insurance_Penetration__c=5;
            tg.Net_PF__c=4;
            tg.Start_Date__c=date.newInstance(2021, 4, 1);
            tg.End_Date__c=date.newInstance(2022, 3, 31);
            tg.Salesperson__c=u1.id;
            tg.Meeting_Lead_Conversation_Ratio__c=30;
            tg.No_of_Units_Disbursed__c=5;
            tg.Direct_Biz_Sourced__c=10;
            tg.FTR__c=8;
            tg.Approval_Ratio__c=50;
            tg.Branch_Manager__c=u2.id;
             insert tg;
            
            Test.startTest();
            Map<id,Decimal> AllLoans = new Map<id,Decimal>();
            Map<id,Decimal> NPA_DPD_Map = new Map<id,Decimal>();
            //Incentive_Setup__mdt[] Incentive = [select Incentive__c from Incentive_Setup__mdt where Sourcing__c = 'Direct' and Product__c='Lead - VYAPAR (SECURED LOAN)' AND Type__c ='Salesperson'];
            NPA_Achievement_Batch obj = new NPA_Achievement_Batch();
            DataBase.executeBatch(obj); 
            Test.stopTest();  
            
        }
    }

}
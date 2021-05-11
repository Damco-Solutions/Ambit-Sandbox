@istest
public class NPA_Achievement_Batch_Test {
    Public static testmethod void Secured_Direct_Method(){
        string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string product='Lead - VYAPAR (SECURED LOAN)';
        string dsaorconnector='DSA';
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        
        // create the User
        user u1=TestDataFactory.CreateUser();
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
        la1.LOAN_STATUS__c='Disbursed';
        insert la1;
        
         
        
        Disbursement_Target_Table__c dtt = new Disbursement_Target_Table__c();
        dtt.Location__c = 'Delhi';
        dtt.CTC_Range_Max_In_Lakhs__c = 14;
        dtt.CTC_Range_Min_In_Lakhs__c = 12;
        dtt.Designation__c = 'Sales Manager-UCV';
        dtt.Product__c = 'UCV';
        dtt.Product_Multiplier_UCV__c = 100;
        insert dtt;
         // create the target
         Targets__c ta= TestDataFactory.CreatTargets(true, u1.id);
        
        
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
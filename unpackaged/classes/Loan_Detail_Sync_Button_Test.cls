@isTest
public class Loan_Detail_Sync_Button_Test {
   
   static testMethod void AcknowledgementRequesttest(){
        string recordtypeid1 =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string recordtypeid2 =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Non Individual').getRecordTypeId();
        
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        string Branchrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Branch').getRecordTypeId();
       
        // create Applicant owner-
        Profile p = [SELECT Id FROM Profile WHERE Name='Sales Profile'];
        //creating user
        User u1 = new User(Alias = 'standt', Email='raman.bhandari@combo.co',
                           EmailEncodingKey='UTF-8', LastName='Bhandari',Firstname='Raman', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id,EmployeeNumber='1214004',Channel__c='DSA Manager',Sourcing_Channel_1__c='DSA MANAGER DELHI', 
                           TimeZoneSidKey='America/Los_Angeles', UserName='raman.bhandari@combo.co');
        insert u1;
        
        // create branch manager-
        Profile p1 = [SELECT Id FROM Profile WHERE Name='Branch Manger Profile'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='amal.singh@combo.co',
                           EmailEncodingKey='UTF-8', LastName='Singh',Firstname='Amal', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p1.Id,EmployeeNumber='1214031',
                           TimeZoneSidKey='America/Los_Angeles', UserName='amal.singh@combo.co');
        insert u2;
        
        
        // create the Dsa Account
        Account acc= new account();
        acc.Agent_Code__pc='AGN0000114';
        acc.Email__c='aaditrademart@gmail.com';
        acc.LastName='AADI TRADEMART PVT LTD';
        acc.DSA_Connector__c='Direct Sales Agent';
        acc.Sec_Sourcing_Channel__c='CORPORATE DSA';
        acc.RecordTypeId=accrecordtypeid;
         insert acc;
        
        // create the Branch
        Account Bra= new account();
         Bra.Name='NEW DELHI';
         Bra.Branch_Manager__c=u2.id;
         insert Bra;
        
        // Create the Applicant as Individual
        contact app= new contact();
        
        app.FirstName='Ram';
        app.LastName='Kumar';
        app.Email = 'ramk@abc.com';
        app.Phone = '8655994455';
        app.MobilePhone='9787451201';
        app.Applicant_Father_Name__c='ramesk kumar';
        app.Birthdate=date.newInstance(1980, 05, 06);
        app.Marital_Status__c='SINGLE';
        app.Gender__c='Male';
        app.Education__c='Graduate';
        app.Stage__c='Hot';
        app.Constitution__c='INDIVIDUAL';
        app.Applicant_Type__c='APPLICANT';
        app.Time_At_Address_In_Years__c=8.0;
        app.Time_at_Current_Address__c=0.0;
        app.GST_Applicable__c='N';
        app.Segment__c='SERVICES';
        app.Type_of_Business__c='COMPUTER SERVICES';
        app.Cluster__c='SOFTWARE';
        app.Pan_Card_Form_60__c='Pan Card';
        app.Pan_Card__c='CPVDK1252P';
        app.Applicant_Code__c= 'CN0000000056223';
        app.Prospect_Code__c= 'IND000000022428';
        app.Prospect_Id__c= '1000022429';
        app.RecordTypeId=recordtypeid1;
        //created applicant address section
        //Office Address
        app.Flat_House_Number_Office__c='290/B';
        app.Building_Street_Name_Office__c='1ST FLOOR';
        app.Area_Office__c='Ahinsha khand-2';
        app.District_Office__c='Ghaziabad';
        app.City_Office__c='NOIDA';
        app.State_Office__c='UTTAR PRADESH';
        app.Pincode_Office__c='201301';
        app.OVD_Office_Address__c=true;
        app.Mailing_Office_Address__c=false;
        app.Destination_Office_Address__c=false;
        //Residance adresss
        app.Same_As_Current_Address__c=false;
        app.Flat_House_Number_Destination__c='290/B';
        app.Building_Street_Name_Destination__c='1ST FLOOR';
        app.Area_Destination__c='Ahinsha khand-2';
        app.District_Destination__c='Ghaziabad';
        app.City_Destination__c='NOIDA';
        app.State_Destination__c='UTTAR PRADESH';
        app.Pincode_Destination__c='201301';
        app.Mailing_Current_Address__c=true;
        app.Destination_Current_Address__c=false;
        app.Mailing_Office_Address__c=false;
        
        // Permanent Address
        app.Same_As_Destination_Address__c=false;
        app.Mailing_Permanent_Address__c=false;
        app.Mailing_Office_Address__c=false;
        app.Destination_Permanent_Address__c=true;
        app.Flat_House_Number_Mailing__c='290/B';
        app.Building_Street_Name_Mailing__c='1ST FLOOR';
        app.Area_Mailing__c='Ahinsha khand-2';
        app.District_Mailing__c='Ghaziabad';
        app.City_Mailing__c='NOIDA';
        app.State_Mailing__c='UTTAR PRADESH';
        app.Pincode_Mailing__c='201301';
        
        //create applicant cibil section
        app.Application_Form_Type__c='Physical Application Form';
        app.CIBIL_ID__c='Pan Card';
        app.CIBIL_ID_Number__c='CPVDK1252P';
        app.CIBIL_ID_Upload__c=true;
        app.CIBIL_Score__c=750.00;
        app.CIBIL_SCORE_DATE__c=date.newInstance(2021,10,25);
        app.Consent_Received_From_Applicant__c=true;
        app.Form_60_Uploaded__c=true;
        app.OK_to_Proceed__c='Yes - Without Deviation';
       
        // creating applicant loan section
        app.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        app.Scheme__c='AMBIT VYAPAR-INCOME BASED';
        app.Purpose__c='Capital Equipment';
        app.Rate_Of_Interest__c=15;
        app.Tenure_In_Months__c=45;
        app.Customer_Type__c='New';
        app.Loan_Amount__c=5000000;
        app.Occupancy_Status__c='RENTED';
        app.Nature_of_Loan__c='Renovation / Expansion';
        //app.Relationship_with_Applicant__c='FATHER';
        app.Company_Name__c='TCS PVT LTD';
        
        //creating sourcing section
        app.Channel__c='DSA Manager';
        app.Channel_Type__c='Direct Sourcing';
        app.Sub_Channel_Type__c='Direct Sourcing';
        app.Agent__c=acc.Id;
        app.Branch__c=Bra.Id;
        app.Branch_Manager__c=u2.Id;
        app.Service_Location__c=Bra.Id;
        app.Sourcing_Location__c=Bra.Id;
        app.Sourcing_Team__c='Retail';
        //updating status
        app.Status__c='Documentation in process';
        app.OwnerId=u1.Id;
        insert app;
        
        //Creating Loan Account
        Loan_Account__c lon= new Loan_Account__c();
        lon.Customer_Type__c= 'Individual';
        lon.Constitution__c= 'Individual';
        lon.Product__c= 'Lead - UDYAM (UNSECURED LOAN)';
        lon.Scheme__c= 'AMBIT VYAPAR-INCOME BASED';
        lon.Applied_Loan_Amount__c= 1000000;
        lon.Proposed_ROI__c= 22;
        lon.Branch__c= Bra.id;
        lon.DSA_Connector__c= acc.id;
        lon.LOAN_STATUS__c= 'DISBURSED';
        lon.OwnerId=u1.Id;
        lon.Applicant_Code__c= 'CN0000000056223';
        lon.Prospect_Code__c= 'BLR000000008161';
        lon.Prospect_Id__c= '1000022429';
        insert lon;
        
        Loan_API__c customloanapi= new Loan_API__c();
        
        customloanapi.FORMNO__c=35675012;
        customloanapi.UNIQUE_REQUEST_ID__c=1452356;
        customloanapi.Name='loan_setting';
         insert customloanapi;
        
        system.runAs(u1){
            
            system.debug('Loan id->'+lon.Id); 
            list<Loan_Account__c> ld=[SELECT id,Applicant_Code__c,Applicant__r.name,LOAN_STATUS__c,
                                      Prospect_Code__c,Prospect_ID__c FROM Loan_Account__c where id=:lon.Id];
            
            system.debug('ld->'+ld[0]);
             Test.startTest();
             //Test.setMock(HttpCalloutMock.class, new MockHttpResponseAcknowlogement());
             Test.setMock(HttpCalloutMock.class, new MockHttpLoanAuth());
             Loan_Detail_Sync_Button.AuthenticationRequest(ld[0].Id);
            
            
            Test.stopTest();
            
        }
    }
    
       static testMethod void AcknowledgementRequesttest1(){
        string recordtypeid1 =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string recordtypeid2 =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Non Individual').getRecordTypeId();
        
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        string Branchrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Branch').getRecordTypeId();
       
        // create Applicant owner-
        Profile p = [SELECT Id FROM Profile WHERE Name='Sales Profile'];
        //creating user
        User u1 = new User(Alias = 'standt', Email='raman.bhandari@combo.co',
                           EmailEncodingKey='UTF-8', LastName='Bhandari',Firstname='Raman', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id,EmployeeNumber='1214004',Channel__c='DSA Manager',Sourcing_Channel_1__c='DSA MANAGER DELHI', 
                           TimeZoneSidKey='America/Los_Angeles', UserName='raman.bhandari@combo.co');
        insert u1;
        
        // create branch manager-
        Profile p1 = [SELECT Id FROM Profile WHERE Name='Branch Manger Profile'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='amal.singh@combo.co',
                           EmailEncodingKey='UTF-8', LastName='Singh',Firstname='Amal', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p1.Id,EmployeeNumber='1214031',
                           TimeZoneSidKey='America/Los_Angeles', UserName='amal.singh@combo.co');
        insert u2;
        
        
        // create the Dsa Account
        Account acc= new account();
        acc.Agent_Code__pc='AGN0000114';
        acc.Email__c='aaditrademart@gmail.com';
        acc.LastName='AADI TRADEMART PVT LTD';
        acc.DSA_Connector__c='Direct Sales Agent';
        acc.Sec_Sourcing_Channel__c='CORPORATE DSA';
        acc.RecordTypeId=accrecordtypeid;
         insert acc;
        
        // create the Branch
        Account Bra= new account();
         Bra.Name='NEW DELHI';
         Bra.Branch_Manager__c=u2.id;
         insert Bra;
        
        // Create the Applicant as Individual
        contact app= new contact();
        
        app.FirstName='Ram';
        app.LastName='Kumar';
        app.Email = 'ramk@abc.com';
        app.Phone = '8655994455';
        app.MobilePhone='9787451201';
        app.Applicant_Father_Name__c='ramesk kumar';
        app.Birthdate=date.newInstance(1980, 05, 06);
        app.Marital_Status__c='SINGLE';
        app.Gender__c='Male';
        app.Education__c='Graduate';
        app.Stage__c='Hot';
        app.Constitution__c='INDIVIDUAL';
        app.Applicant_Type__c='APPLICANT';
        app.Time_At_Address_In_Years__c=8.0;
        app.Time_at_Current_Address__c=0.0;
        app.GST_Applicable__c='N';
        app.Segment__c='SERVICES';
        app.Type_of_Business__c='COMPUTER SERVICES';
        app.Cluster__c='SOFTWARE';
        app.Pan_Card_Form_60__c='Pan Card';
        app.Pan_Card__c='CPVDK1252P';
        app.Applicant_Code__c= 'CN0000000056223';
        app.Prospect_Code__c= 'IND000000022428';
        app.Prospect_Id__c= '1000022429';
        app.RecordTypeId=recordtypeid1;
        //created applicant address section
        //Office Address
        app.Flat_House_Number_Office__c='290/B';
        app.Building_Street_Name_Office__c='1ST FLOOR';
        app.Area_Office__c='Ahinsha khand-2';
        app.District_Office__c='Ghaziabad';
        app.City_Office__c='NOIDA';
        app.State_Office__c='UTTAR PRADESH';
        app.Pincode_Office__c='201301';
        app.OVD_Office_Address__c=true;
        app.Mailing_Office_Address__c=false;
        app.Destination_Office_Address__c=false;
        //Residance adresss
        app.Same_As_Current_Address__c=false;
        app.Flat_House_Number_Destination__c='290/B';
        app.Building_Street_Name_Destination__c='1ST FLOOR';
        app.Area_Destination__c='Ahinsha khand-2';
        app.District_Destination__c='Ghaziabad';
        app.City_Destination__c='NOIDA';
        app.State_Destination__c='UTTAR PRADESH';
        app.Pincode_Destination__c='201301';
        app.Mailing_Current_Address__c=true;
        app.Destination_Current_Address__c=false;
        app.Mailing_Office_Address__c=false;
        
        // Permanent Address
        app.Same_As_Destination_Address__c=false;
        app.Mailing_Permanent_Address__c=false;
        app.Mailing_Office_Address__c=false;
        app.Destination_Permanent_Address__c=true;
        app.Flat_House_Number_Mailing__c='290/B';
        app.Building_Street_Name_Mailing__c='1ST FLOOR';
        app.Area_Mailing__c='Ahinsha khand-2';
        app.District_Mailing__c='Ghaziabad';
        app.City_Mailing__c='NOIDA';
        app.State_Mailing__c='UTTAR PRADESH';
        app.Pincode_Mailing__c='201301';
        
        //create applicant cibil section
        app.Application_Form_Type__c='Physical Application Form';
        app.CIBIL_ID__c='Pan Card';
        app.CIBIL_ID_Number__c='CPVDK1252P';
        app.CIBIL_ID_Upload__c=true;
        app.CIBIL_Score__c=750.00;
        app.CIBIL_SCORE_DATE__c=date.newInstance(2021,10,25);
        app.Consent_Received_From_Applicant__c=true;
        app.Form_60_Uploaded__c=true;
        app.OK_to_Proceed__c='Yes - Without Deviation';
       
        // creating applicant loan section
        app.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        app.Scheme__c='AMBIT VYAPAR-INCOME BASED';
        app.Purpose__c='Capital Equipment';
        app.Rate_Of_Interest__c=15;
        app.Tenure_In_Months__c=45;
        app.Customer_Type__c='New';
        app.Loan_Amount__c=5000000;
        app.Occupancy_Status__c='RENTED';
        app.Nature_of_Loan__c='Renovation / Expansion';
        //app.Relationship_with_Applicant__c='FATHER';
        app.Company_Name__c='TCS PVT LTD';
        
        //creating sourcing section
        app.Channel__c='DSA Manager';
        app.Channel_Type__c='Direct Sourcing';
        app.Sub_Channel_Type__c='Direct Sourcing';
        app.Agent__c=acc.Id;
        app.Branch__c=Bra.Id;
        app.Branch_Manager__c=u2.Id;
        app.Service_Location__c=Bra.Id;
        app.Sourcing_Location__c=Bra.Id;
        app.Sourcing_Team__c='Retail';
        //updating status
        app.Status__c='Documentation in process';
        app.OwnerId=u1.Id;
        insert app;
        
        //Creating Loan Account
        Loan_Account__c lon= new Loan_Account__c();
        lon.Customer_Type__c= 'Individual';
        lon.Constitution__c= 'Individual';
        lon.Product__c= 'Lead - UDYAM (UNSECURED LOAN)';
        lon.Scheme__c= 'AMBIT VYAPAR-INCOME BASED';
        lon.Applied_Loan_Amount__c= 1000000;
        lon.Proposed_ROI__c= 22;
        lon.Branch__c= Bra.id;
        lon.DSA_Connector__c= acc.id;
        lon.LOAN_STATUS__c= 'Applied';
        lon.OwnerId=u1.Id;
        lon.Applicant_Code__c= 'CN0000000016276';
        lon.Prospect_Code__c= 'BLR000000008161';
        lon.Prospect_Id__c= '1000022429';
        insert lon;
        
        Loan_API__c customloanapi= new Loan_API__c();
        
        customloanapi.FORMNO__c=35675012;
        customloanapi.UNIQUE_REQUEST_ID__c=1452356;
        customloanapi.Name='loan_setting';
         insert customloanapi;
        
        system.runAs(u1){
            
            system.debug('Loan id->'+lon.Id); 
            list<Loan_Account__c> ld=[SELECT id,Applicant_Code__c,Applicant__r.name,LOAN_STATUS__c,
                                      Prospect_Code__c,Prospect_ID__c FROM Loan_Account__c where id=:lon.Id];
            
            system.debug('ld->'+ld[0]);
             Test.startTest();
             //Test.setMock(HttpCalloutMock.class, new MockHttpResponseAcknowlogement());
             Test.setMock(HttpCalloutMock.class, new MockHTTPLoanDetails());
             Loan_Detail_Sync_Button.AuthenticationRequest(ld[0].Id);
            
            
            Test.stopTest();
            
        }
     }
    
    
    
}
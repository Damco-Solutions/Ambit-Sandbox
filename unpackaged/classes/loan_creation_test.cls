@isTest
public class loan_creation_test {
    
    static testMethod void AcknowledgementRequest_Individualtest(){
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
                           TimeZoneSidKey='America/Los_Angeles', UserName='raman.bhandari@combo.co',Division='SME');
        insert u1;
        
        // create branch manager-
        Profile p1 = [SELECT Id FROM Profile WHERE Name='Branch Manger Profile'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='amal.singh@combo.co',
                           EmailEncodingKey='UTF-8', LastName='Singh',Firstname='Amal', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p1.Id,EmployeeNumber='1214031',
                           TimeZoneSidKey='America/Los_Angeles', UserName='amal.singh@combo.co',Division='SME');
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
        
        app.FirstName='Ashwini';
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
        app.Relationship_with_Applicant__c='FATHER';
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
        app.Status__c='CIBIL Updated';
        app.OwnerId=u1.Id;
        insert app;
        
        // Create the Co-Applicant as NON-Individual
        
        contact coapp= new contact();
        coapp.FirstName='Ashwini';
        coapp.LastName='Kim';
        coapp.Constitution__c='PROPRIETARY';
        coapp.Company_Type__c='MSME';
        coapp.Date_of_Incorporation__c=date.newInstance(1990, 09, 08);
        coapp.No_of_Years_in_Business__c=15.00;
        coapp.MobilePhone='9787451101';
        coapp.Email='beetbook@gmail.com';
        coapp.Applicant_Type__c='CO-APPLICANT';
        coapp.Stage__c='Hot';
        coapp.Time_At_Address_In_Years__c=9.0;
        coapp.Phone='9630127852';
        coapp.GST_Applicable__c='N';
        coapp.Segment__c='SERVICES';
        coapp.Type_of_Business__c='COMPUTER SERVICES';
        coapp.Cluster__c='SOFTWARE';
        coapp.Pan_Card__c='CPVDA1504A';
        coapp.RecordTypeId=recordtypeid2;
        
        //created co-applicant address section
        coapp.Flat_House_Number_Office__c='25/B';
        coapp.Building_Street_Name_Office__c='5TH FLOOR';
        coapp.Area_Office__c='Ahinsha khand-2';
        coapp.District_Office__c='Ghaziabad';
        coapp.City_Office__c='NOIDA';
        coapp.State_Office__c='UTTAR PRADESH';
        coapp.Pincode_Office__c='201301';
        coapp.OVD_Office_Address__c=true;
        coapp.Mailing_Office_Address__c=false;
        coapp.Destination_Office_Address__c=true;
        coapp.Same_As_Current_Address__c=False;
     
        app.Mailing_Permanent_Address__c=false;
        app.Destination_Permanent_Address__c=false;
        app.Mailing_Office_Address__c=false;
        app.Flat_House_Number_Mailing__c='290/B';
        app.Building_Street_Name_Mailing__c='1ST FLOOR';
        app.Area_Mailing__c='Ahinsha khand-2';
        app.District_Mailing__c='Ghaziabad';
        app.City_Mailing__c='NOIDA';
        app.State_Mailing__c='UTTAR PRADESH';
        app.Pincode_Mailing__c='201301';
        
        // creating Co-applicant loan section
        coapp.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        coapp.Scheme__c='AMBIT VYAPAR-INCOME BASED';
        coapp.Purpose__c='Capital Equipment';
        coapp.Rate_Of_Interest__c=15;
        coapp.Tenure_In_Months__c=45;
        coapp.Customer_Type__c='New';
        coapp.Loan_Amount__c=5000000;
        coapp.Occupancy_Status__c='RENTED';
        coapp.Nature_of_Loan__c='Renovation / Expansion';
        coapp.Relationship_with_Applicant__c='FATHER';
        coapp.Company_Name__c='Beeta Book Agency';
        coapp.Status__c='CIBIL Updated';
        coapp.OwnerId=u1.Id;
        
         insert coapp;
        
        app.Co_Applicant_1__c=coapp.Id;
        app.Status__c='Prospect';
        update app;
        
         Loan_API__c customloanapi= new Loan_API__c();
        
        customloanapi.FORMNO__c=35675451;
        customloanapi.UNIQUE_REQUEST_ID__c=354689245;
        customloanapi.Name='loan_Creation';
         insert customloanapi;
        
       system.runAs(u1){
            
            system.debug('con id->'+app.Id); 
            list<Contact> con=[SELECT id,Pan_Card__C, Loan_Amount__c,Product__c,Gender__c,Birthdate,Name,CIBIL_ID__c,MobilePhone,Flat_House_Number_Destination__c,Building_Street_Name_Destination__c,Area_Destination__c,District_Destination__c,City_Destination__c,
                          State_Destination__c,Pincode_Destination__c,CIBIL_ID_Number__c,CIBIL_Score__c,Firstname,Lastname,Middlename,Branch__r.Name,Scheme__c,Nature_of_Loan__c,Branch_Manager__r.name,Purpose__c,Promo_Scheme__c,Channel_Type__c,Sourcing_Channel__c,Agent__r.Name,Applicant_Type__c,
                          RecordTypeId,Salutation,Marital_Status__c,Business_Type__c,Education__c,OwnerId,owner.Name,Tenure_In_Months__c,Company_Name__c,Occupancy_Status__c,Time_At_Address_In_Years__c,Email,Phone,Applicant_Father_Name__c,Constitution__c,Flat_House_Number_Mailing__c,
                          Building_Street_Name_Mailing__c,Area_Mailing__c,District_Mailing__c,City_Mailing__c,State_Mailing__c,Pincode_Mailing__c,Division__c,Customer_Type__c,Co_Applicant_1__c,Co_Applicant_2__c,Co_Applicant_3__c,Co_Applicant_4__c,
                          Co_Applicant_5__c,Co_Applicant_6__c,Co_Applicant_7__c,Co_Applicant_8__c,Co_Applicant_9__c,Co_Applicant_10__c,Co_Applicant_11__c,Co_Applicant_12__c,Co_Applicant_13__c,Co_Applicant_14__c,Co_Applicant_15__c,
                          Guarantor_1__c,Guarantor_2__c,Guarantor_3__c,Guarantor_4__c,Guarantor_5__c,Parent_Applicant__c,Parent_Applicant__r.Applicant_Code__c,FORMNO__c,OFFICE_ADDRESS_ID__c,PERMANENT_ADDRESS_ID__c,RESIDENCE_ADDRESS_ID__c,
                          GST_Applicable__c,GST_Number__c,Segment__c,Cluster__c,Type_of_Business__c,Time_at_Current_Address__c,Flat_House_Number_Office__c,Building_Street_Name_Office__c,Area_Office__c,District_Office__c,City_Office__c,State_Office__c,Pincode_Office__c,
                          Mailing_Current_Address__c,Mailing_Permanent_Address__c,Mailing_Office_Address__c,Destination_Permanent_Address__c,Destination_Office_Address__c,Destination_Current_Address__c,Pan_Card_Form_60__c,Document_No__c,Document_Type__c,Sourcing_Channel_1__c,
                          SOURCING_AGENT_1__c,Channel__c,Agent__r.Sec_Sourcing_Channel__c,Agent__r.DSA_Connector__c,Agent__r.Agent_Code__pc,Agent__r.Sourcing_Channel_2__c,CIBIL_SCORE_DATE__c,Date_of_Incorporation__c,CIN_Number__c,Company_Name_NON_ind__c,Status__c,Created_date__c,Relationship_Manager__c,Relationship_Manager__r.Name FROM Contact where id=:app.Id];
           // system.debug('ld->'+ld[0]);
             Test.startTest();
             //Test.setMock(HttpCalloutMock.class, new MockHttpResponseAcknowlogement());
             Test.setMock(HttpCalloutMock.class, new MockHttpLoanCreation());
             Loan_Creation.Applicantload(con[0].Id);
            
            
            Test.stopTest();
            
        }
    }
        
        
       static testMethod void AcknowledgementRequest_NonIndividualtest(){
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
                           TimeZoneSidKey='America/Los_Angeles', UserName='raman.bhandari@combo.co',Division='SME');
        insert u1;
        
        // create branch manager-
        Profile p1 = [SELECT Id FROM Profile WHERE Name='Branch Manger Profile'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='amal.singh@combo.co',
                           EmailEncodingKey='UTF-8', LastName='Singh',Firstname='Amal', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p1.Id,EmployeeNumber='1214031',
                           TimeZoneSidKey='America/Los_Angeles', UserName='amal.singh@combo.co',Division='SME');
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
        
        // Create the Applicant as Non-Individual
        contact app= new contact();
        
        app.LastName='Beeta Book Agency';
        app.Constitution__c='PROPRIETARY';
        app.Company_Type__c='MSME';
        app.Date_of_Incorporation__c=date.newInstance(1990, 09, 08);
        app.No_of_Years_in_Business__c=15.00;
        app.MobilePhone='9787451101';
        app.Email='beetbook@gmail.com';
        app.Applicant_Type__c='APPLICANT';
        app.Stage__c='Hot';
        app.Time_At_Address_In_Years__c=9.0;
        app.Phone='9630127852';
        app.GST_Applicable__c='N';
        app.Segment__c='SERVICES';
        app.Type_of_Business__c='COMPUTER SERVICES';
        app.Cluster__c='SOFTWARE';
        app.Pan_Card__c='CPVPB1504A';
        app.RecordTypeId=recordtypeid2;    
        app.Form_60_Uploaded__c=true;
        app.Authorised_Person__c='Ram Kumar';
        app.Application_Form_Type__c='Physical Application Form';
        app.Form_60_Uploaded__c=true;
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
        

        // creating applicant loan section
        app.Product__c = 'Lead - UDYAM (UNSECURED LOAN)';
        app.Scheme__c='AMBIT Udyam-Income Based';
        app.Purpose__c='Capital Equipment';
        app.Rate_Of_Interest__c=15;
        app.Tenure_In_Months__c=45;
        app.Customer_Type__c='New';
        app.Loan_Amount__c=5000000;
        app.Occupancy_Status__c='RENTED';
        app.Nature_of_Loan__c='Renovation / Expansion';
        app.Relationship_with_Applicant__c='FATHER';
        app.Company_Name__c='TCS PVT LTD';
        
        //creating sourcing section
        app.Channel__c='DSA Manager';
        app.Channel_Type__c='DSA';
        app.Agent__c=acc.Id;
        app.Branch__c=Bra.Id;
        app.Branch_Manager__c=u2.Id;
        app.Service_Location__c=Bra.Id;
        app.Sourcing_Location__c=Bra.Id;
        app.Sourcing_Team__c='Retail';
        //updating status
        app.Status__c='CIBIL Updated';
        app.OwnerId=u1.Id;
        insert app;
        
        // Create the Co-Applicant as Individual
        
        contact coapp= new contact();
        coapp.FirstName='Ram';
        coapp.LastName='Kumar';
        coapp.Email = 'ramk@abc.com';
        coapp.Phone = '8655994455';
        coapp.MobilePhone='9787451201';
        coapp.Applicant_Father_Name__c='ramesk kumar';
        coapp.Birthdate=date.newInstance(1980, 05, 06);
        coapp.Marital_Status__c='SINGLE';
        coapp.Gender__c='Male';
        coapp.Education__c='Graduate';
        coapp.Stage__c='Hot';
        coapp.Constitution__c='INDIVIDUAL';
        coapp.Applicant_Type__c='CO-APPLICANT';
        coapp.Time_At_Address_In_Years__c=8.0;
        coapp.Time_at_Current_Address__c=0.0;
        coapp.GST_Applicable__c='N';
        coapp.Segment__c='SERVICES';
        coapp.Type_of_Business__c='COMPUTER SERVICES';
        coapp.Cluster__c='SOFTWARE';
        coapp.Pan_Card_Form_60__c='Pan Card';
        coapp.Pan_Card__c='CPVDK1252P';
        coapp.RecordTypeId=recordtypeid1;
        coapp.Authorised_Person__c='Ram Kumar';
           
        
        //created co-applicant address section
        coapp.Flat_House_Number_Office__c='25/B';
        coapp.Building_Street_Name_Office__c='5TH FLOOR';
        coapp.Area_Office__c='Ahinsha khand-2';
        coapp.District_Office__c='Ghaziabad';
        coapp.City_Office__c='NOIDA';
        coapp.State_Office__c='UTTAR PRADESH';
        coapp.Pincode_Office__c='201301';
        coapp.OVD_Office_Address__c=true;
        coapp.Mailing_Office_Address__c=false;
        coapp.Destination_Office_Address__c=true;
        coapp.Same_As_Current_Address__c=False;
        //Residance adresss
        coapp.Same_As_Current_Address__c=false;
        coapp.Flat_House_Number_Destination__c='290/B';
        coapp.Building_Street_Name_Destination__c='1ST FLOOR';
        coapp.Area_Destination__c='Ahinsha khand-2';
        coapp.District_Destination__c='Ghaziabad';
        coapp.City_Destination__c='NOIDA';
        coapp.State_Destination__c='UTTAR PRADESH';
        coapp.Pincode_Destination__c='201301';
        coapp.Mailing_Current_Address__c=true;
        coapp.Destination_Current_Address__c=false;
        coapp.Mailing_Office_Address__c=false;
       //     
        coapp.Mailing_Permanent_Address__c=false;
        coapp.Destination_Permanent_Address__c=false;
        coapp.Mailing_Office_Address__c=false;
        coapp.Flat_House_Number_Mailing__c='290/B';
        coapp.Building_Street_Name_Mailing__c='1ST FLOOR';
        coapp.Area_Mailing__c='Ahinsha khand-2';
        coapp.District_Mailing__c='Ghaziabad';
        coapp.City_Mailing__c='NOIDA';
        coapp.State_Mailing__c='UTTAR PRADESH';
        coapp.Pincode_Mailing__c='201301';
          
        coapp.Application_Form_Type__c='Physical Application Form';  
        coapp.CIBIL_ID__c='Pan Card';
        coapp.CIBIL_ID_Number__c='CPVDK1252P';
        coapp.CIBIL_ID_Upload__c=true;
        coapp.CIBIL_Score__c=750.00;
        coapp.CIBIL_SCORE_DATE__c=date.newInstance(2021,10,25);
        coapp.Consent_Received_From_Applicant__c=true;
        coapp.Form_60_Uploaded__c=true;
        coapp.OK_to_Proceed__c='Yes - Without Deviation';
        
        // creating Co-applicant loan section
        coapp.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        coapp.Scheme__c='AMBIT VYAPAR-INCOME BASED';
        coapp.Purpose__c='Capital Equipment';
        coapp.Rate_Of_Interest__c=15;
        coapp.Tenure_In_Months__c=45;
        coapp.Customer_Type__c='New';
        coapp.Loan_Amount__c=5000000;
        coapp.Occupancy_Status__c='RENTED';
        coapp.Nature_of_Loan__c='Renovation / Expansion';
        coapp.Relationship_with_Applicant__c='FATHER';
        coapp.Company_Name__c='Beeta Book Agency';
        coapp.Status__c='CIBIL Updated';
        coapp.OwnerId=u1.Id;
        coapp.Branch__c=Bra.Id;
        coapp.Branch_Manager__c=u2.Id;
        coapp.Service_Location__c=Bra.Id;
        coapp.Sourcing_Location__c=Bra.Id;  
        
         insert coapp;
        
        app.Co_Applicant_1__c=coapp.Id;
        app.Status__c='Prospect';
        update app;
        
         Loan_API__c customloanapi= new Loan_API__c();
        
        customloanapi.FORMNO__c=35675451;
        customloanapi.UNIQUE_REQUEST_ID__c=354689245;
        customloanapi.Name='loan_Creation';
         insert customloanapi;
        
       system.runAs(u1){
            
            system.debug('con id->'+app.Id); 
            list<Contact> con=[SELECT id,Pan_Card__C, Loan_Amount__c,Product__c,Gender__c,Birthdate,Name,CIBIL_ID__c,MobilePhone,Flat_House_Number_Destination__c,Building_Street_Name_Destination__c,Area_Destination__c,District_Destination__c,City_Destination__c,
                          State_Destination__c,Pincode_Destination__c,CIBIL_ID_Number__c,CIBIL_Score__c,Firstname,Lastname,Middlename,Branch__r.Name,Scheme__c,Nature_of_Loan__c,Branch_Manager__r.name,Purpose__c,Promo_Scheme__c,Channel_Type__c,Sourcing_Channel__c,Agent__r.Name,Applicant_Type__c,
                          RecordTypeId,Salutation,Marital_Status__c,Business_Type__c,Education__c,OwnerId,owner.Name,Tenure_In_Months__c,Company_Name__c,Occupancy_Status__c,Time_At_Address_In_Years__c,Email,Phone,Applicant_Father_Name__c,Constitution__c,Flat_House_Number_Mailing__c,
                          Building_Street_Name_Mailing__c,Area_Mailing__c,District_Mailing__c,City_Mailing__c,State_Mailing__c,Pincode_Mailing__c,Division__c,Customer_Type__c,Co_Applicant_1__c,Co_Applicant_2__c,Co_Applicant_3__c,Co_Applicant_4__c,
                          Co_Applicant_5__c,Co_Applicant_6__c,Co_Applicant_7__c,Co_Applicant_8__c,Co_Applicant_9__c,Co_Applicant_10__c,Co_Applicant_11__c,Co_Applicant_12__c,Co_Applicant_13__c,Co_Applicant_14__c,Co_Applicant_15__c,
                          Guarantor_1__c,Guarantor_2__c,Guarantor_3__c,Guarantor_4__c,Guarantor_5__c,Parent_Applicant__c,Parent_Applicant__r.Applicant_Code__c,FORMNO__c,OFFICE_ADDRESS_ID__c,PERMANENT_ADDRESS_ID__c,RESIDENCE_ADDRESS_ID__c,
                          GST_Applicable__c,GST_Number__c,Segment__c,Cluster__c,Type_of_Business__c,Time_at_Current_Address__c,Flat_House_Number_Office__c,Building_Street_Name_Office__c,Area_Office__c,District_Office__c,City_Office__c,State_Office__c,Pincode_Office__c,
                          Mailing_Current_Address__c,Mailing_Permanent_Address__c,Mailing_Office_Address__c,Destination_Permanent_Address__c,Destination_Office_Address__c,Destination_Current_Address__c,Pan_Card_Form_60__c,Document_No__c,Document_Type__c,Sourcing_Channel_1__c,
                          SOURCING_AGENT_1__c,Channel__c,Agent__r.Sec_Sourcing_Channel__c,Agent__r.DSA_Connector__c,Agent__r.Agent_Code__pc,Agent__r.Sourcing_Channel_2__c,CIBIL_SCORE_DATE__c,Date_of_Incorporation__c,CIN_Number__c,Company_Name_NON_ind__c,Status__c,Created_date__c,Relationship_Manager__c,Relationship_Manager__r.Name FROM Contact where id=:app.Id];
           // system.debug('ld->'+ld[0]);
             Test.startTest();
             //Test.setMock(HttpCalloutMock.class, new MockHttpResponseAcknowlogement());
             Test.setMock(HttpCalloutMock.class, new MockHttpLoanCreation());
             Loan_Creation.Applicantload(con[0].Id);
            
            
            Test.stopTest();
            
        }
    }
    static testMethod void AcknowledgementRequest_COapplicantresponsetest(){
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
                           TimeZoneSidKey='America/Los_Angeles', UserName='raman.bhandari@combo.co',Division='SME');
        insert u1;
        
        // create branch manager-
        Profile p1 = [SELECT Id FROM Profile WHERE Name='Branch Manger Profile'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='amal.singh@combo.co',
                           EmailEncodingKey='UTF-8', LastName='Singh',Firstname='Amal', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p1.Id,EmployeeNumber='1214031',
                           TimeZoneSidKey='America/Los_Angeles', UserName='amal.singh@combo.co',Division='SME');
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
        
        // Create the Applicant as Non-Individual
        contact app= new contact();
        
        app.LastName='Beeta Book Agency';
        app.Constitution__c='PROPRIETARY';
        app.Company_Type__c='MSME';
        app.Date_of_Incorporation__c=date.newInstance(1990, 09, 08);
        app.No_of_Years_in_Business__c=15.00;
        app.MobilePhone='9787451101';
        app.Email='beetbook@gmail.com';
        app.Applicant_Type__c='APPLICANT';
        app.Stage__c='Hot';
        app.Time_At_Address_In_Years__c=9.0;
        app.Phone='9630127852';
        app.GST_Applicable__c='N';
        app.Segment__c='SERVICES';
        app.Type_of_Business__c='COMPUTER SERVICES';
        app.Cluster__c='SOFTWARE';
        app.Pan_Card__c='CPVPB1504A';
        app.RecordTypeId=recordtypeid2;    
        app.Form_60_Uploaded__c=true;
        app.Authorised_Person__c='Ram Kumar';
        app.Application_Form_Type__c='Physical Application Form';
        app.Form_60_Uploaded__c=true;
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
        

        // creating applicant loan section
        app.Product__c = 'Lead - UDYAM (UNSECURED LOAN)';
        app.Scheme__c='AMBIT Udyam-Income Based';
        app.Purpose__c='Capital Equipment';
        app.Rate_Of_Interest__c=15;
        app.Tenure_In_Months__c=45;
        app.Customer_Type__c='New';
        app.Loan_Amount__c=5000000;
        app.Occupancy_Status__c='RENTED';
        app.Nature_of_Loan__c='Renovation / Expansion';
        app.Relationship_with_Applicant__c='FATHER';
        app.Company_Name__c='TCS PVT LTD';
        
        //creating sourcing section
        app.Channel__c='DSA Manager';
        app.Channel_Type__c='DSA';
        app.Agent__c=acc.Id;
        app.Branch__c=Bra.Id;
        app.Branch_Manager__c=u2.Id;
        app.Service_Location__c=Bra.Id;
        app.Sourcing_Location__c=Bra.Id;
        app.Sourcing_Team__c='Retail';
        //updating status
        app.Status__c='CIBIL Updated';
        app.OwnerId=u1.Id;
        insert app;
        
        // Create the Co-Applicant as Individual
        
        contact coapp= new contact();
        coapp.FirstName='Ram';
        coapp.LastName='Kumar';
        coapp.Email = 'ramk@abc.com';
        coapp.Phone = '8655994455';
        coapp.MobilePhone='9787451201';
        coapp.Applicant_Father_Name__c='ramesk kumar';
        coapp.Birthdate=date.newInstance(1980, 05, 06);
        coapp.Marital_Status__c='SINGLE';
        coapp.Gender__c='Male';
        coapp.Education__c='Graduate';
        coapp.Stage__c='Hot';
        coapp.Constitution__c='INDIVIDUAL';
        coapp.Applicant_Type__c='CO-APPLICANT';
        coapp.Time_At_Address_In_Years__c=8.0;
        coapp.Time_at_Current_Address__c=0.0;
        coapp.GST_Applicable__c='N';
        coapp.Segment__c='SERVICES';
        coapp.Type_of_Business__c='COMPUTER SERVICES';
        coapp.Cluster__c='SOFTWARE';
        coapp.Pan_Card_Form_60__c='Pan Card';
        coapp.Pan_Card__c='CPVDK1252P';
        coapp.RecordTypeId=recordtypeid1;
        coapp.Authorised_Person__c='Ram Kumar';
           
        
        //created co-applicant address section
        coapp.Flat_House_Number_Office__c='25/B';
        coapp.Building_Street_Name_Office__c='5TH FLOOR';
        coapp.Area_Office__c='Ahinsha khand-2';
        coapp.District_Office__c='Ghaziabad';
        coapp.City_Office__c='NOIDA';
        coapp.State_Office__c='UTTAR PRADESH';
        coapp.Pincode_Office__c='201301';
        coapp.OVD_Office_Address__c=true;
        coapp.Mailing_Office_Address__c=false;
        coapp.Destination_Office_Address__c=true;
        coapp.Same_As_Current_Address__c=False;
        //Residance adresss
        coapp.Same_As_Current_Address__c=false;
        coapp.Flat_House_Number_Destination__c='290/B';
        coapp.Building_Street_Name_Destination__c='1ST FLOOR';
        coapp.Area_Destination__c='Ahinsha khand-2';
        coapp.District_Destination__c='Ghaziabad';
        coapp.City_Destination__c='NOIDA';
        coapp.State_Destination__c='UTTAR PRADESH';
        coapp.Pincode_Destination__c='201301';
        coapp.Mailing_Current_Address__c=true;
        coapp.Destination_Current_Address__c=false;
        coapp.Mailing_Office_Address__c=false;
       //     
        coapp.Mailing_Permanent_Address__c=false;
        coapp.Destination_Permanent_Address__c=false;
        coapp.Mailing_Office_Address__c=false;
        coapp.Flat_House_Number_Mailing__c='290/B';
        coapp.Building_Street_Name_Mailing__c='1ST FLOOR';
        coapp.Area_Mailing__c='Ahinsha khand-2';
        coapp.District_Mailing__c='Ghaziabad';
        coapp.City_Mailing__c='NOIDA';
        coapp.State_Mailing__c='UTTAR PRADESH';
        coapp.Pincode_Mailing__c='201301';
          
        coapp.Application_Form_Type__c='Physical Application Form';  
        coapp.CIBIL_ID__c='Pan Card';
        coapp.CIBIL_ID_Number__c='CPVDK1252P';
        coapp.CIBIL_ID_Upload__c=true;
        coapp.CIBIL_Score__c=750.00;
        coapp.CIBIL_SCORE_DATE__c=date.newInstance(2021,10,25);
        coapp.Consent_Received_From_Applicant__c=true;
        coapp.Form_60_Uploaded__c=true;
        coapp.OK_to_Proceed__c='Yes - Without Deviation';
        
        // creating Co-applicant loan section
        coapp.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        coapp.Scheme__c='AMBIT VYAPAR-INCOME BASED';
        coapp.Purpose__c='Capital Equipment';
        coapp.Rate_Of_Interest__c=15;
        coapp.Tenure_In_Months__c=45;
        coapp.Customer_Type__c='New';
        coapp.Loan_Amount__c=5000000;
        coapp.Occupancy_Status__c='RENTED';
        coapp.Nature_of_Loan__c='Renovation / Expansion';
        coapp.Relationship_with_Applicant__c='FATHER';
        coapp.Company_Name__c='Beeta Book Agency';
        coapp.Status__c='CIBIL Updated';
        coapp.OwnerId=u1.Id;
        coapp.Branch__c=Bra.Id;
        coapp.Branch_Manager__c=u2.Id;
        coapp.Service_Location__c=Bra.Id;
        coapp.Sourcing_Location__c=Bra.Id;  
        
         insert coapp;
        
        app.Co_Applicant_1__c=coapp.Id;
 
        update app;
        
         Loan_API__c customloanapi= new Loan_API__c();
        
        customloanapi.FORMNO__c=35675451;
        customloanapi.UNIQUE_REQUEST_ID__c=354689245;
        customloanapi.Name='loan_Creation';
         insert customloanapi;
        
       system.runAs(u1){
            
            system.debug('con id->'+app.Id); 
            list<Contact> con=[SELECT id,Pan_Card__C, Loan_Amount__c,Product__c,Gender__c,Birthdate,Name,CIBIL_ID__c,MobilePhone,Flat_House_Number_Destination__c,Building_Street_Name_Destination__c,Area_Destination__c,District_Destination__c,City_Destination__c,
                          State_Destination__c,Pincode_Destination__c,CIBIL_ID_Number__c,CIBIL_Score__c,Firstname,Lastname,Middlename,Branch__r.Name,Scheme__c,Nature_of_Loan__c,Branch_Manager__r.name,Purpose__c,Promo_Scheme__c,Channel_Type__c,Sourcing_Channel__c,Agent__r.Name,Applicant_Type__c,
                          RecordTypeId,Salutation,Marital_Status__c,Business_Type__c,Education__c,OwnerId,owner.Name,Tenure_In_Months__c,Company_Name__c,Occupancy_Status__c,Time_At_Address_In_Years__c,Email,Phone,Applicant_Father_Name__c,Constitution__c,Flat_House_Number_Mailing__c,
                          Building_Street_Name_Mailing__c,Area_Mailing__c,District_Mailing__c,City_Mailing__c,State_Mailing__c,Pincode_Mailing__c,Division__c,Customer_Type__c,Co_Applicant_1__c,Co_Applicant_2__c,Co_Applicant_3__c,Co_Applicant_4__c,
                          Co_Applicant_5__c,Co_Applicant_6__c,Co_Applicant_7__c,Co_Applicant_8__c,Co_Applicant_9__c,Co_Applicant_10__c,Co_Applicant_11__c,Co_Applicant_12__c,Co_Applicant_13__c,Co_Applicant_14__c,Co_Applicant_15__c,
                          Guarantor_1__c,Guarantor_2__c,Guarantor_3__c,Guarantor_4__c,Guarantor_5__c,Parent_Applicant__c,Parent_Applicant__r.Applicant_Code__c,FORMNO__c,OFFICE_ADDRESS_ID__c,PERMANENT_ADDRESS_ID__c,RESIDENCE_ADDRESS_ID__c,
                          GST_Applicable__c,GST_Number__c,Segment__c,Cluster__c,Type_of_Business__c,Time_at_Current_Address__c,Flat_House_Number_Office__c,Building_Street_Name_Office__c,Area_Office__c,District_Office__c,City_Office__c,State_Office__c,Pincode_Office__c,
                          Mailing_Current_Address__c,Mailing_Permanent_Address__c,Mailing_Office_Address__c,Destination_Permanent_Address__c,Destination_Office_Address__c,Destination_Current_Address__c,Pan_Card_Form_60__c,Document_No__c,Document_Type__c,Sourcing_Channel_1__c,
                          SOURCING_AGENT_1__c,Channel__c,Agent__r.Sec_Sourcing_Channel__c,Agent__r.DSA_Connector__c,Agent__r.Agent_Code__pc,Agent__r.Sourcing_Channel_2__c,CIBIL_SCORE_DATE__c,Date_of_Incorporation__c,CIN_Number__c,Company_Name_NON_ind__c,Status__c,Created_date__c,Relationship_Manager__c,Relationship_Manager__r.Name FROM Contact where id=:app.Id];
           // system.debug('ld->'+ld[0]);
             Test.startTest();
             Test.setMock(HttpCalloutMock.class, new MockHttpLoanCreation());
             Loan_Creation.Applicantload(con[0].Id);
            
            
            Test.stopTest();
            
        }
    }
}
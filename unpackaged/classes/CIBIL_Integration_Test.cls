@isTest
public class CIBIL_Integration_Test {
   
    static testMethod void AcknowledgementRequesttest(){
         //after click on cibil button
             string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string product='Lead - UDYAM (UNSECURED LOAN)';
        string dsaorconnector='DSA';
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        
        // create the Dsa Account
        Account acc=TestDataFactory.CreateAccount(accrecordtypeid, dsaorconnector);
           // Create applicant
            Contact c2=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
            c2.FirstName = 'SUNIL';
            c2.MiddleName = 'C';
            c2.LastName = 'REDDY';
            c2.Email = 'test1@abc.com';
            c2.MobilePhone = '8790000000';
            c2.Gender__c='Male';
            c2.Loan_Amount__c=7500000;
            c2.Birthdate= date.newInstance(1980, 05, 06);
            c2.CIBIL_ID_Number__c='BKEPS2836K';  
            c2.Address_Type__c='Residential Address';
            c2.Flat_House_Number_Destination__c='DOOR NO-40 FLAT NO-18';
            c2.Building_Street_Name_Destination__c='DOOR NO-40 FLAT NO-18';
            c2.Area_Destination__c='ESWARI RATHNA GARDEN APTS';
            c2.City_Destination__c='CHENNAI';
            c2.Pincode_Destination__c='600032';
            c2.State_Destination__c='TAMIL NADU';
            c2.CIBIL_ID__c='Pan Card';
            c2.District_Destination__c='CHENNAI';
        insert c2;
          system.debug('c2 id->'+c2.Id);  
        
         Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='sakshi1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='sakshi1@damcogroup.com');
        insert u2;
        system.assert(u2.Id!=null);
        system.runAs(u2){
            
            system.debug('c2 id->'+c2.Id); 
             Test.startTest();
             Test.setMock(HttpCalloutMock.class, new MockHttpResponseAcknowlogement());
             //Test.setMock(HttpCalloutMock.class, new MockHttpResponseissues());
            CIBIL_Integration.AcknowledgementRequest(c2.Id);
            
            
            Test.stopTest();
            
        }
        
        
    }
    static testMethod void AcknowledgementRequesttest2(){
         //after click on cibil button
             string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string product='Lead - VYAPAR (SECURED LOAN)';
        string dsaorconnector='DSA';
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        
        // create the Dsa Account
        Account acc=TestDataFactory.CreateAccount(accrecordtypeid, dsaorconnector);
           // Create applicant
            Contact c2=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
            c2.FirstName = 'SUNIL';
            c2.LastName = 'REDDY';
            c2.Email = 'test1@abc.com';
            c2.MobilePhone = '8790000000';
            c2.Gender__c='Male';
            c2.Loan_Amount__c=7500000;
            c2.Birthdate= date.newInstance(1980, 05, 06);
            c2.CIBIL_ID_Number__c='BKEPS2836K';  
            c2.Address_Type__c='Residential Address';
            c2.Flat_House_Number_Destination__c='DOOR NO-40 FLAT NO-18';
            c2.Building_Street_Name_Destination__c='DOOR NO-40 FLAT NO-18';
            c2.Area_Destination__c='ESWARI RATHNA GARDEN APTS';
            c2.City_Destination__c='CHENNAI';
            c2.Pincode_Destination__c='600032';
            c2.State_Destination__c='TAMIL NADU';
            c2.CIBIL_ID__c='Pan Card';
            c2.District_Destination__c='CHENNAI';
            
           insert c2;
          system.debug('c2 id->'+c2.Id);  
        
         Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='sakshi1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='sakshi1@damcogroup.com');
        insert u2;
        system.assert(u2.Id!=null);
        system.runAs(u2){
            
            system.debug('c2 id->'+c2.Id); 
             Test.startTest();
             Test.setMock(HttpCalloutMock.class, new MockHttpResponseAcknowlogement());
               //Test.setMock(HttpCalloutMock.class, new MockHttpResponseissues());
            CIBIL_Integration.AcknowledgementRequest(c2.Id);
          
            Test.stopTest();
            
        }
        
        
    }
    static testMethod void AcknowledgementRequesttest3(){
         //after click on cibil button
             string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string product='Lead - UCV';
        string dsaorconnector='DSA';
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        
        // create the Dsa Account
        Account acc=TestDataFactory.CreateAccount(accrecordtypeid, dsaorconnector);
           // Create applicant
            Contact c2=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
            c2.FirstName = 'SUNIL';
            c2.LastName = 'REDDY';
            c2.Email = 'test1@abc.com';
            c2.MobilePhone = '8790000000';
            c2.Gender__c='Male';
            c2.Loan_Amount__c=7500000;
            c2.Birthdate= date.newInstance(1980, 05, 06);
            c2.CIBIL_ID_Number__c='BKEPS2836K';  
            c2.Address_Type__c='Residential Address';
            c2.Flat_House_Number_Destination__c='DOOR NO-40 FLAT NO-18';
            c2.Building_Street_Name_Destination__c='DOOR NO-40 FLAT NO-18';
            c2.Area_Destination__c='ESWARI RATHNA GARDEN APTS';
            c2.City_Destination__c='CHENNAI';
            c2.Pincode_Destination__c='600032';
            c2.State_Destination__c='TAMIL NADU';
            c2.District_Destination__c='CHENNAI';
            c2.CIBIL_ID__c='Pan Card';
            
           insert c2;
          system.debug('c2 id->'+c2.Id);  
        
         Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='sakshi1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='sakshi1@damcogroup.com');
        insert u2;
        system.assert(u2.Id!=null);
        system.runAs(u2){
            
            system.debug('c2 id->'+c2.Id); 
             Test.startTest();
             Test.setMock(HttpCalloutMock.class, new MockHttpResponseAcknowlogement());
               //Test.setMock(HttpCalloutMock.class, new MockHttpResponseissues());
            CIBIL_Integration.AcknowledgementRequest(c2.Id);
          
            Test.stopTest();
            
        }
        
        
    }
    
     static testMethod void validationtest(){
         //after click on cibil button
             string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string product='Lead - UCV';
        string dsaorconnector='DSA';
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        
        // create the Dsa Account
        Account acc=TestDataFactory.CreateAccount(accrecordtypeid, dsaorconnector);
           // Create applicant
            Contact c2=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
            c2.FirstName = 'SUNIL';
            c2.LastName = 'REDDY';
            c2.Email = 'test1@abc.com';
            c2.MobilePhone = '8790000000';
            c2.Gender__c='Male';
            c2.Loan_Amount__c=7500000;
            c2.Birthdate= date.newInstance(1980, 05, 06);
            c2.CIBIL_ID_Number__c='BKEPS2836K';  
            c2.Address_Type__c='Residential Address';
            c2.Flat_House_Number_Destination__c='DOOR NO-40 FLAT NO-18';
            c2.Building_Street_Name_Destination__c='DOOR NO-40 FLAT NO-18';
            c2.Area_Destination__c='ESWARI RATHNA GARDEN APTS';
            c2.City_Destination__c='CHENNAI';
            c2.Pincode_Destination__c='600032';
            c2.State_Destination__c='TAMIL NADU';
            
            
           insert c2;
          system.debug('c2 id->'+c2.Id);  
        
         Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='sakshi1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='sakshi1@damcogroup.com');
        insert u2;
        system.assert(u2.Id!=null);
        system.runAs(u2){
            
            system.debug('c2 id->'+c2.Id); 
             Test.startTest();
             Test.setMock(HttpCalloutMock.class, new MockHttpResponseAcknowlogement());
               //Test.setMock(HttpCalloutMock.class, new MockHttpResponseissues());
            CIBIL_Integration.AcknowledgementRequest(c2.Id);
          
            Test.stopTest();
            
        }
        
        
    }

    static testMethod void cibiscoretest(){
         //after click on cibil button
             string recordtypeid =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string product='Lead - UCV';
        string dsaorconnector='DSA';
        string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        
        // create the Dsa Account
        Account acc=TestDataFactory.CreateAccount(accrecordtypeid, dsaorconnector);
           // Create applicant
            Contact c2=TestDataFactory.CreateApplicantbulk(recordtypeid, product,false);
            c2.FirstName = 'SUNIL';
            c2.LastName = 'REDDY';
            c2.Email = 'test1@abc.com';
            c2.MobilePhone = '8790000000';
            c2.Gender__c='Male';
            c2.Loan_Amount__c=7500000;
            c2.Birthdate= date.newInstance(1980, 05, 06);
            c2.CIBIL_ID_Number__c='BKEPS2836K';  
            c2.Address_Type__c='Residential Address';
            c2.Flat_House_Number_Destination__c='DOOR NO-40 FLAT NO-18';
            c2.Building_Street_Name_Destination__c='DOOR NO-40 FLAT NO-18';
            c2.Area_Destination__c='ESWARI RATHNA GARDEN APTS';
            c2.City_Destination__c='CHENNAI';
            c2.Pincode_Destination__c='600032';
            c2.State_Destination__c='TAMIL NADU';
            c2.CIBIL_Score__c=800;
            
           insert c2;
         
        
         Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='sakshi1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='sakshi1@damcogroup.com');
        insert u2;
        system.assert(u2.Id!=null);
        system.runAs(u2){
            
            
             Test.startTest();
             Test.setMock(HttpCalloutMock.class, new MockHttpResponseAcknowlogement());
              CIBIL_Integration.AcknowledgementRequest(c2.Id);
              Test.stopTest();
            
        }
        
        
    }

}
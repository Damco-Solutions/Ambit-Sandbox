@isTest
public class ShareRecordsToManagers_Test {
    public static testmethod void test1(){
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Sales Profile'];
        // inserting role in data setup
        UserRole SalesOfficer = new UserRole(Name ='Sales Officer-Rest of India');
        insert SalesOfficer;
        UserRole SalesManager = new UserRole(Name ='Sales Manager-Rest of India');
        insert SalesManager;
        UserRole BranchManager = new UserRole(Name ='Branch Manager-Rest of India');
        insert BranchManager;
        
        // inserting Users in data setup
        User BManager = new User(Alias = 'standt2', Email='Ambitstandarduser2@testorg.com', 
                                 EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                                 LocaleSidKey='en_US', ProfileId = p.Id,UserRoleId=BranchManager.id, 
                                 TimeZoneSidKey='America/Los_Angeles', UserName='Ambitstandarduser2@testorg.com');
        insert BManager;
        
        User SManager = new User(Alias ='standt1', Email='Ambitstandarduser1@testorg.com', 
                                 EmailEncodingKey='UTF-8', LastName='Testing13', LanguageLocaleKey='en_US', 
                                 LocaleSidKey='en_US', ProfileId = p.Id,UserRoleId=SalesManager.id,managerID=BManager.id, 
                                 TimeZoneSidKey='America/Los_Angeles', UserName='Ambitstandarduser13@aol.com');
        insert SManager;
        
        User sales = new User(Alias = 'standt', Email='Ambitstandarduser@testorg.com', 
                              EmailEncodingKey='UTF-8', LastName='Testing2', LanguageLocaleKey='en_US', 
                              LocaleSidKey='en_US', ProfileId = p.Id,UserRoleId=SalesOfficer.id,managerID=SManager.id, 
                              TimeZoneSidKey='America/Los_Angeles', UserName='Ambitstandarduser@ask.com');
        insert sales;
        
        system.runAs(sales){
            
            Contact c = new Contact();
            c.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
            c.FirstName = 'Test';
            c.LastName = 'Name';
            c.Email = 'test@abc.com';
            c.Phone = '86559944';
            c.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
            insert c;
            
            Loan_Account__c la = new Loan_Account__c();
            la.Applicant__c = c.id;
            la.LOAN_STATUS__c='Pending';
            la.OwnerId=sales.Id;
            insert la;
            
            Meeting__c meet = new Meeting__c ();
            meet.Status__c = 'Scheduled';
            meet.Loan_Account__c = la.id;
            insert meet;
            
            Account branch = new Account();
            branch.name = 'Allahabad';
            branch.Branch_Manager__c = SManager.id;
            branch.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Branch').getRecordTypeId();
            insert branch;
            
            Account branch2 = new Account();
            branch2.name = 'CORPORATE';
            branch2.Branch_Manager__c = SManager.id;
            branch2.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Branch').getRecordTypeId();
            insert branch2;
            
            Account  dsa= new Account();
            dsa.Agent_Branch__c = branch.id;
            dsa.name = 'test dsa';
            insert dsa;
            
            Account  dsa2= new Account();
            dsa2.Agent_Branch__c = branch2.id;
            dsa2.name = 'test dsa2';
            insert dsa2;
            
            Sales_Incentive__c si = new Sales_Incentive__c();
            si.DSA_Connector__c = dsa.id;
            insert si;
            
            Sales_Incentive__c si2 = new Sales_Incentive__c();
            si2.Salesperson_Agent__c = SManager.id;
            insert si2;
            
            Sales_Incentive__c si3 = new Sales_Incentive__c();
            si3.DSA_Connector__c = dsa2.id;
            insert si3;
            
        }
        
    }
    
}
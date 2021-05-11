@isTest
public class CreateLoanApplication_Test {
    Public static testmethod void test1(){
        Contact c = new Contact();
        c.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Email = 'test@abc.com';
        c.Phone = '86559944';
        c.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        c.CIBIL_ID__c = 'Passport Number';
        c.CIBIL_ID_Number__c = '123';
        c.status__c = 'Prospect';
        insert c;
        List<Contact> conList = new List<Contact>();
        conList.add(c);
        CreateLoanApplication.CreateLA(conList);
    }
}
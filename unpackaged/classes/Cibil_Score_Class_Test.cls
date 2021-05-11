@isTest
public class Cibil_Score_Class_Test {
    public static testmethod void testCibil(){
        Contact c = new Contact();
        c.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        //c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Email = 'test@abc.com';
        c.Phone = '86559944';
        c.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        c.CIBIL_ID__c = 'Passport Number';
        c.CIBIL_ID_Number__c = '123';
        insert c;
        
        Contact c2 = new Contact();
        c2.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        c2.FirstName = 'Test2';
        c2.LastName = 'Name2';
        c2.Email = 'test2@abc.com';
        c2.Phone = '865599666';
        c2.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        c2.CIBIL_ID__c = 'Passport Number';
        insert c2;
        
        Cibil_Score_Class.returnScore(c.id);
        Cibil_Score_Class.returnScore(c2.id);
    }
}
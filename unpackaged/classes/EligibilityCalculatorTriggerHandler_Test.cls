@isTest
public class EligibilityCalculatorTriggerHandler_Test {
    public static testmethod void testABB(){
        Contact c = new Contact();
        c.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Email = 'test@abc.com';
        c.Phone = '86559944';
        c.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        insert c;
        
        Eligibility_Calculator__c ec = new Eligibility_Calculator__c();
        ec.Applicant__c = c.id;
        ec.X2nd_of_Month1__c = 100;
        ec.X8th_of_Month1__c = 110;
        ec.X15th_of_Month1__c = 110;
        ec.X22nd_of_Month1__c = 120;
        ec.X27th_of_Month1__c = 130;
        ec.X2nd_of_Month2__c = 100;
        ec.X8th_of_Month2__c = 110;
        ec.X15th_of_Month2__c = 110;
        ec.X22nd_of_Month2__c = 120;
        ec.X27th_of_Month2__c = 130;
        insert ec;
        
    }
}
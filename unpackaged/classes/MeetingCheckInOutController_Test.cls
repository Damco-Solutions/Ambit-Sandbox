@isTest
public class MeetingCheckInOutController_Test {
    public HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('http://example.com/example/test', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        //res.setBody('{"example":"test"}');
        res.setBody('"results" : [{"address_components" : [{"long_name" : "108","short_name" : "108","types" : [ "premise" ]},{"long_name" : "Parmeshwari Colony","short_name" : "Parmeshwari Colony","types" : [ "neighborhood", "political" ]},{"long_name" : "Sector 31","short_name" : "Sector 31","types" : [ "political", "sublocality", "sublocality_level_1" ]},]');
        res.setStatusCode(200);
        return res;
    }
    public static testmethod void testCheckIn(){
        Contact c = new Contact();
        c.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Email = 'test@abc.com';
        c.Phone = '86559944';
        c.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        insert c;
        
        Meeting__c meet = new Meeting__c();
        meet.Salesperson__c = UserInfo.getUserId();
        meet.Status__c = 'Scheduled';
        meet.Applicant__c = c.id;
        insert meet;
        
        test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        MeetingCheckInOutController.checkIn('5.615986','21.772105',meet.id);
        test.stopTest();
    }
    public static testmethod void testCheckOut(){
        Contact c = new Contact();
        c.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Email = 'test@abc.com';
        c.Phone = '86559944';
        c.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        insert c;
        
        Meeting__c meet = new Meeting__c();
        meet.Salesperson__c = UserInfo.getUserId();
        meet.Status__c = 'In Progress';
        meet.Applicant__c = c.id;
        insert meet;
        
        test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        MeetingCheckInOutController.checkOut('5.615986','21.772105',meet.id);
        test.stopTest();
    }
}
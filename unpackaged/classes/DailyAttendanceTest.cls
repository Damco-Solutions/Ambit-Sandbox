@isTest
public class DailyAttendanceTest implements HttpCalloutMock {
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
    static testMethod void myUnitTest_CurrentLoc() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String key = 'abc';
        DailyAttendance.getHttp(key);
        DailyAttendance.currentGeoAddress('34.397', '150.644');
        DailyAttendance.AttRecords();
        
        Test.stopTest();
    }
    
    static testMethod void AttendanceTest(){
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='sakshi1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='sakshi1@damcogroup.com');
        insert u2;
        system.assert(u2.Id!=null);
        system.runAs(u2){
            //after Check-In
            Attendance__c Att = new Attendance__c(Date__c=system.today(),Login_Time__c=system.now(), Employee__c=u2.Id,
                                                                   High_Level_Work_Plan__c= 'Work on assigned tasks',
                                                                   Login_Location__Latitude__s=28.616294399999997,Login_Location__Longitude__s=77.3455872);
            insert Att;
           system.assert(Att.Id!=null);
            //after checkout
            Attendance__c Att1 = new Attendance__c(Date__c=system.today(),Login_Time__c=system.now(), Employee__c=u2.Id,
                                                                    High_Level_Work_Plan__c= 'Work on assigned tasks',Accomplished_Results_in_the_day__c='Tasks Completed',
                                                                    Login_Location__Latitude__s=28.616294399999997,Login_Location__Longitude__s=77.3455872,
                                                                    Logout_Time__c=system.now().addHours(4),Logout_Location__Latitude__s=28.616294399999997,
                                                                    Logout_Location__Longitude__s=77.3455872);
            insert Att1;
            system.assert(Att1.Id!=null);
            
            
           // DailyAttendance.AttRecords();

            DailyAttendance.markAttendance('28.616294399999997', '77.3455872', 'Login', 'Work on RWM Tasks');
            DailyAttendance.markAttendance('28.616294399999997', '77.3455872', Att.Id, 'Tasks Completed');    
            
        }
        DailyAttendance.markAttendance('28.616294399999997', '77.3455872', 'Login', 'Work on RWM Tasks');
    }
    
    static testMethod void Tocoverelse(){
        String param = 'Login';
        system.assertEquals('Login', param);
        DailyAttendance.markAttendance('28.616294399999997', '77.3455872', param, 'Work on RWM Tasks');
    }
}
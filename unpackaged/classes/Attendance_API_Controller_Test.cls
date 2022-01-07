@isTest
private class Attendance_API_Controller_Test {

    @testSetup
    static void dataSetup() {
        
        
         Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        //creating user
        User u2 = new User(Alias = 'standt', Email='sakshi1@damcogroup.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='sakshi1@damcogroup.com',EmployeeNumber='1234',Branch__c='Delhi');
        insert u2;
        
        Attendance__c att = new Attendance__c();
        att.Date__c= date.newInstance(2021, 08,01);
        att.Login_Address__c='4th AveB BlockSector 4,Gautam Buddh Nagar,UP';
        att.Logout_Address__c='4th AveB BlockSector 4,Gautam Buddh Nagar,UP';
        att.Login_Time__c= datetime.newInstance(2021,08,01,10, 05,45);
        att.Logout_Time__c= datetime.newInstance(2021,08,01,19,15,45);
        att.OwnerId=u2.id;
        insert att;
    }
    
    static testMethod void testGet() {
        Attendance__c acc = [ SELECT Name, Date__c, Login_Time__c,Login_Address__c,Logout_Time__c,Logout_Address__c,Employee_Number__c 
                                  FROM Attendance__c ];
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();             
        req.requestURI = '/services/apexrest/Attendance_api/?From_Date=08/02/2021&To_Date=08/03/2021';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response= res;
        string attResp = Attendance_API_Controller.getAttendance();
       // system.assertEquals(acctResp.Name, 'Testing');
    }
     static testMethod void testdatetofrom() {
        Attendance__c acc = [ SELECT Name, Date__c, Login_Time__c,Login_Address__c,Logout_Time__c,Logout_Address__c,Employee_Number__c 
                                  FROM Attendance__c ];
         Date startDate = date.newInstance(2021, 08,01);
        Date endDate = date.newInstance(2021, 08,01);
         String fromDate = startDate.format();
          String toDate = endDate.format();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();             
        req.requestURI = '/services/apexrest/Attendance_api/';
         req.addParameter('From_Date',fromDate);
         req.addParameter('To_Date',toDate);
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response= res;
        string attResp = Attendance_API_Controller.getAttendance();
       
    }
     static testMethod void testdatetofromempty() {
        Attendance__c acc = [ SELECT Name, Date__c, Login_Time__c,Login_Address__c,Logout_Time__c,Logout_Address__c,Employee_Number__c 
                                  FROM Attendance__c ];
         Date startDate = date.newInstance(2021, 08,03);
        Date endDate = date.newInstance(2021, 08,05);
         String fromDate = startDate.format();
          String toDate = endDate.format();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();             
        req.requestURI = '/services/apexrest/Attendance_api/';
         req.addParameter('From_Date',fromDate);
         req.addParameter('To_Date',toDate);
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response= res;
        string attResp = Attendance_API_Controller.getAttendance();
       
    }
       static testMethod void testdatetofromEmpno() {
        Attendance__c acc = [ SELECT Name, Date__c, Login_Time__c,Login_Address__c,Logout_Time__c,Logout_Address__c,Employee_Number__c 
                                  FROM Attendance__c ];
         Date startDate = date.newInstance(2021, 08,01);
        Date endDate = date.newInstance(2021, 08,01);
         String fromDate = startDate.format();
          String toDate = endDate.format();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();             
        req.requestURI = '/services/apexrest/Attendance_api/';
         req.addParameter('From_Date',fromDate);
         req.addParameter('To_Date',toDate);
         req.addParameter('Employee_id','1234');
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response= res;
        string attResp = Attendance_API_Controller.getAttendance();
       
    }
}
@RestResource(urlMapping='/Attendance_api/*')
global class Attendance_API_Controller {
     @HttpGet
    global static string getAttendance() {
     List<Attendance__c> Attendance= new List<Attendance__c>();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        res.addHeader('Content-Type', 'application/json');    
        String jsonResponse = '';
        String From_Date = req.params.get('From_Date');
        String To_Date = req.params.get('To_Date');
        string Employee_id=req.params.get('Employee_id');
        
// No To_Date or From_Date parameter was found; return status 400
        if(From_Date == null  || To_Date==null ) {
            res.statusCode = 400;
            jsonResponse = '{"response": {"status": "Failure", "message": "Missing Required Query Parameter From_Date or To_Date "}}';
            res.responseBody = blob.valueOf(jsonResponse);
            return jsonResponse;
        }
 
// Get the list of Attendance that match the account_name sent in the request.
        if(From_Date!= null && To_Date!=null && Employee_id==null) {
             date frdate=date.parse(From_Date);
            date todate=date.parse(To_Date);
                       
          Attendance = [SELECT Name, Date__c, Login_Time__c,Login_Address__c,Logout_Time__c,Logout_Address__c,Employee_Number__c 
                                  FROM Attendance__c
                                  WHERE Date__c >=:frdate  and Date__c <=:todate ];            
        }
        if(From_Date!= null && To_Date!=null && Employee_id!=null) {
             date frdate=date.parse(From_Date);
            date todate=date.parse(To_Date);            
          Attendance = [SELECT Name, Date__c, Login_Time__c,Login_Address__c,Logout_Time__c,Logout_Address__c,Employee_Number__c 
                                  FROM Attendance__c
                                  WHERE Date__c >=:frdate  and Date__c <=:todate and Employee_Number__c=:Employee_id];       
        }       
        // No Attendance with matching From_Date or To_Date or Employee_id
        if( Attendance.isEmpty()) {
            res.statusCode = 400;
            jsonResponse = '{"response": {"status": "Failure", "message": "No Record found"}}';      
           
              res.responseBody=blob.valueOf(jsonResponse);
            
            return jsonResponse ;
        }
 
// At least 1 account was found, JSON serialize it and send it back.
        try {
            res.statusCode = 200;
            jsonResponse = Json.serialize(Attendance);
            res.responseBody = blob.valueOf(jsonResponse);
            return jsonResponse;
        } catch ( Exception ex ) {
            res.statusCode = 500;
            jsonResponse = '{"response": {"status": "Failure", "message": "' + ex + '"}}';
            res.responseBody = blob.valueOf(jsonResponse);
            return jsonResponse;
        }
    }

}
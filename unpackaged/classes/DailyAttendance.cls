public class DailyAttendance {
    public static List<Attendance__c> AttLogin;
    //method runs on page load and gets todays loggedin user Attendance record
    @AuraEnabled
    public static List<Attendance__c> AttRecords(){
        id Empid = userinfo.getuserId();
        date AttendanceDate = system.today();
        String loginlatitude;
        String loginlongitude;
        String logoutlatitude;
        String logoutlongitude;
        string result = '';
        map<string,string>Getfulladdress= new Map<string,string>();
        
        if(Empid != null && AttendanceDate != null) {
                AttLogin = [Select id,Date__c,Employee__c,High_Level_Work_Plan__c,Login_Time__c,Login_Location__Latitude__s, Login_Location__Longitude__s,Approved__c, Day_of_the_Week__c
                            ,Logout_Location__Latitude__s, Logout_Location__Longitude__s, Logout_Time__c,Accomplished_Results_in_the_day__c From Attendance__c 
                            WHERE Employee__c =:Empid AND  Date__c =: AttendanceDate LIMIT 1];
            if(AttLogin!=null){
                for(Attendance__c at :AttLogin){
                    loginlatitude= string.valueOf(at.Login_Location__Latitude__s);
                    loginlongitude=string.valueOf(at.Login_Location__Longitude__s);
                    logoutlatitude= string.valueOf(at.Logout_Location__Latitude__s);
                    logoutlongitude=string.valueOf(at.Logout_Location__Longitude__s);
                    if(((string.isNotEmpty(loginlatitude)&& string.isNotEmpty(loginlongitude) && logoutlatitude==null && logoutlongitude==null))||(string.isNotEmpty(loginlatitude)&& string.isNotEmpty(loginlongitude))){
                        Getfulladdress=currentGeoAddress(loginlatitude,loginlongitude);
                    at.Login_Address__c=Getfulladdress.get('premise')+Getfulladdress.get('neighborhood')+Getfulladdress.get('sublocality')+','+Getfulladdress.get('city2')+','+Getfulladdress.get('StateName');

                    }
                    if(string.isNotEmpty(logoutlatitude)&& string.isNotEmpty(logoutlongitude) ){
                        Getfulladdress=currentGeoAddress(logoutlatitude,logoutlongitude);
                    at.Logout_Address__c=Getfulladdress.get('premise')+Getfulladdress.get('neighborhood')+Getfulladdress.get('sublocality')+','+Getfulladdress.get('city2')+','+Getfulladdress.get('StateName');
                    }
                    try{
                        update at;
                        result = 'success';
                    }
                    catch(DmlException e){
                        result = e.getMessage();
                    }

                  }    
            }
            }
        system.debug('AttLogin>>'+AttLogin);
        return AttLogin;
    }
    
    @AuraEnabled
    public static String markAttendance(String latitude, String longitude,String requestType,String Todaywork){
        
            List<User> EmpList =[select id from User where id=: userinfo.getuserId() limit 1];              
            
            
            if(requestType=='Login'){
                system.debug('Inside login>>>');
                if(EmpList.size() >0){
                    Attendance__c da = new Attendance__c();        
                    da.Employee__c = EmpList[0].Id;
                    
                    da.Login_Time__c = system.now();
                    da.Date__c = System.today();
                    da.Login_Location__Latitude__s = decimal.valueof(latitude);
                    da.Login_Location__Longitude__s = decimal.valueof(longitude);
                    da.High_Level_Work_Plan__c=Todaywork;
                    
                    EmpList[0].LastKnownLocation__Latitude__s = decimal.valueof(latitude);
                    EmpList[0].LastKnownLocation__Longitude__s = decimal.valueof(longitude);
                    
                           try{            
                               insert da;
                               update EmpList[0];
                               system.debug('emp: '+EmpList[0]);
                           }
                           catch(exception e) {
                               throw new AuraHandledException('Error Occured: '+e.getMessage());
                           } 
                       
                }else{
                    return 'No Employee Found!';
                }
                return 'login';
            }
            else{
                
                system.debug('Inside logout>>>');
                       if(!EmpList.isEmpty() && requestType !='' && requestType != null && requestType !='null'){
                       Attendance__c dat = [Select Id, Logout_Time__c,Logout_Location__Latitude__s,
                                                               Logout_Location__Longitude__s,Accomplished_Results_in_the_day__c FROM Attendance__c
                                                               WHERE Id =:requestType];
                       dat.Logout_Time__c = system.now();
                       dat.Logout_Location__Latitude__s = decimal.valueof(latitude);
                       dat.Logout_Location__Longitude__s = decimal.valueof(longitude);
                           dat.Accomplished_Results_in_the_day__c=Todaywork;
                           
                           EmpList[0].LastKnownLocation__Latitude__s = decimal.valueof(latitude);
                           EmpList[0].LastKnownLocation__Longitude__s = decimal.valueof(longitude);
                           try{
                               update dat;
                               update EmpList[0];
                           }
                              catch(exception e) {
                                  throw new AuraHandledException('Error Occured: '+e.getMessage());
                              }
                          
            }
			}
        return 'logout';
    }
    
    public static string getHttp(string strURL){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod('GET');
        req.setEndpoint(strURL);
        req.setTimeout(120000);
        res = h.send(req); 
        String responseBody = res.getBody();
        system.debug('Status Code: '+res.getStatusCode() + 'Status: '+ res.getStatus());
        system.debug('response: '+responseBody);
        return responseBody;
    }
   @AuraEnabled
    public static Map<String,string> currentGeoAddress(String latitude, String longitude){
        
        String url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='+latitude+','+longitude+'&key=AIzaSyDOzfa37-Dvfv9dlX_OKhkxQxHh4EJKVmg';
        system.debug('url: '+ url);
        String jsonResult = getHttp(url);
        Map<String,Object> JsonMap = (Map<String,Object>)JSON.deserializeUntyped(jsonResult);
        //System.debug('jsonResult '+jsonResult);
        List<Object> resultsObj = (List<Object>)JsonMap.get('results');
        Map<String,Object> resultMap = (Map<String,Object>)resultsObj[0];
        List<Object> l2 = (List<Object>)resultMap.get('address_components');
        String premise = '';
        String neighborhood = '';
        String sublocality = '';
        String City1= '';
        String City2= '';
        String StateName= '';
        String countryName= '';
        String psCode= '';
        String fullAddress = '';
        fullAddress = (string)resultMap.get('formatted_address');
        
        Map<String,string> addressCompMap = new Map<String,string>();
        for(Integer i=0; i<l2.size(); i++){
            String s = JSON.serialize(l2[i]);
            JSONParser parser = JSON.createParser(s);
            while(parser.nextToken()!= null) {
                
                switch on parser.getText(){
                    when 'premise','route'{ 
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        
                        premise = parser.getText();
                        break;
                        
                    }  
                    
                    when 'neighborhood'{
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        neighborhood= parser.getText();
                        
                    }   
                    
                    when 'political'
                    {
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        sublocality = parser.getText();
                        break;
                    }   
                    
                    when 'locality'
                    {
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        City1 = parser.getText();
                        break;
                    }   
                    
                    when 'administrative_area_level_2'
                    {
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        city2 = parser.getText();
                        break;
                    }
                    when 'administrative_area_level_1'
                    {
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        //parser.nextToken();
                        //parser.nextToken();
                        //parser.nextToken();
                        StateName = parser.getText();
                        break;
                    }   
                    
                    when 'country'
                    {
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        //parser.nextToken();
                        //parser.nextToken();
                        
                        
                        //System.debug('parser.getText() '+parser.getText());
                        countryName = parser.getText();
                        break;
                    }   
                    
                    when 'postal_code'
                    {
                        parser.nextToken();
                        parser.nextToken();
                        parser.nextToken();
                        psCode = parser.getText();
                        break;
                    }
                }
            }
            //System.debug('StateName '+StateName);
            addressCompMap.put('premise',(String)premise);
            addressCompMap.put('neighborhood',(String)neighborhood);
            addressCompMap.put('sublocality',(String)sublocality);
            addressCompMap.put('city1',(String)city1);
            addressCompMap.put('city2',(String)city2);
            addressCompMap.put('StateName',(String)StateName);
            addressCompMap.put('countryName',(String)countryName);
            addressCompMap.put('psCode',(String)psCode);
            addressCompMap.put('fullAddress',fullAddress);
        }
        return addressCompMap;
    }

}
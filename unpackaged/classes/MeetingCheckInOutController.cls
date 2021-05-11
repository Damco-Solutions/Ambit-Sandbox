public class MeetingCheckInOutController {
    
    //google api to get driving distance
    public static string getAddressAutoComplete(String SalespersonLat,String SalespersonLong,String CheckInLat,String CheckInLong) {
        string GoogleApiURL=label.GoogleApiURL;
        string ApiKey = label.googelApikey;
        String url = GoogleApiURL+
            + SalespersonLat + ','+ SalespersonLong + '&destinations=' +  CheckInLat + ',' + CheckInLong
            + '&key=' + ApiKey;
        return MeetingCheckInOutController.getHttp(url);
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
        system.debug('response: '+responseBody);
        return responseBody;
    }
    
    @AuraEnabled
    public static string checkIn(String latitude, String longitude, String recId){
        Meeting__c Meet = [select id, Salesperson__c,Salesperson__r.LastKnownLocation__Longitude__s,Salesperson__r.LastKnownLocation__Latitude__s
                           ,Scheduled_Start_Time__c,Check_In_Time__c,OwnerId FROM Meeting__c WHERE id=:recId];
        string result = '';
        User u = new user();
        if(Meet.OwnerId!=null){
            u=[select id, Name,LastKnownLocation__Longitude__s,LastKnownLocation__Latitude__s FROM User where id=:Meet.OwnerId];
        }
        if(system.now() < meet.Scheduled_Start_Time__c){
            result = 'Meeting can not be started before scheduled time';
        }
        else if(meet.Check_in_Time__c != null){
            result = 'Meeting is already checked in';
        }
        else{ 
            meet.Check_in_Time__c = system.now();
            meet.Status__c = 'In Progress';
            map<string,string> fullAddressMap= new Map<string,string>();
            if(string.isNotBlank(latitude) && string.isNotBlank(longitude)){
                fullAddressMap = DailyAttendance.currentGeoAddress(latitude,longitude);
                meet.Check_In_Location__c = fullAddressMap.get('premise')+fullAddressMap.get('neighborhood')+fullAddressMap.get('sublocality')+','+fullAddressMap.get('city2')+','+fullAddressMap.get('StateName');
                if(u.LastKnownLocation__Latitude__s!=null && u.LastKnownLocation__Longitude__s!=null){
                       system.debug('lat= '+u.LastKnownLocation__Latitude__s);
                       system.debug('lon= '+u.LastKnownLocation__Longitude__s);
                       String SalespersonLat = string.valueOf(u.LastKnownLocation__Latitude__s);
                       String SalespersonLong = string.valueOf(u.LastKnownLocation__Longitude__s);
                       
                       String Distance = MeetingCheckInOutController.getAddressAutoComplete(SalespersonLat,SalespersonLong,latitude,longitude);
                       Distance = Distance.deleteWhitespace();
                       string dis = Distance.substringBetween('"value":','},"duration":');
                       Decimal disTravelled = null;   
                       if(dis != null){
                           system.debug('distance= '+dis);
                           disTravelled = decimal.valueOf(dis)/1000;
                           disTravelled = disTravelled.setscale(2);
                           meet.Distance_Traveled_In_km__c = disTravelled;
                       }
                   }
                 u.id = meet.OwnerId;
                u.LastKnownLocation__Latitude__s = Decimal.valueOf(latitude);
                u.LastKnownLocation__Longitude__s = Decimal.valueOf(longitude); 
            }
            
            try{
                update meet;
                Update u;
                result = 'success';
            }
            catch(DmlException e){
                result = e.getMessage();
            }
        }
        return result;
    }
    
    @AuraEnabled
    public static string checkOut(String latitude, String longitude,String recId){
        Meeting__c meet = [select id,Status__c, Salesperson__c,OwnerId FROM Meeting__c WHERE id=:recId];
        string result = '';
        if(meet.Status__c != 'In Progress'){
            result = 'Only In Progress meetings can be checked out';
        }
        else{
            User u = new User();
            meet.Check_out_Time__c = system.now();
            meet.Status__c = 'Completed';
            map<string,string> fullAddressMap= new Map<string,string>();
            if(string.isNotBlank(latitude) && string.isNotBlank(longitude)){
                fullAddressMap = DailyAttendance.currentGeoAddress(latitude,longitude);
                meet.Check_Out_Location__c = fullAddressMap.get('premise')+fullAddressMap.get('neighborhood')+fullAddressMap.get('sublocality')+','+fullAddressMap.get('city2')+','+fullAddressMap.get('StateName');
                
                //upate user geo location
                u.Id = meet.OwnerId;
                u.LastKnownLocation__Latitude__s = Decimal.valueOf(latitude);
                u.LastKnownLocation__Longitude__s = Decimal.valueOf(longitude);    
            }
            try{
                update meet;
                update u;
                result = 'success';
            }
            catch(DmlException e){
                result = e.getMessage();
            }
        }
        return result;
    }
}
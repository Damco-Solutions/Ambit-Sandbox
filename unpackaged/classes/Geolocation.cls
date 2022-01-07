public class Geolocation {
public Id eventId {get; set;}
 
    public Geolocation(ApexPages.StandardController stdController) {
        Meeting__C currentEvent = (Meeting__C)stdController.getRecord();
        eventId = currentEvent.Id;
    }
 
    @RemoteAction
    public static Boolean updateGeolocation(string evntId, String lat, String lng) {
        system.debug('location Data '+evntId+','+lat + ' , ' + lng);
      //  Event eventToBeUpdated = [SELECT Id FROM Event WHERE Id = :evntId];
        // below line is optional as it sets the current time in Check-Out field on event record
      //  eventToBeUpdated.Check_Out_Time__c = System.now();
      //  eventToBeUpdated.Location = lat + ' , ' + lng;
       // update eventToBeUpdated;
 
        return true;
    }
}
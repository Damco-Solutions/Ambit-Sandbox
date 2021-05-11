({
    cmpLoad : function(component, item, callback){
        
         if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var lat = position.coords.latitude;
                var lon = position.coords.longitude;
                  component.set("v.lat", lat);
                component.set("v.lon", lon);
            });
         }
                 else {
            alert('Your Device does not support GeoLocation');
        }
        
        var action = component.get("c.AttRecords");
        action.setCallback(this, function(response) {
            var state = response.getState();
            var val = response.getReturnValue();
          
            
            if (state === "SUCCESS") {
                component.set("v.record", val[0]);
                var Desc = component.get("v.record.High_Level_Work_Plan__c")
                var loTime = component.get("v.record.Logout_Time__c");
                //var loTime = component.get("v.record.Logout_Time__c");
                var LoginLatitude = component.get("v.record.Login_Location__Latitude__s");
                var LoginLongitude = component.get("v.record.Login_Location__Longitude__s");
                var LogoutLatitude = component.get("v.record.Logout_Location__Latitude__s");
                var LogoutLongitude = component.get("v.record.Logout_Location__Longitude__s ");
                var Loginaddress= component.get("v.record.Login_Address__c");
                var Logoutaddress= component.get("v.record.Logout_Address__c");
               
                if(LoginLatitude!=undefined && LogoutLatitude==undefined)
                {
                    component.set('v.mapMarkers', [
                        {
                            location: {
                                Latitude : LoginLatitude,
                                Longitude : LoginLongitude,
                                Street: Loginaddress,
                                City:'',
                                Country: 'INDIA'
                               
            
                            },
                            value: 'Login Geo Coordinates',
                            title: 'Login Location',
                            description:Desc
                            
                        },
                     {
                               location: {
                                Latitude : '',
                                Longitude : '',
                                Street: '',
                                City:'',
                                Country: '' 
                            },
                            value: 'Logout Geo Coordinates',
                            title: 'Logout Location',
                            description:component.get("v.record.Accomplished_Results_in_the_day__c")
                        } 
                    ]);
                } 
                if(LoginLatitude!=undefined && LogoutLatitude!=undefined)
                {
                    component.set('v.mapMarkers', [
                        {
                            location: {
                                Latitude : LoginLatitude,
                                Longitude : LoginLongitude,
                                Street: Loginaddress,
                                City:'',
                                Country: 'INDIA'
                               
            
                            },
                            value: 'Login Geo Coordinates',
                            title: 'Login Location',
                            description:Desc
                            
                        },
                        {
                            location: {
                                Latitude : LogoutLatitude,
                                Longitude : LogoutLongitude,
                                Street: Logoutaddress,
                                City:'',
                                Country: 'INDIA' 
                            },
                            value: 'Logout Geo Coordinates',
                            title: 'Logout Location',
                            description:component.get("v.record.Accomplished_Results_in_the_day__c")
                        }
                    ]);
                }
                var recId = component.get("v.record.Id");
                if(val.length == 0 ){
                    component.set("v.disableLoginBtn", false);
                }
                if($A.util.isEmpty(loTime) && val.length != 0 ){
                    component.set("v.disableLogoutBtn", false);
                }
            }
        });
        $A.enqueueAction(action);
    },
    GeoLoc : function(component, item, callback) {
        component.set("v.isOpen", false);
        component.set("v.ShowSpinner", true);
        var Todayworks= component.get("v.HighLevelWorkPlan");
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var lat = position.coords.latitude;
                var lon = position.coords.longitude;
                var action = component.get("c.markAttendance");
                action.setParams({
                    "latitude": lat,
                    "longitude": lon,
                    "requestType":item,
                    "Todaywork":Todayworks
                });
                action.setStorable({
                    ignoreExisting: true
                });
                action.setCallback(this, function(response) {
                    var state = response.getState();
                    
                    if (state == "SUCCESS") {
                        component.set("v.ShowSpinner", false);
                        $A.get('e.force:refreshView').fire();
                        
                        
                        if(response.getReturnValue() == 'login'){
                            component.set("v.disableLoginBtn", true);
                            component.set("v.disableLogoutBtn", false);
                            var toastEvent = $A.get("e.force:showToast");
                            toastEvent.setParams({
                                "title": "Success!",
                                "type": 'success',
                                "message": "Login Successfully."
                            });
                            toastEvent.fire();
                        }
                        if(response.getReturnValue() == 'logout'){
                            component.set("v.disableLogoutBtn", true);
                            var toastEvent = $A.get("e.force:showToast");
                            toastEvent.setParams({
                                "title": "Success!",
                                "type": 'success',
                                "message": "Logout Successfully."
                            });
                            toastEvent.fire();
                        }
                        
                    }else{
                        alert('Request Unsucessful');
                    }
                });
                $A.enqueueAction(action);
            });
        } else {
            alert('Your Device does not support GeoLocation');
        }
    },
    createLoginRecord : function(component, item, callback){
        
        this.GeoLoc(component,'Login',callback);
        
    },
    updateLogoutValue : function(component, item, callback){
        this.cmpLoad(component,'Logout',callback);
        var recordId = component.get("v.record.Id");
        
        this.GeoLoc(component,recordId,callback);
        
    }
    
})
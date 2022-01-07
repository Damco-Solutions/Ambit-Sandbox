({
	doInit : function(component, event, helper) {
		var objRecordId = component.get("v.recordId");
            
        
        if (navigator.geolocation) {
            console.log('true');
            navigator.geolocation.getCurrentPosition(function(position) {
                var action = component.get("c.checkIn");
                action.setParams({
                    "latitude": position.coords.latitude,
                    "longitude": position.coords.longitude,
                    "recId":objRecordId
                });
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state === 'SUCCESS'){
                        $A.get('e.force:refreshView').fire();
                        console.log(response.getReturnValue());
                        $A.get("e.force:closeQuickAction").fire();
                        if(response.getReturnValue()=='success'){
                            var toastEvent = $A.get("e.force:showToast");
                            toastEvent.setParams({
                                title : 'Success',
                                message: 'Checked In successfully!',
                                duration:' 5000',
                                key: 'info_alt',
                                type: 'success',
                                mode: 'pester'
                            });
                            toastEvent.fire();
                        }else{
                            var toastEvent = $A.get("e.force:showToast");
                            toastEvent.setParams({
                                title : 'Error',
                                message: response.getReturnValue(),
                                duration:' 5000',
                                key: 'info_alt',
                                type: 'error',
                                mode: 'pester'
                            });
                            toastEvent.fire();
                        }
                    }
                    else if(state === "ERROR") {
                        $A.get("e.force:closeQuickAction").fire();
                        console.log('Error');
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            title: "Error!",
                            message: errors[0].message,
                            duration:' 10000',
                            key: 'info_alt',
                            type: 'error',
                            mode: 'dismissible'
                        });
                        toastEvent.fire();
                    }
                });
                $A.enqueueAction(action);
            },function(error) {
              
                var toastEvent = $A.get("e.force:showToast");
                  toastEvent.setParams({
                      "title": "Error!",
                      "type": 'error',
                      "message": error.message
                  });
                  toastEvent.fire();
                  
              });
             
                window.setTimeout(
                  $A.getCallback(function() {
                      $A.get("e.force:closeQuickAction").fire();
                  }), 5000
              );
            
        }else{
            console.log('false');
            var dismissActionPanel = $A.get("e.force:closeQuickAction");
            dismissActionPanel.fire();
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                title: "Error!",
                message: "Your Device does not support GeoLocation",
                duration:' 10000',
                key: 'info_alt',
                type: 'error',
                mode: 'dismissible'
            });
            toastEvent.fire();
        }
	},
    goInit: function(component, event, helper)
    {
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
},
// this function automatic call by aura:waiting event  
showSpinner: function(component, event, helper) {
    // make Spinner attribute true for display loading spinner 
    component.set("v.Spinner", true); 
},

// this function automatic call by aura:doneWaiting event 
hideSpinner : function(component,event,helper){
    // make Spinner attribute to false for hide loading spinner   
    
    component.set("v.Spinner", false);
}
})
({
	doInit : function(component, event, helper) {
		var objRecordId = component.get("v.recordId");
        if (navigator.geolocation) {
            console.log('true');
            navigator.geolocation.getCurrentPosition(function(position) {
                var action = component.get("c.checkOut");
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
                                message: 'Checked Out successfully!',
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
            });
            
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
	}
})
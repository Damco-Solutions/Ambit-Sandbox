({
    doInit : function(component, event, helper) {
        var action = component.get("c.returnScore");    
        var AppId = component.get("v.recordId");
        console.log(AppId);
        
        action.setParams({
            "AppId":AppId
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log('state==>' +state);
            if (state == "SUCCESS") { 
                $A.get('e.force:refreshView').fire();
                console.log(response.getReturnValue());
                $A.get("e.force:closeQuickAction").fire();
                if(response.getReturnValue()=='Success'){
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Success',
                        message: 'CIBIL Score updated successfully!',
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
        });
        $A.enqueueAction(action);
    }
})
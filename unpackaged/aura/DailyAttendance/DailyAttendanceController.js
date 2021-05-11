({
    doInit : function(component, event, helper) {
        helper.cmpLoad(component);
    },
    login : function(component, event, helper) {
        //helper.createLoginRecord(component);
        //this.callout(component,event,helper);
         var action = component.get("c.markAttendance");
         action.setParams({
                    "latitude": component.get("v.lat"),
                    "longitude": component.get("v.lon"),
                    "requestType":'Login',
                    "Todaywork":component.get("v.HighLevelWorkPlan")
                });
        action.setCallback(this, function(response) {
              var state = response.getState();
               if (state == "SUCCESS") {
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
                    }else{
                        component.set("v.disableLoginBtn", true);
                            component.set("v.disableLogoutBtn", false);
                            var toastEvent = $A.get("e.force:showToast");
                            toastEvent.setParams({
                                "title": "Error!",
                                "type": 'error',
                                "message": "Employee Not Found!"
                            });
                            toastEvent.fire();
                        
                    }
               }
            
        });
         $A.enqueueAction(action);
    },
    logout : function(component,event,helper) {
        helper.updateLogoutValue(component);
    },
    openModel: function(component, event, helper) {
        
        if(event.getSource().get("v.value")=='Login')
        {
            component.set("v.isLogin", true);
        }
        else
        {
            component.set("v.isLogout", true);
        }
        component.set("v.isOpen", true);
    },
    closeModel: function(component, event, helper) {
        component.set("v.isOpen", false);
    },  
})
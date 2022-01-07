({
    doInit : function(component, event, helper) {
        var action = component.get("c.Applicantload");    
        var AppId = component.get("v.recordId");
        var App_check=$A.get("$Label.c.PUSH_TO_LOS_On_Applicant");
        var CoApp_Gra_Check=$A.get("$Label.c.PUSH_TO_LOS_On_CO_Applicant"); 
        console.log(AppId);
        console.log(App_check);
        console.log(CoApp_Gra_Check);
        action.setParams({
            "AppId":AppId
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            debugger;
            
            console.log('state==>' +state);
            if (state == "SUCCESS") { 
                $A.get('e.force:refreshView').fire();
                console.log(response.getReturnValue());
                var rsp=response.getReturnValue();
                if(rsp==App_check){
                    $A.get("e.force:closeQuickAction").fire();
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Information',
                        message: App_check,
                        duration:'10000',
                        key: 'info_alt',
                        type: 'info',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                    
                }
                
                if(rsp==CoApp_Gra_Check){
                    $A.get("e.force:closeQuickAction").fire();
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Information',
                        message: CoApp_Gra_Check,
                        duration:'10000',
                        key: 'info_alt',
                        type: 'info',
                        mode: 'pester'
                    });
                    toastEvent.fire(); 
                }
                if(rsp=='SUCCESS'){
                    $A.get("e.force:closeQuickAction").fire();
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'PUSH TO LOS',
                        message: 'PROSPECTCODE is Successfully Updated ',
                        duration:' 10000',
                        key: 'info_alt',
                        type: 'success',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                }
                if(rsp!='SUCCESS'&& rsp!=CoApp_Gra_Check && rsp!=App_check){
                     $A.get("e.force:closeQuickAction").fire();
                    var toastEvent = $A.get("e.force:showToast");
                    var error=rsp ;
                    toastEvent.setParams({
                        title : 'Error',
                        message: error,
                        duration:' 10000',
                        key: 'info_alt',
                        type: 'error',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                }
                 
                
            }  else if (state === "ERROR") {
        // Process error returned by server
         $A.get('e.force:refreshView').fire();
               let errors = response.getError();
               let message = 'Unknown error'; // Default error message
                 
                  let toastParams = {
                   title: "Error",
                   message: "Unknown error", // Default error message
                  type: "error"
    };
    // Pass the error message if any
    if (errors && Array.isArray(errors) && errors.length > 0) {
        toastParams.message = errors[0].message;
    }
    // Fire error toast
    let toastEvent = $A.get("e.force:showToast");
    $A.get("e.force:closeQuickAction").fire();
    toastEvent.setParams(toastParams);
    toastEvent.fire();
    }
                                       
                           
    });
        $A.enqueueAction(action);
        
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
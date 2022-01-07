({
	 doInit : function(component, event, helper) {
        var action = component.get("c.AuthenticationRequest");    
        var LoanId = component.get("v.recordId");
        var GetLoanDetail=$A.get("$Label.c.Get_Loan_Detail");
        console.log(LoanId);
       
        action.setParams({
            "LoanId":LoanId
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            debugger;
      
            console.log('state==>' +state);
            if (state == "SUCCESS") { 
                $A.get('e.force:refreshView').fire();
                console.log(response.getReturnValue());
                var rsp=response.getReturnValue();
                
               if(rsp=='SUCCESS'){
                     $A.get("e.force:closeQuickAction").fire();
                   var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : ' Get Loan Detail' ,
                        message: 'Get Loan Detail Updated Succesfully',
                        duration:' 8000',
                        key: 'info_alt',
                        type: 'Success',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                }
                if(rsp!='SUCCESS'){
                     $A.get("e.force:closeQuickAction").fire();
                   var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Get Loan Detail' ,
                        message:rsp ,
                        duration:'10000',
                        key: 'info_alt',
                        type: 'error',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                }
                   if(rsp==GetLoanDetail){
                     $A.get("e.force:closeQuickAction").fire();
                   var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : ' Get Loan Detail' ,
                        message: GetLoanDetail,
                        duration:' 8000',
                        key: 'info_alt',
                        type: 'info',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                }
            }
             else if (state === "ERROR") {
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
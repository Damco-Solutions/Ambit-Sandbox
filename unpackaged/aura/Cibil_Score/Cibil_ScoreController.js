({
    doInit : function(component, event, helper) {
        var action = component.get("c.AcknowledgementRequest");    
        var AppId = component.get("v.recordId");
        var cibicheck=$A.get("$Label.c.Cibil_Score_check");
        var reqfield=$A.get("$Label.c.cibil_Validation"); 
        console.log(AppId);
        console.log(cibicheck);
         console.log(reqfield);
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
                if(rsp==reqfield){
                       $A.get("e.force:closeQuickAction").fire();
                         var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Error',
                        message: reqfield,
                        duration:'10000',
                        key: 'info_alt',
                        type: 'error',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                    
                }
                
               if(rsp!=cibicheck){
                var res = rsp.replace("JSON-RESPONSE-OBJECT", "JSONRESPONSEOBJECT");
              const returnedObj = JSON.parse(res);
                var finishobj=returnedObj.FINISHED;
                var test=returnedObj.REJECT;
                var issuestatus;
                console.log(returnedObj.STATUS);
             
              var respstatus= returnedObj.STATUS; 
                
                if(finishobj!=undefined ){
                    issuestatus=returnedObj.FINISHED[0].STATUS;  
                }
                if(finishobj==undefined ){
                    issuestatus=returnedObj.REJECT[0].STATUS; 
                    console.log(returnedObj.REJECT[0].ERRORS);
                    console.log(returnedObj.REJECT[0].ERRORS[1].DESCRIPTION);
                }
                
                console.log('issuestatus->'+issuestatus);
                 console.log('respstatus->'+respstatus);
              // $A.get('e.force:refreshView').fire();
                $A.get("e.force:closeQuickAction").fire();
                if(respstatus=='SUCCESS'){
                     $A.get("e.force:closeQuickAction").fire();
                   var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'SUCCESS',
                        message: status,
                        duration:' 5000',
                        key: 'info_alt',
                        type: 'error',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                }
                if(respstatus=='COMPLETED' && issuestatus=='SUCCESS'){
                       $A.get("e.force:closeQuickAction").fire();
                    var number;
                     var score=returnedObj.FINISHED[0].JSONRESPONSEOBJECT.scoreList[0].score;
                   console.log('score->'+score);
                    if(score=='000-1'){
                        number=0.00;
                    }else{
                         number =parseInt(score);
                    }
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'CIBIL Score Updated Succesfully',
                        message: 'CIBIL Score Updated to ' + number,
                        duration:' 5000',
                        key: 'info_alt',
                        type: 'success',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                    }
                if(respstatus=='COMPLETED' && issuestatus=='BUREAU-ERROR'){
                    var issueserror= returnedObj.FINISHED[0].JSONRESPONSEOBJECT.errorDomainList[0].errorDescription;  
                       $A.get("e.force:closeQuickAction").fire();
                         var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Error',
                        message: issueserror,
                        duration:' 5000',
                        key: 'info_alt',
                        type: 'error',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                    }
                  if(respstatus=='ERROR'){
                    var toastEvent = $A.get("e.force:showToast");
                    var error= returnedObj.ERRORS[0].DESCRIPTION;
                    toastEvent.setParams({
                        title : 'Error',
                        message: error,
                        duration:' 5000',
                        key: 'info_alt',
                        type: 'error',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                }
                if(respstatus=='COMPLETED' && issuestatus=='ERROR'){
                    var toastEvent = $A.get("e.force:showToast");
                    var error= returnedObj.REJECT[0].ERRORS[1].DESCRIPTION;
                    console.log(error);
                    toastEvent.setParams({
                        title : 'Error',
                        message: error,
                        duration:' 5000',
                        key: 'info_alt',
                        type: 'error',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                }
             }
                if(rsp==cibicheck){
                       $A.get("e.force:closeQuickAction").fire();
                         var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Information',
                        message: cibicheck,
                        duration:' 5000',
                        key: 'info_alt',
                        type: 'info',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                    
                }
                
                
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
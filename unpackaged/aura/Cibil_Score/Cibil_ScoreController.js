({
    doInit : function(component, event, helper) {
        var action = component.get("c.AcknowledgementRequest");    
        var AppId = component.get("v.recordId");
        console.log(AppId);
        
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
                var res = rsp.replace("JSON-RESPONSE-OBJECT", "JSONRESPONSEOBJECT");
                //var inprocessrs= rsp.replace("IN-PROCESS", "INPROCESS");
              const returnedObj = JSON.parse(res);
             // const returendinpro=JSON.parse(inprocessrs);
                var finishobj=returnedObj.FINISHED;
                var test=returnedObj.REJECT;
                console.log(JSON.stringify(test));
                //var JSONRESPONSEOBJECT=returnedObj.FINISHED[0].JSONRESPONSEOBJECT;
                var issuestatus;
                console.log(returnedObj.STATUS);
              //  console.log('JSONRESPONSEOBJECT'+JSONRESPONSEOBJECT);
             // var inprogress=returendinpro.INPROCESS[0].STATUS;
              var respstatus= returnedObj.STATUS; // = '0233XXXXX'
                
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
                     var score=returnedObj.FINISHED[0].JSONRESPONSEOBJECT.scoreList[0].score;
                    var number =parseInt(score);  
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
        });
        $A.enqueueAction(action);
    }
})
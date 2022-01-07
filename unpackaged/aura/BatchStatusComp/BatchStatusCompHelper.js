({
    pollApex : function(component, event, helper) { 
        helper.callApexMethod(component,helper);
        
        //execute callApexMethod() again after 5 sec each
        window.setInterval(
            $A.getCallback(function() { 
                helper.callApexMethod(component,helper);
            }), 5000
        );      
    },
    handleResponse : function (response, component){
        var retVal = response.getReturnValue() ;
        component.set("v.contactCount",retVal); 
        const self = this;
        console.log('Inside delay: data '+retVal.Id);
        var sucmessage='PROSPECT CODE is Successfully Created';
        if(retVal.MessageViewed__c==true)
        {
            if(retVal.Status__c=='F')
            {
                 self.displayToast(component, 'error', retVal.Message__c,retVal.Error_details__c);  
            }
            else
            {
                 self.displayToast(component,'success',retVal.Message__c,sucmessage);  
            }
           
            
        }
           
        
        
    },
    callApexMethod : function (component,helper){ 
        var Recordid=component.get("v.recordId");
        
        var action = component.get("c.getAPIError"); 
        action.setParams({
            "recordId":Recordid
        });
        action.setCallback(this, function(response) {
            this.handleResponse(response, component);
        });
        $A.enqueueAction(action); 
    },
    displayToast: function(cmp, type,title, message, messageTemplate, templateData) {
        var toastEvent = $A.get('e.force:showToast');
        toastEvent.setParams({
             title : title,
            type: type,
            message: message,
            messageTemplate: messageTemplate,
            messageTemplateData: templateData
        });
        toastEvent.fire();
    }
})
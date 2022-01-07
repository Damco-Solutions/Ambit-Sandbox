({
    getValueFromApplicationEvent : function(cmp, event) {
        
        var ShowResultValue = event.getParam("Pass_Result");
        alert(ShowResultValue);
        // set the handler attributes based on event data
        cmp.set("v.Get_Result", ShowResultValue);
    },
       Add : function(component, event, helper) {
           
        
       alert(cmp.get("v.Get_Result"));
        
    }
})
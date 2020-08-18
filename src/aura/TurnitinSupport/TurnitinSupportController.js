({
    doInit : function(component, event, helper) {
        var action = component.get("c.fetchmessage");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                var retrunRes = response.getReturnValue();
                component.set("v.data" ,retrunRes );
            }
        });
        $A.enqueueAction(action); 
        
    },
    navigate : function (component, event, helper) {
        
        helper.gotoURL(component,"/casepage");   
    },
    navigatetodashboard : function (component, event, helper) {
        
        helper.gotoURL(component,"/dashboard");  
    },
    navigatetoknowledge: function (component, event, helper) {
        
        helper.gotoURL(component,"/knowledgearticle");  
    } 
    ,
    navigatetocase: function (component, event, helper) {
        
        helper.gotoURL(component,"/raisecase");  
    } 
    
})
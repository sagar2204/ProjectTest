({
    doInit : function(component, event, helper) {
        var action = component.get("c.fetchknowledge");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                console.log('state==',state);
                var retrunRes = response.getReturnValue();  
                component.set("v.data" ,retrunRes ); 
                console.log('return val==',retrunRes);
            }
        }); 
        $A.enqueueAction(action);  
        
    },navigatetohome : function (component, event, helper) {
        
        helper.gotoURL(component,"/Home");   
    },
    navigatetocases : function (component, event, helper) {
        
        helper.gotoURL(component,"/casepage");   
    },
    navigatetodashboard : function (component, event, helper) {
        
        helper.gotoURL(component,"/dashboard");   
    } ,
    redirectFunction : function(component, event, helper)
    {    alert("onclick working");
     var caseIdData = event.currentTarget.getAttribute("data-target");
     console.log(caseIdData)
    }
})
({
    doInit: function(component, event, helper) {        
     
        var action = component.get("c.getype");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                var industryMap = [];
                for(var key in result){
                    industryMap.push({key: key, value: result[key]});
                }
                component.set("v.industryMap", industryMap);
            }
        });
        $A.enqueueAction(action);
    }, 
    //get Industry Picklist Value
    getypePicklist: function(component, event) {
        var action = component.get("c.getype");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                var industryMap = [];
                for(var key in result){
                    industryMap.push({key: key, value: result[key]});
                }
                component.set("v.industryMap", industryMap);
            }
        });
        $A.enqueueAction(action);
    },
    
})
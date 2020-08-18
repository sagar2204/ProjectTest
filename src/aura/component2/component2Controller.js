({
    navigate : function(component, event, helper) {
        var navigateEvent = $A.get("e.force:navigateToComponent");
        navigateEvent.setParams({
            componentDef: "c:comp1"
            //You can pass attribute value from Component2 to Component1
            //componentAttributes :{ }
        });
        navigateEvent.fire();
    }
})
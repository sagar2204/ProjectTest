({
    getData:function(component,event,helper) {
        var action = component.get("c.getDetails");
        action.setCallback(this,function(response){  
            var state = response.getState(); 
            var result = response.getReturnValue();
            if (state === "SUCCESS") {
                
                component.set("v.WrapperList",result);
             
            }
        });
        $A.enqueueAction(action);
    },
    CreateCase : function(component,event,helper){
        var wrapper = component.get("v.WrapperList"); 
        console.log('wrapper===',wrapper);
        var action = component.get("c.InsertCase"); 
        action.setParams({
            wrapper:wrapper 
        });
        action.setCallback(this, function(response) {
            var state = response.getState();  
            var result = response.getReturnValue();
            if (state === "SUCCESS") {
                console.log('createcase',result);
                component.set("v.CaseId",result);
                var id=component.get("v.CaseId");
                console.log("id",id);
                helper.showSuccess(component, event, helper);
               /* $A.get('e.force:refreshView').fire(); */
                            }
        });
        $A.enqueueAction(action);
    },
    showSuccess : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Success',
            message: 'Case Created Sucessfully',
            key: 'info_alt',
            type: 'success',
        });
        toastEvent.fire();
    },
    gotoURL : function (component,url) {
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url   
        });
        urlEvent.fire(); 
    }
})
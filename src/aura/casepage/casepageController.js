({ 
    doInit: function(component, event, helper) {        
        var action = component.get('c.fetchCase');
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log('status',state); 
            if (state == "SUCCESS") {
                component.set("v.totalPages", Math.ceil(response.getReturnValue().length/component.get("v.pageSize")));
                var ff = response.getReturnValue();
                component.set("v.Allcase",ff);
                console.log('FFFFFFFFF--->',ff);
                component.set("v.currentPageNumber",1);
                helper.buildData(component, helper); 
            }
        })
        $A.enqueueAction(action); 
    },
    statuschange : function(component, event, helper) {  
        var action=component.get("c.fetchdata");
        var val= component.find('select').get('v.value');
        console.log('val',val); 
        action.setParams({"values": val});
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('state',state);
            if (state === "SUCCESS") {
                console.log(state);
                // component.set("v.Allcase",response.getReturnValue()); 
                //   console.log(response.getReturnValue());
                component.set("v.totalPages", Math.ceil(response.getReturnValue().length/component.get("v.pageSize")));
                var ff = response.getReturnValue();
                component.set("v.Allcase",ff);
                console.log('FFFFFFFFF--->'+ff);
                component.set("v.currentPageNumber",1);
                helper.buildData(component, helper);
            }
        }); 
        $A.enqueueAction(action);
    },
    navigate : function (component, event, helper) {
        
        helper.gotoURL(component,"/Home");   
    },
    navigatetodashboard: function (component, event, helper) {
        
        helper.gotoURL(component,"/dashboard");   
    },
     navigatetoknowledge: function (component, event, helper) {
        
        helper.gotoURL(component,"/knowledgearticle");   
    },
    
    onNext :function(component, event, helper) {
        component.set("v.currentPageNumber", component.get("v.currentPageNumber") + 1);
        helper.buildData(component,event,helper);
    },
    
    onPrev : function(component, event, helper) {        
        component.set("v.currentPageNumber", component.get("v.currentPageNumber") - 1);
        helper.buildData(component,event,helper);
    },
    
    processMe : function(component, event, helper) {
        component.set("v.currentPageNumber", parseInt(event.target.name));
        helper.buildData(component, helper);
    },
    onFirst : function(component, event, helper) {        
        component.set("v.currentPageNumber", 1);
        helper.buildData(component, helper);
    },
    
    onLast : function(component, event, helper) {        
        component.set("v.currentPageNumber", component.get("v.totalPages")); 
        helper.buildData(component, helper);
    },
    
    casedetail  : function(component, event, helper){
        var id = event.target.getAttribute("data-recId") || event.target.parentNode.getAttribute("data-recId");
        helper.gotoURL(component,"/casedetailpage?id="+id); 
        alert('detail  : id = ' + id); //it gives me null
        
        
        // var ctarget = event.currentTarget;   
        // var direction = ctarget.dataset.target; 
        // alert('id====',direction);
    }  
    
    
})
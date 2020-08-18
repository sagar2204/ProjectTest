({
    search : function(component, event, helper) {
        
        var name=component.get("v.Name");
        console.log("name",name);
        var email=component.get("v.Email");
        console.log("email",email);
        var action = component.get('c.returncontact');
        action.setParams({"name":name,"email":email
                         }); 
        
        //helper.showSpinner(component, event, helper);
        
        action.setCallback(this, function(response) {
            //store state of response
            
            var state = response.getState();
            
            if (state === "SUCCESS") {
                //set response value in ListOfContact attribute on component.
                component.set('v.Allcontact', response.getReturnValue());
            }
            
        });
        $A.enqueueAction(action);
    },
    /* doInit : function(component, event, helper)
    { debugger;
        helper.showSpinner(component, event, helper);
        
        helper.hideSpinner(component, event, helper);
        helper.openModel(component, event, helper);
        helper.closeModel(component, event, helper);
        helper.submitDetails(component, event, helper);
    }*/
    
    showSpinner: function(component, event, helper) {
        // make Spinner attribute true for display loading spinner 
        component.set("v.Spinner", true); 
        
    },
    
    // this function automatic call by aura:doneWaiting event 
    
    
    hideSpinner : function (component, event, helper) {
        component.set("v.Spinner", false);
        
    },
    openModel: function(component, event, helper) {
        // Set isModalOpen attribute to true
        component.set("v.isModalOpen", true);
        var id = event.target.getAttribute('data-id');
       console.log("--id--",id);
       component.set("v.id",id);
       var ii = component.get('v.id');
       console.log(ii);
    },
    
    closeModel: function(component, event, helper) {
        // Set isModalOpen attribute to false  
        component.set("v.isModalOpen", false);
    },
    
    submitDetails: function(component, event, helper) {
        // Set isModalOpen attribute to false
        //Add your code to call apex method or do some processing
        component.set("v.isModalOpen", false);
    },
    
    
    Edit : function(component, event, helper) {
        component.set('v.editData',true);
    },
    onCheck: function(component, event, helper) {
        component.set('v.saveData',true);    
    },
    
    Save : function(component, event, helper) {
        var s = component.get('v.Allcontact');
        var data = component.get('c.EditListed');
        data.setParams({ updateData : s });
        component.set('v.editData',false);
        $A.enqueueAction(data);
    },
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
    
    handleCompanyOnChange : function(component, event, helper) {
        var indutry = component.get("v.Contacttype__c");
        alert(indutry);
    }, 
    
    saveSelected : function(component, event, helper) {
        
        var s = component.get('v.Allcontact');
        var data = component.get('c.EditList');
        data.setParams({ updatedData : s });
        component.set('v.editData',false);
        component.set('v.saveData',false);
        $A.enqueueAction(data);
    },
    Cancel : function(component, event, helper) {
        var c = component.get('v.Allcontact');
        
        component.set('v.editData',false);
        
    },
    
})
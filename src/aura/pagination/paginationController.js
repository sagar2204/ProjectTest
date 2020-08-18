({
    /*
     * This function defined column header
     * and calls getAccounts helper method for column data
     * editable:'true' will make the column editable
      */
	doInit : function(component, event, helper) {        
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text',editable:'true',sortable:'true'},
            {label: 'Phone', fieldName: 'Phone', type: 'Phone', sortable:true,editable:'true',sortable:'true'},
            {label: 'Active', fieldName: 'Active__c', type: 'text',sortable:'true'},
           
        ]);
        
        helper.getAccounts(component, helper);
    },
    
    onNext : function(component, event, helper) {        
        var pageNumber = component.get("v.currentPageNumber");
        component.set("v.currentPageNumber", pageNumber+1);
        helper.buildData(component, helper);
    },
    
    onPrev : function(component, event, helper) {        
        var pageNumber = component.get("v.currentPageNumber");
        component.set("v.currentPageNumber", pageNumber-1);
        helper.buildData(component, helper);
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
            
            
            
            handleSort: function(component, event,helper) {
            var sortedBy = event.getParam("fieldName");
            var sortDirection = event.getParam("sortDirection");    
       
        component.set("v.sortDirection", sortDirection);
        component.set("v.sortedBy", sortedBy);
        helper.sortData(component, sortedBy, sortDirection);
    },
            
            
        handleSaveEdition: function (cmp, event, helper) {
        var draftValues = event.getParam('draftValues');
        console.log(draftValues);
            
        var action = cmp.get("c.updateAccount");
            console.log(action);
        action.setParams({"acc" : draftValues});
        action.setCallback(this, function(response) {
        var state = response.getState();
        alert('updated');
            
        });
        $A.enqueueAction(action);
        
    },
            
       handleRowAction : function(component, event, helper){
        var selRows = event.getParam('selectedRows');
        component.set("v.delIds",selRows);

    },

     

    doDelete : function(component, event, helper){
        var delIdList = component.get("v.delIds");
        var action = component.get('c.deleteForm');
        action.setParams({lstId : delIdList});
            
             action.setCallback(this, function(response) {

            var state = response.getState();
            if (state === "SUCCESS") {

                 var storeResponse = response.getReturnValue();
                 component.set("v.data", storeResponse);
            alert('Deleted');
            }

            else if (state === "ERROR") {

                var errors = response.getError();

                if (errors) {

                    if (errors[0] && errors[0].message) {

                        console.log("Error message: " +

                                    errors[0].message);

                    }

                }

                else {

                    console.log("Unknown Error");

                }

            }
 
        });

            
        $A.enqueueAction(action);

    }

})
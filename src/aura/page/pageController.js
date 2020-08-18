({
    doInit: function(component, event, helper) {
        var pageNumber = component.get("v.PageNumber");  
        var pageSize = component.find("pageSize").get("v.value"); 
        helper.getContactList(component, pageNumber, pageSize);
    },
     
    handleNext: function(component, event, helper) {
        var pageNumber = component.get("v.PageNumber");  
        var pageSize = component.find("pageSize").get("v.value");
        pageNumber++;
       helper.getContactList(component, pageNumber, pageSize);
    },
     
    handlePrev: function(component, event, helper) {
        var pageNumber = component.get("v.PageNumber");  
        var pageSize = component.find("pageSize").get("v.value");
        pageNumber--;
        helper.getContactList(component, pageNumber, pageSize);
    },
     
    onSelectChange: function(component, event, helper) {
        var page = 1
        var pageSize = component.find("pageSize").get("v.value");
      helper.getContactList(component, pageNumber, pageSize);
    },
     
   
    searchKeyChange: function(component, event) {
        var searchKey = component.find("searchKey").get("v.value");
        console.log('searchKey:::::'+searchKey);
        var action = component.get("c.findByName"); 
        action.setParams({
            "searchKey": searchKey
        }); 
        action.setCallback(this, function(a) {
            //component.set("v.ContactList", a.getReturnValue());
             var pageNumber = component.get("v.PageNumber");  
        var pageSize = component.find("pageSize").get("v.value");
            helper.getContactList(component, pageNumber, pageSize);
            
        });
        $A.enqueueAction(action);
    },   

})
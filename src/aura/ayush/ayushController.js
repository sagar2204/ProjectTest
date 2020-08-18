({
    Search : function(component, event, helper) {
        
        var fname = component.get("v.FirstName");
        var lname = component.get("v.LastName");
        var mail = component.get("v.Email");
        var hitdata = component.get("c.getContact");
        
        hitdata.setParams({  
            "fname" : fname,
            "lname" :lname,
            "mail" : mail
        });
        
        hitdata.setCallback(this, function(response) {   
            component.set("v.resultList", response.getReturnValue());
        });
        
        $A.enqueueAction(hitdata);
    },
    Delete : function(component, event, helper) {
        
      
        var action=component.get('c.dList');
        action.setParams({
            "contactId" :id
        });
		
        $A.enqueueAction(action);
    },
    Edit : function(component, event, helper) {
           component.set('v.editData',true);
    },
       Save : function(component, event, helper) {
		  var s = component.get('v.resultList');
          var data = component.get('c.EditListed');
          data.setParams({ updateData : s });
          component.set('v.editData',false);
           $A.enqueueAction(data);
    },
     Cancel : function(component, event, helper) {
	     var c = component.get('v.resultList');
         
          component.set('v.editData',false);
          
     },
    All : function(component, event, helper) {
        
        var fname = component.get("v.FirstName");
        var lname = component.get("v.LastName");
        var mail = component.get("v.Email");
        var hitdata = component.get("c.allContact");
        
        hitdata.setParams({  
            "fname" : fname,
            "lname" :lname,
            "mail" : mail
        });
        
        hitdata.setCallback(this, function(response) {   
            component.set("v.resultList", response.getReturnValue());
        });
        
        $A.enqueueAction(hitdata);
    },
    onCheck: function(component, event, helper) {
     component.set('v.saveData',true);    
     
 },
    saveSelected : function(component, event, helper) {
         
           var s = component.get('v.resultList');
            var data = component.get('c.EditList');
          data.setParams({ updatedData : s });
          component.set('v.editData',false);
          component.set('v.saveData',false);
          $A.enqueueAction(data);
    },
     navigate: function(component, event, helper) { 
      // this function call on click on the previous page button  
      var page = component.get("v.page") || 1;
      // get the previous button label  
      var direction = event.getSource().get("v.label");
      // get the select option (drop-down) values.  
      var recordToDisply = component.find("recordSize").get("v.value");
      // set the current page,(using ternary operator.)  
      page = direction === "Previous Page" ? (page - 1) : (page + 1);
      // call the helper function
      helper.getAccounts(component, page, recordToDisply);
     },
    onSelectChange: function(component, event, helper) {
      // this function call on the select opetion change,	 
      var page = 1
      var recordToDisply = component.find("recordSize").get("v.value");
      helper.getAccounts(component, page, recordToDisply);
    }
})
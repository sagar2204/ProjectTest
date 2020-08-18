({
    doInit: function(component, event, helper) {
        console.log('***In controller');
        var action2 = component.get('c.getAllAccount');
        
        
        action2.setCallback(this, function(response) {
            var state = response.getState();
            if (state == "SUCCESS") {
                var attachments = response.getReturnValue();
                component.set("v.accountoppWrapper", attachments);
                console.log('mohit',component.get('v.accountoppWrapper'));
                
            }
        }); 
        
        
        var a= component.get("v.selectedCheckBoxes");
        console.log('***In helper',a);
        //call apex class method
        var action = component.get('c.getAccountDetails');
        action.setParams({
            "parameter":component.get("v.selectedCheckBoxes")
            
        });
        
        action.setCallback(this, function(response) {
            //store state of response
            var state = response.getState();
            if (state === "SUCCESS") {
                //set response value in wrapperList attribute on component.
                var result =  response.getReturnValue();
                component.set("v.mohit",result);
                console.log('resultss',result);
            }
        });
        $A.enqueueAction(action2);
        $A.enqueueAction(action);
    },
    checkboxChange: function(component, event, helper) {
        
        var capturedCheckboxName = event.target.getAttribute('id');
        console.log('@@@@@@@@'+capturedCheckboxName);
        
        var selectedCheckBoxes =  component.get("v.selectedCheckBoxes");
        console.log ('!!!!!!'+selectedCheckBoxes);
        
        if(selectedCheckBoxes.indexOf(capturedCheckboxName) > -1){
            selectedCheckBoxes.splice(selectedCheckBoxes.indexOf(capturedCheckboxName), 1);
        }
        else{
            selectedCheckBoxes.push(capturedCheckboxName);
        }
        component.set("v.selectedCheckBoxes", selectedCheckBoxes);        
        console.log('resultttt',component.get("v.selectedCheckBoxes"));
        
	        
          var cmpEvent = component.getEvent("accountrecord");
        // get the values from component and set in event
          
             
        cmpEvent.setParams({"AccountRecored" : component.get("v.selectedCheckBoxes") });
        cmpEvent.fire();
        
               
      
    }
})
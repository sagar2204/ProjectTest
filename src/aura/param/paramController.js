({
    objname: function(component, event, helper) {
        var action = component.get("c.getPiklistValues");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS"){
                console.log(response.getReturnValue());
                var responsevalue = response.getReturnValue();
                component.set('v.objectname', responsevalue );
            }
        });
        $A.enqueueAction(action);
    },
    onChange : function(component, event, helper) {
        console.log('hello');
        alert(component.find('select').get('v.value'));       
        var objselected = component.find('select').get('v.value');
        var action=component.get('c.fieldname');
        
        action.setParams({
            "fieldnames":objselected
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            alert(state);
            if(state=="SUCCESS"){
                component.set("v.duellist",true);
            var responsevalue = response.getReturnValue();
            var plValues = [];
                for (var i = 0; i < responsevalue.length; i++) {
                    plValues.push({
                        label: responsevalue[i],
                        value: responsevalue[i]
                    });
                }
                component.set("v.GenreList", plValues);
               }
            else{
                 alert("Selected object is null please select other option");
              }
            console.log(responsevalue);
        });
        $A.enqueueAction(action);
    },
     handleGenreChange: function (component, event, helper) {
        //Get the Selected values   
        var selectedValues = event.getParam("value");
        //Update the Selected Values  
        component.set("v.selectedGenreList", selectedValues);
         component.set('v.columns',selectedValues);
            var result = selectedValues;
                var plValues = [];
                for (var i = 0; i < result.length; i++) {
                    plValues.push({
                        label: result[i],
                        fieldName: result[i],
                        type:'text'
                    });
                }
                component.set("v.columnsname", plValues);
    },
     
    submit : function(component, event, helper){
        //Get selected Genre List on button click 
        var action = component.get('c.datashow');
        var selectedValues = component.get("v.selectedGenreList");        
        console.log('Selectd Genre-' + selectedValues);
        component.set('v.columns',selectedValues);
        var object = component.find('select').get('v.value');
        console.log(object);
        action.setParams({
            "objectname":object,
            "fieldnametosearch":selectedValues
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            alert(state);
            var responsevalue = response.getReturnValue();
            console.log(responsevalue);
             component.set('v.data',responsevalue);
        });
        $A.enqueueAction(action);
    }
})
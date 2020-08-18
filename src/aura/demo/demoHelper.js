({
 getCases: function(component) {
    var action = component.get("c.getCases");
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            component.set("v.cases", response.getReturnValue());
        }
    });
    $A.enqueueAction(action);  },


  createCase: function(component, event) {
    this.upsertCase(component, event, function(a) {
        var cases = component.get("v.cases");
        cases.push(a.getReturnValue());
        component.set("v.cases", cases);
      });
},

upsertCase : function(component, event, callback) {
    var action = component.get("c.saveCase");
    action.setParams({ 
        "case": event
    });
    if (callback) {
      action.setCallback(this, callback);
    }
    $A.enqueueAction(action);

},})
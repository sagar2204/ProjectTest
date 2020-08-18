({   
    doInit: function(component, event, helper) {        
        /* 
   var action = component.get('c.fetchCases');
   action.setParams({"caseId":id
                     }); 
    action.setCallback(this, function(response) {
        //store state of response
        var state = response.getState();
        if (state === "SUCCESS") {
            console.log(state);
            component.set('v.data', response.getReturnValue());
        }
    });
    $A.enqueueAction(action);
 */
    try{
        
        helper.checkUrlTemp(component, event, helper);
        
    } catch(err) {
        console.log(err.message);
    }
},
  navigate : function (component, event, helper) {
      
      helper.gotoURL(component,"/Home");   
  },
  navigatetocases : function (component, event, helper) {
      
      helper.gotoURL(component,"/casepage");    
  },
  handleComponentEvent : function(cmp, event) {
      var result = event.getParam("cid");
      console.log("result==",result);
  }
  ,  checkUrlTemp : function (component){
      var cid=this.getURLParameter('id');
     return Cid; ; 
  },
  getURLParameter : function(param) { 
      var result=decodeURIComponent((new RegExp('[?|&]' + param + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null
      return result;
  },
 })
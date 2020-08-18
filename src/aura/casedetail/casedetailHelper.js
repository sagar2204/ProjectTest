({  
    gotoURL : function (component,url) {
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url   
        });
        urlEvent.fire();  
        // this.getURLParameter('id');
        
    },
    checkUrlTemp : function (component){
        
        var action = component.get('c.fetchCases');
        action.setParams({"caseId":this.getURLParameter('id')
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
        console.log('id=====', this.getURLParameter('id')); 
    },
    getURLParameter : function(param) { 
        var result=decodeURIComponent((new RegExp('[?|&]' + param + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null
        return result;
    },
})
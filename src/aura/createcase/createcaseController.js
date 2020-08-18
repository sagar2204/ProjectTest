({
    doInit:function(component,event,helper){
        helper.getData(component,event,helper) 
    },
    SubmitCase:function(component, event, helper) {
        
        
        helper.CreateCase(component, event, helper);
        
    },
    CancelBtn:function(component,event,helper){
        window.history.back();
    }
    ,	navigatetohome: function (component, event, helper) {
        
        helper.gotoURL(component,"/Home");   
    },	navigatetocases : function (component, event, helper) {
        
        helper.gotoURL(component,"/casepage");   
    },
    
})
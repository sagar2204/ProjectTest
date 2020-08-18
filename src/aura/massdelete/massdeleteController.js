({
    accountList : function(component, event, helper) {
        helper.getAccountList(component);
    },
    selectAll: function(component,event, helper){
        var slctCheck = event.getSource().get("v.value");
        var getCheckAllId = component.find("cboxRow");
        
        if (slctCheck == true) {
            for (var i = 0; i < getCheckAllId.length; i++) {
                component.find("cboxRow")[i].set("v.value", true);             
            }
        } else {
            for (var i = 0; i < getCheckAllId.length; i++) {
                component.find("cboxRow")[i].set("v.value", false);
            }
        }
    },
    changeSelectAll:function(component,event, helper){
        var slctCheckRow = event.getSource().get("v.value");
        var getCheckAllId = component.find("cbox");
        if(slctCheckRow == false) {
            component.find("cbox").set("v.value", false);
        }
    },
    deleteSlctd : function(component,event,helper) {
        var getCheckAllId = component.find("cboxRow");
        var selctedRec = [];
        for (var i = 0; i < getCheckAllId.length; i++) {
            
            if(getCheckAllId[i].get("v.value") == true )
            {
                selctedRec.push(getCheckAllId[i].get("v.text")); 
            }
        }
        helper.deleteSelected(component,event,selctedRec);
    }
})
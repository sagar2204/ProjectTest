({
    doInit : function(component, event, helper) {
        var action = component.get("c.getdata");
        var isAutoTimer = component.get("v.isAutoTimer");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                var retrunRes = response.getReturnValue();
                component.set("v.newlist" ,retrunRes );
            }
        });
        $A.enqueueAction(action);
        
        if(isAutoTimer){
            var delay = component.get("v.delay");
            window.setInterval(function(){
                helper.Next(component,event);
            },delay*1000);
        }
        
    },
    Next:function(component,event,helper)
    {
        var cslide =component.get("v.active");
        var slist=component.get("v.newlist");
        var datalist=document.getElementsByClassName("main");
        console.log(datalist);
        if(datalist!=null && datalist.length>0)
            
        {   if(cslide==slist.length-1)
        {
            component.set("v.active",0);
        }
         else
         {
             component.set("v.active",cslide+1);
             
         }
         for(var i=0;i<datalist.length;i++)
         {
             $A.util.addClass(datalist[i], "slds-hide");
         }
         var a=component.get("v.active");
         $A.util.removeClass(datalist[a], "slds-hide");
        }
        
    },
    previous:function(component,event,helper)
    {
        var cslide =component.get("v.active");
        var slist=component.get("v.newlist");
        var datalist=document.getElementsByClassName("main");
        console.log(datalist);
        if(datalist!=null && datalist.length>0)
            
        {   if(cslide<=0)
        {
            component.set("v.active",datalist.length-1);
        }
         else
         {
             component.set("v.active",cslide-1);
             
         }
         for(var i=0;i<datalist.length;i++)
         {
             $A.util.addClass(datalist[i], "slds-hide");
         }
         var a=component.get("v.active"); 
         $A.util.removeClass(datalist[a], "slds-hide");
        }
    },
    
})
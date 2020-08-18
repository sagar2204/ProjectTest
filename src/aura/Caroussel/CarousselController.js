({
    doInit : function(component, event, helper) {
        var data=[{'color':'yellow','name':'Slide1'},{'color':'red','name':'Slide2'},{'color':'pink','name':'Slide3'},{'color':'green','name':'Slide4'},{'color':'skyblue','name':'Slide5'}];
        component.set("v.newlist",data);     
    }
    ,
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
    }
})
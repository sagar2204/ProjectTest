({
    doInit:function(component,event,helper)
    {
        let vfOrigin="https://trialplayground-dev-ed--c.ap6.visual.force.com";
        window.addEventListener("Message",function(event)
        {
          console.log(event.data);
        if(event.origin!==vfOrigin)
        { return;
        }
        if(event.data!=="Unlock")
        { let myButton=cmp.find("mybutton");
          mybutton.set('v.disabled',false)
        }
    },false); 
},
 dosubmit:function(cmp,evt,helper) 
{  alert("do submit");
}

})
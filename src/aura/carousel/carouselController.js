({
    doInit: function(component, event, helper) {
        var speed=component.get("v.interval");
        var document=component.get("c.getImages");
        document.setParams({ folderName :component.get("v.Folder") });
        document.setCallback(this, function(response){
            if(component.isValid() && response.getState() === "SUCCESS"){
                component.set("v.imagesUrl", response.getReturnValue());
            }         
        });
        
        if(speed<500){
            alert("Min Interval 500 Millisecond");
        }else{
            $('.carousel').carousel({
                interval: speed
            });
            $('.carousel').carousel({
                interval: true
            });
        }
        $A.enqueueAction(document);
    },
    Previous : function(component, event, helper) {
        $('#carousel-example-generic').carousel('prev'); 
    },
    Next : function(component, event, helper) {
        $('#carousel-example-generic').carousel('next'); 
        $('#carousel-example-generic').carousel(200);
        
    },
    
})
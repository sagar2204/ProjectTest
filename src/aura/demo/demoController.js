({
    
    init : function(component, event, helper) {
        helper.getCases(component);
    },
    
    createCase : function(component, event, helper) {
        
        var subjectField = component.find("subject");
        var subject =  subjectField.get("v.value");
        
        var originField = component.find("origin");
        var origin =  originField.get("v.value");
        
        var statusField = component.find("status");
        var status =  statusField.get("v.value");
        
        var contactField = component.find("contact");
        var contact =  contactField.get("v.value");
        
        var newCase = component.get('v.newCase');
        newCase.subject = subject;
        newCase.origin = origin;
        newCase.status = status;
        newCase.contact = contact;
        
        console.log(newCase);
        helper.createCase(component, newCase);
        
        
        console.log('End of createCase');
        
    }})
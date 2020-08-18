trigger casetrigger on Case (before insert, before update, After insert, After Update) {
    //followinf blueporint of trigger should be created for each event
    //Now the requirement is to add account team to case on case record create and update. right? yes. Then we go to after insert and update. Why after?  cz case is under
    //Account obj it has lookup on account and it is a cross obj
    //No. Because the case team is created aftercase record is craeted. if there is not case, case team ki kya zarurat? thats why  said it is cross obj. What is a cross obj?
    
    if(trigger.isBefore){
        if(trigger.isInsert){}
        if(trigger.isUpdate){}
    }
    if(trigger.isAfter){
        if(trigger.isInsert){
            BussinesscaseHandler.caseTeamUpdateOnInsert(Trigger.new);  
        }
        if(trigger.isUpdate){
            BussinesscaseHandler.caseTeamUpdateOnUpdate(Trigger.new,Trigger.oldmap); 
        }
    }

   
}
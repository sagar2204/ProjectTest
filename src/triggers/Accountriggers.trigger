trigger Accountriggers on Account (Before Insert , Before Update , Before Delete ,After Insert ,After Update, After Delete )
    {


    if(trigger.isBefore)
    {
    if(trigger.isInsert)
    {
   // AccountTriggerHandler.beforeInsert(trigger.new);
    }
     if(trigger.isUpdate)
    {
   // AccountTriggerHandler.beforeUpdate(trigger.new,trigger.old);
    }
    }
    if(trigger.isDelete)
    {
    
    }
    if(trigger.isAfter)
    {
    if(trigger.isInsert)
    {    system.debug('Insert operation');
         AccountTriggerHandler.AfterInsert(trigger.new);
        
    }
    if(trigger.isUpdate){
         AccountTriggerHandler.AfterUpdate(trigger.old,trigger.new);
    }
    if(trigger.isDelete){
    }
    }
     }
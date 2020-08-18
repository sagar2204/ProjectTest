trigger closecase on Case (before insert, before update, After insert, After Update) 
{
     
    if(trigger.isBefore){
        if(trigger.isInsert){}
        if(trigger.isUpdate){}
    }
    if(trigger.isAfter){
        if(trigger.isInsert){
             
        }
        if(trigger.isUpdate){
           CaseStatusUpdate.Closecase(Trigger.New);
        }
    }

}
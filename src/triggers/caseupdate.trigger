trigger caseupdate on Case (before update) { 
    
  if(trigger.isBefore){
        if(trigger.isInsert){}
        if(trigger.isUpdate){
            CaseUpdateHandler.CaseUpdation(Trigger.New);
        }
    }
    if(trigger.isAfter){
        if(trigger.isInsert){
            
        }
        if(trigger.isUpdate){
            
        }
    }
    }
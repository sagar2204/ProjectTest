trigger leadConvert on Lead (After insert,After update,before insert,before update) {
    
       if(trigger.IsInsert)
       {
         //  LeadHandler.leader(Trigger.new,Null);
       }
         if(trigger.IsUpdate)
         {
             
         }
        if(trigger.ISDelete)
        {
              // AggreementHandler.Agg1(null,Trigger.old);
       }
        
   
}
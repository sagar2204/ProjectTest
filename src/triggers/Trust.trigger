trigger Trust on Aggreement__c (After insert,After update,before delete)
{
   if(trigger.IsAfter)
   {
       
       if(trigger.IsInsert)
       {
           AggreementHandler.Agg(Trigger.new,null);
       }
         if(trigger.IsUpdate)
         {
             
         }
        if(trigger.ISDelete)
        {
              // AggreementHandler.Agg1(null,Trigger.old);
       }
        }
    If(trigger.isbefore)
    {
      if(trigger.ISDelete)
        {
               AggreementHandler.Agg1(null,Trigger.old);
       }
        }
}
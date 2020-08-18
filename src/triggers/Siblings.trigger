trigger Siblings on Contact (before insert,before update)
    {
          Set<Id> AcctIds = new Set<Id>(); 
          List<contact> updatedcontacts=new  List<contact>();
     
     if(trigger.isInsert)
     {
        
           for(Contact Con:trigger.new) 
                 {
                     AcctIds.add(con.AccountId);
                     system.debug(AcctIds);  
                 }
         }
         
         //update
         if(trigger.isUPdate)
         {
             for(Contact Con : trigger.old) 
             {
                 AcctIds.add(con.AccountId);
              //   system.debug(AcctIds);
                 
             }
             for(Contact Con : trigger.New)
             {
                 AcctIds.add(con.AccountId);
                 // system.debug(AcctIds);
             } 
         }   
             List<contact> val=[select ID from contact where accountid In: AcctIds]; 
           //   system.debug(val); 
          integer i=val.size();
        system.debug(i);
        for(contact cc:val)
        {
            cc.Nofsiblings__c=i-1;
            system.debug('NO of sibling'+cc.Nofsiblings__c);
            updatedcontacts.add(cc);
            
        }
        update updatedcontacts;
       
    }
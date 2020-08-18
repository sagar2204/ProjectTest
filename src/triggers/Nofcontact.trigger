trigger Nofcontact on Contact (after insert,after update, after delete) 
{     Set<Id> AcctIds = new Set<Id>(); 
      List<Account> Updatedaccount=new  List<Account>();
 
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
         if(trigger.isDelete)
         {
             for(Contact Con : trigger.old) 
             {
                 AcctIds.add(con.AccountId);
                 system.debug(AcctIds);
                 
             }
         }
                 
         List<Account> val=[select ID,No_of_contacts__c,(select id from contacts) from Account where ID In:AcctIds];
          system.debug(val);
         for(Account aa:val)
         {
             aa.No_of_contacts__c=aa.contacts.size();
             Updatedaccount.add(aa);
             system.debug(Updatedaccount);
         }
         
         update Updatedaccount;
 
     
 }
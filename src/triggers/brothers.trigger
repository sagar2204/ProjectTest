trigger brothers on Contact (After insert,After update,After Delete)
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
   if(trigger.isUpdate)
    {    Set<id> newAcc = new Set<Id>();
         Set<id> oldAcc = new Set<Id>();
       
        for(Contact c : trigger.new)
        {
            if(c.AccountId <> trigger.oldMap.get(c.id).accountId)
            {
                System.debug('account updated!');
                newAcc.add(c.AccountId);
                oldAcc.add(trigger.oldMap.get(c.id).accountId);
            }
        }
    }  
          if(trigger.isDelete)
    {
        for(Contact Con:trigger.old) 
        {
            AcctIds.add(con.AccountId);
            system.debug(AcctIds);  
        }
    }
    
    List<Account> Updatedaccount = [select  id,(select id,Nofsiblings__c from contacts) from Account where Id in :AcctIds];
    Map<ID,List<contact>> maper = new Map<ID,List<contact>>();
    for(Account aa:updatedaccount)
    {      
        maper.put(aa.id,aa.contacts);
    }
    system.debug( 'map contains'+maper);
        
  
        for(contact cc:[select id,Nofsiblings__c,Accountid from Contact where Accountid in:maper.keyset()])
        {
            Contact c=new contact();
            c.id=cc.id;
            system.debug(c.id);
            system.debug(cc.id);
            c.Nofsiblings__c=maper.get(cc.Accountid).size()-1;
            updatedcontacts.add(c);
            System.debug('siblings are==>'+c.Nofsiblings__c);
        } 
    
    
    
        update updatedcontacts;
    
         }
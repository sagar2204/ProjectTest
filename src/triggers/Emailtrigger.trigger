trigger Emailtrigger on Contact (After insert,After update) 
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
         if(c.AccountId <> trigger.oldMap.get(c.id).accountId){
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
    
    Map<string,List<contact>> maper=new  Map<string,List<contact>>(); 
    List<Account> allaccount=[select Email__c,(select id,Email from contacts) from Account where id in :AcctIds];
    for (Account a:allaccount)
    {
        maper.put(a.Email__c,a.contacts);  
    }
    List<Account> aa=[select  Email__c from Account where Email__c in:maper.keySet() ];
    system.debug(aa);
    for(Account a:aa)
    {   for(contact c:trigger.new)
        {        contact cc=new contact();
                 cc.id=c.id;
                cc.AssistantName='sagar';
                 updatedcontacts.add(cc);
         
        }
    }
    insert updatedcontacts;
}
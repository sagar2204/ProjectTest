trigger NNAme on Account (After insert,After Update) {
     List<Account> ll = new List<Account>();
    if(trigger.isInsert)
    {
    List<Account> ul = new List<Account>();
   

    for (Account u : Trigger.new) {   

        Account AccounttoUpdate = new Account(Id = u.Id, SLASerialNumber__c = u.Name);

        ul.add(AccounttoUpdate);           

    }   update ul;
        }


    
    if(trigger.isAfter)
    {
        If(trigger.isUpdate)
        {    
        for(Account a:trigger.new)
        {
            if(Trigger.oldmap.get(a.id).Name!=Trigger.Newmap.get(a.id).Name)
            {
                  Account AccounttoUpdatee = new Account(Id = Trigger.new[0].Id, SLASerialNumber__c = Trigger.new[0].Name); 
                ll.add(AccounttoUpdatee); 
            }
        }
               
         update ll;  
    }

       

}
}
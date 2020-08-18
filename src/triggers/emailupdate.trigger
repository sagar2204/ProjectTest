trigger emailupdate on Account (before update)
{
    
    List<Account> updatedlist=new List<Account>();
    for(Account a:Trigger.new)
    {
        if(Trigger.oldMap.get(a.id).Email__c!=Trigger.NewMap.get(a.id).Email__c)
        {
            Account aa=new Account();
            aa.id=a.id;
            aa.Count__c=0;
            updatedlist.add(aa);
            
            
            
        }
    }
   update  updatedlist;

}
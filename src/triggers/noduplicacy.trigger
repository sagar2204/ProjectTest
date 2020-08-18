trigger noduplicacy on Account (before insert,before update)
{
    
    Set<string> s=new Set<string>();
    map<String,Account> xmap =new map<String,Account>();
    for(Account a:trigger.new)
    { 
        s.add(a.Name); 
        
    }
    // List<Account> ll=[select Name from Account  where Name in:xmap.keyset()];
    
    if(s.size()>0)
    {
        List<Account> ll=[select Name from Account  where Name in:s];
        
        for(Account aa:ll) 
        {
            xmap.put(aa.name,aa);
        }
        for(account a:trigger.new)
        {
            if(xmap.containskey(a.name))
            {
                a.adderror('Name already exist');
                
            }
        }
    }
}
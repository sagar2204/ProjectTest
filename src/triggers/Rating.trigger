trigger Rating on Contact (After insert)
{   boolean istrue=false;
    ID  i;
    for(Contact c:trigger.new)
    {
        i=c.AccountId;
    }
    List<Contact> values =[select id,Rating__c,AccountId from Contact where AccountId =: i ];
    
    
    for(Contact o:values)
    {
        if(o.Rating__c==10)
        {   istrue=true;
        }
    }
 Account a=new Account() ;
            a.Id=i;
            a.Goodrating__c=istrue;
            update a;
        
    
    

}
trigger newcontact on Contact (After insert) 
{
    string x;
    for(contact c:trigger.new)
    {
        x=c.AccountID;
    }
    system.debug('value========='+x);
    List<contact> LL=[select ID from contact where AccountID =: x];
        Account a=new account();
        a.ID=x;
        a.No_of_contacts__c=LL.size();
        update a;
   
    

    

}
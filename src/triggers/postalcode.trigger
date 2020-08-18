trigger postalcode on Account (before insert)
{
/* List<Account> postal=new List<Account>();
    postal=[select shippingpostalcode__c from Account]; */
    
        
    for(Account a:Trigger.new)
    {

         a.billingpostalcode__c=a.shippingpostalcode__c; 
        system.debug(a.billingpostalcode__c);
        
     }
    

}
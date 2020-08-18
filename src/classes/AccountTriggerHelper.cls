public class AccountTriggerHelper
{
     public static void cloneshippingpostalcode(List<Account> triggerNew)
     {
     for(Account a:triggerNew)
     {
         a.BillingPostalCode = a.ShippingPostalCode;
         system.debug(a.BillingPostalCode);
     }
     }

    Public static void Cars(List<Account> triggerNew)
    {
        system.debug('cars');
        List<Opportunity> opplist=new List<Opportunity>();
         
        
    for(Account a : triggernew)
    { 
                 Opportunity op1=new Opportunity();
                 op1.Name='123'+' ' +a.Carss__c;  
                 op1.CloseDate=date.today();
                 op1.StageName='Prospecting';
                 op1.AccountId=a.Id;
                 opplist.add(op1);

    }
    if(opplist.size() > 0)
    {
        insert opplist;
    }
    }
    
 }
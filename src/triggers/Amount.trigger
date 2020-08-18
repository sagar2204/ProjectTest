trigger Amount on Opportunity (After insert)
{       string s;
    for(Opportunity op:trigger.new)
{
      s=op.AccountID;
}
 List <Opportunity> values=[select ID,opp__c from Opportunity where AccountId =:s ];
 Decimal i=0;
 
 for(Opportunity o:values)
 {
     i=i+o.opp__c;
 }
 
 Account a=new Account();
 a.ID=s;
 a.Totalamount__c=i;
 update a;
 Account a=new Account();
 a.ID=s;
 a.Totalamount__c=i;
 update a;
 

}

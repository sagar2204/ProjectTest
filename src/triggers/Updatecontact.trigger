trigger Updatecontact on Account (after update) 
{
set<ID> s1=new set<ID>();
for(account a:trigger.new)
{
s1.add(a.ID);
}
List<contact> l2=new List<contact>();
List<contact> l1=new List<contact>();
l1=[select id,Account.Accounttype__c,Contacttype__c from Contact where AccountID IN:s1];
for(contact c:l1)
{
c.Contacttype__c=c.Account.Accounttype__c;
l2.add(c);
}
update l2;
}
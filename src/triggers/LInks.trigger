trigger LInks on Contact (After insert,After update,After delete)
{
set<ID> s1=new set<ID>();
    
    for(Contact c:trigger.new)
    {
        s1.add(c.AccountId);
    }
    map<ID,String> main=new map<ID,String>();
    List<contact> conlist = new list<contact>();
    conlist = [select id ,AccountId, name from contact where accountId IN : s1 ];
    system.debug('test=================>'+ conlist);
    String idString = string.join(conlist,',');
    System.debug('conname========================'+ idString);
   
    
    
   
 
}
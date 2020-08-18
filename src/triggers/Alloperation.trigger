trigger Alloperation on Opportunity (after insert,after update,after delete) 
{
    
    List<ID> AcctIds = new List<ID>(); //storing  opp(accountids) in lIST
    List<Account> upacc=new List<Account>();
   
  
    if(trigger.isInsert)
        
        for(Opportunity opp:trigger.new) 
    {
        AcctIds.add(opp.AccountId);
        // system.debug(AcctIds);
    }
    //update
    if(trigger.isUPdate)
    {
        for(Opportunity opp : trigger.old) 
        {
            AcctIds.add(opp.AccountId);
            //   system.debug(AcctIds);    
        }
        for(Opportunity opp : trigger.New)
        {
            AcctIds.add(opp.AccountId);
            // system.debug(AcctIds);
        }
    }
    if(trigger.isDelete)
    {
        for(Opportunity opp : trigger.old) 
        {
            AcctIds.add(opp.AccountId);
            //system.debug(AcctIds);
            
        }
    }
    
 //   List<Opportunity> value=[select ID,opp__c from Opportunity where AccountId in :AcctIds];
     List<Account> Updatedaccount = [select  id,Totalamount__c,(select id, opp__c from Opportunities) from Account where Id in :AcctIds];
     Map<ID,List<Opportunity>> maper = new Map<ID,List<Opportunity>>();
      
        for(Account aa:updatedaccount)
        {      
            maper.put(aa.id,aa.Opportunities);
        }
        for(Id accId:maper.Keyset())
        {     Decimal i=0;
            List<opportunity> relatedopp=maper.get(accId);
            for(opportunity op1:relatedopp)
            {
                i=i+op1.opp__c;
            }     
         Account a=new Account();
         a.Id=accId;
         a.Totalamount__c=i;
         Insert a;
         upacc.add(a);
         
         
         
        }
    update upacc;
    
   // Decimal i=0;
   /* 
    for(Opportunity o:value)
    {
        if(maper.containsKey(o.AccountId))
        {
            maper.get(o.AccountId).add(o);
        }
        else{
            List<Opportunity> oplist= new List<opportunity>();
            oplist.add(o);
            maper.put(o.AccountId,oplist);
        }
    }
       for(ID aa:maper.keyset())
       {Account a=new Account();
          a.id=aa;
          decimal i=0;
           for(opportunity op1:maper.get(aa))
            {
            i=i+op1.opp__c;    
            }
            a.Totalamount__c=i;
            update a;    
       }
*/ 
    }
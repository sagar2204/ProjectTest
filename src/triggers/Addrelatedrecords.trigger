trigger Addrelatedrecords on Account (after insert,after update) 
{
    List<Opportunity> opplist=new List<Opportunity>();
    List<Account> Acclist =[select Id,Name,Carss__c from Account where Id in :Trigger.new];
    system.debug(Acclist[0].Opportunities);
    
    for(Account a : Acclist)
    {
        system.debug('accwithopp.get(a.id)====' +a.Opportunities.size());
            
            if(a.Opportunities.size()==0)
            {
              /*oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                               StageName='Prospecting',
                                               CloseDate=System.today().addMonths(1),
                                               AccountId=a.Id));
*/
                 Opportunity op1=new Opportunity();
                 op1.Name='123'+'' +a.Carss__c;  
                 op1.CloseDate=date.today();
                 op1.StageName='Prospecting';
                 op1.AccountId=a.Id;
                 opplist.add(op1);
}
    }
    if(opplist.size() > 0)
    {
        insert opplist;
    }
    
}
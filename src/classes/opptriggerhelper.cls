public class opptriggerhelper
{
   
    Public static void Cars(List<opportunity> triggerNew)
    {
        List<opportunity> oplist=new List<opportunity>();
        
        List<Account> Acclist=[Select id,(select id,Name from opportunities) from Account where Id in:Trigger.New]; 
        system.debug(Acclist);
        for(Account a:Acclist)
        {
            if(a.opportunities.Size()==0)
            {
                oplist.add(New opportunity( Name='123'+''+a.Carss__c,
                                               StageName='Prospecting',
                                               CloseDate=System.today().addMonths(1),
                                               AccountId=a.Id));
            }
        }
       
    
        Insert oplist;
    
    }
    
 }
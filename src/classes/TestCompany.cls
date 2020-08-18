@isTest
    public class TestCompany
    {
        @isTest static void tester()
            
        {     test.startTest();
               Account a=new Account(Name='test22',Type='Prospect');
               insert a;
               Account a1=new Account(Name='test23',Type='Prospect');
               insert a1; 
         
                Opportunity o=new Opportunity();
                o.Name='Test1';
                o.AccountId=a.id;
                o.CloseDate=System.today();
                o.StageName='Closed won';
                insert o;
         
                o.AccountId=a1.id;
                update o; 
            
                 List<Opportunity> del=[Select id ,Accountid from Opportunity where id =:o.id];
                 delete del;
         
                Test.stopTest();
               
         
        }
        
     
    }
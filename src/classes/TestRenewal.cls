@istest
public class TestRenewal {
    @isTest static void tester()
    {             
                   Test.startTest();
                       Opportunity o=new Opportunity();
                       o.Name='Renewed ';
                       o.Opptype__c='Renwed';
                       o.CloseDate=System.today();
                       o.StageName='Closed won';
                   Test.stopTest();
                    
                        
              
              
    }
}
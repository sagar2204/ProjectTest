@istest
public class TestSibling {
      @isTest static void Tester()
      {    Test.startTest();
          Account a=new Account(Name='test22',Type='Prospect');
            insert a;
           Account a1=new Account(Name='test23',Type='Prospect');
            insert a1;
           Contact c=new Contact();
           c.AccountId=a1.id;
           C.LastName='Test';
           insert c;
        
      c.AccountId=a.id;
      update c;
      }
     }
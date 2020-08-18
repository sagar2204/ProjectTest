@isTest
public class TestAccountdel {

    @isTest static void test()
    {
          Account c = new Account(Name = 'INVALIDNAME');
          Database.SaveResult result = Database.insert(c, false);
          System.assertEquals('You cannot delete this account because this account has related opportunities',result.getErrors()[1].getMessage());
    }

}
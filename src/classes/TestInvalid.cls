@isTest
public class TestInvalid {
    @isTest static void test()
    {
          Contact c = new Contact(LastName = 'INVALIDNAME');
          Database.SaveResult result = Database.insert(c, false);
         System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML',result.getErrors()[0].getMessage());
    }

}
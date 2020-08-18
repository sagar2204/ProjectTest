@isTest
public class TestPostalcode {
    @isTest static void test()
    {
        Account a=new Account(Name='T1',shippingpostalcode__c=11);
        insert a;
    }

}
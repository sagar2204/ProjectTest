@isTest
private class TestAccount {
    @isTest static void T1() 
    {
            Test.startTest();
        
        Account acct = new Account(Name='Test Account',Type='Prospect',shippingpostalcode__c=133001);
        insert acct;
         
               
           Test.stopTest();
}
}
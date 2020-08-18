@isTest
private class AccountTriggersTest{
	private static testmethod void accountTriggersTest(){
		Account acc = new Account();
		acc.name = 'NewAccount';
        acc.billingpostalcode__c=133001;
		insert acc;
	}
}
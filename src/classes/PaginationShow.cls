public with sharing  class PaginationShow {
    @AuraEnabled
    public static List<Account> getLimitedAccounts(){
        List<Account> accounts = [SELECT
               Id, Name, Phone, Rating,	Active__c
               FROM Account ];
        
        return accounts;
    }
    
      @AuraEnabled
    public static void updateAccount(List<Account> acc ){
        update acc;
    }
    
    @AuraEnabled
    public static list<Account> deleteForm(List<Account> lstId) {
        List<Account> rf = [SELECT Id FROM Account WHERE Id IN :lstId];
        delete rf;
        return [SELECT
               Id, Name, Phone, Rating,	Active__c
               FROM Account ];

    }
 
    }
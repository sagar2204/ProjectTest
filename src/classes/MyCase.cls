public with sharing class MyCase {
    
    @AuraEnabled
    public static List<Case> getCases(){
        Id myId = UserInfo.getUserId();
        System.debug('myId+++++++++++'+myId);
        
        List<Case> clist = [Select Id, Subject, Type, Origin, Status From Case];
        
        System.debug('clist++++++++++'+cList.size());
        return cList;
    }
    
    @AuraEnabled
    public static Case saveCase(Case ca) {
        
        // Perform isUpdateable() check here
        Insert ca;
        return ca;
    }}
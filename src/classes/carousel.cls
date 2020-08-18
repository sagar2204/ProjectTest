public class carousel {
    @AuraEnabled 
    public static List<slider__c> getdata(){
     
        
        return[Select Id,Active__c ,heading__c,subheading__c,Order__c,Name,Image__c from slider__c where Active__c=true order by Order__c];
    }
}
public class CampingListController {
    @AuraEnabled
    public static List<Camping_Item__c> getItems()
    {
        return[select Name,Quantity__c,Price__c,Packed__c from Camping_Item__c];
    }
    @AuraEnabled
    public static void saveItem (Camping_Item__c campingItem) 
    {
        insert campingItem;
    }

}
public class ViewContacts_on_Account {
    @AuraEnabled 
    public static List<contactListWrapper> fetchContactWrapper(Id recordId ){     
        List<contactListWrapper> lstcontactListWrapper = new List<contactListWrapper>();
        // query contact records related to account and create 'contactListWrapper' class instance for each record. 
        for(Contact con : [Select id,FirstName,LastName,Phone from Contact where AccountId =:recordId Limit 100]){
            // by default checkbox should be false 
            lstcontactListWrapper.add(new contactListWrapper(false,con));
        } 
        // return the 'lstcontactListWrapper' list 
        return lstcontactListWrapper; 
    }
    @AuraEnabled
    public static void DelcontactList(list<Contact> lstRecordId) {  
        list<id> ids=new list<id>();  
        for(Contact c : lstRecordId){
            ids.add(c.id);
        }
        List<contact> contactList = [Select id,FirstName,LastName,Phone from Contact where Id =:ids];
        delete contactList;
    }
    
    /* wrapper class */  
    public class contactListWrapper {
        @AuraEnabled public boolean isChecked {get;set;}
        @AuraEnabled public  contact objContact{get;set;}
        public contactListWrapper(boolean isChecked, contact objContact){
            this.isChecked = isChecked;
            this.objContact = objContact;
        }
    }
}
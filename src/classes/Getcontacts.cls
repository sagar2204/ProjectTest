public class Getcontacts {
    @AuraEnabled
    Public static List <contact> returncontact(string name, string email) {
        return[Select  Id, LastName,Contacttype__c, Email,HomePhone,CreatedDate from contact where LastName=: name AND Email=: email ];
        
        
    } 
    @AuraEnabled
 public static list <contact> fetchContact() {
     return[Select id,LastName,Contacttype__c, Email from contact LIMIT 10];
 }
    
    @AuraEnabled
    public static List<contact> EditListed (List<contact> updateData){
        Update updateData;
        system.debug(updateData);
        return updateData; 
    } 
     @AuraEnabled
    public static List<contact> EditList (List<contact> updatedData){
        Update updatedData;
        system.debug('updatedData');
        return updatedData;
    }
    
    @AuraEnabled
    public static List<contact> dList (String contactId){
        System.debug('contactId');
        List<contact> dLister = [Select Id, FirstName, Email, LastName From Contact Where id =: contactId];
        delete dLister;
        return dLister;
    }    
    
    @AuraEnabled   
    public static Map<String, String> getype(){
        Map<String, String> options = new Map<String, String>();
       
        Schema.DescribeFieldResult fieldResult = contact.Contacttype__c.getDescribe();
        system.debug(fieldResult);
    
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            //Put Picklist Value & Label in Map
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    }
    
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
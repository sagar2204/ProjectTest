public class ContactAuraController {
    
    public class ContactDataTableWrapper {
        @AuraEnabled
        public Integer pageSize {get;set;}
        @AuraEnabled
        public Integer pageNumber {get;set;}
        @AuraEnabled
        public Integer totalRecords {get;set;}
        @AuraEnabled
        public Integer recordStart {get;set;}
        @AuraEnabled 
        public Integer recordEnd {get;set;}
        @AuraEnabled
        public List<Case> contactList {get;set;}
        @AuraEnabled
        public List<ContactDataTableWrapper> conlist {get;set;}
        @AuraEnabled
        public List<Contact> searchcon {get;set;}
        @AuraEnabled  
        public Boolean selected {get; set;}
        @AuraEnabled
        public Contact att {get; set;}
        
        /* public ContactDataTableWrapper(contact a)
{
att = a;
selected = false;

}
*/
        
    }
    
    
    @AuraEnabled
    public static ContactDataTableWrapper getContactData(Decimal pageNumber, Decimal pageSize) {
        
        Integer pSize = (Integer)pageSize;
        Integer pNumber = (Integer)pageNumber;
        
        //Offset for SOQL
        Integer offset = (pNumber - 1) * pSize;
        
        //Total Records
        Integer totalRecords = [SELECT COUNT() FROM Case];
        Integer recordEnd = pSize * pNumber;
        
        //Instance of Contact DataTable Wrapper Class
        ContactDataTableWrapper objDT =  new ContactDataTableWrapper();  
        objDT.pageSize = pSize;
        objDT.pageNumber = pNumber;
        objDT.recordStart = offset + 1;
        objDT.recordEnd = totalRecords >= recordEnd ? recordEnd : totalRecords;
        objDT.totalRecords = totalRecords;
        objDT.contactList = [Select CaseNumber,Status,Priority,Origin from Case LIMIT :pSize OFFSET :offset];
        return objDT; 
    } 
    
    
   /* @AuraEnabled
    public static List<contact> findByName(String searchKey) {
        String name = searchKey ;
        return [SELECT id, Name, Email FROM contact  WHERE Name=:name OR Email=:name]; 
    }
    */
    /*@AuraEnabled
    public static ContactDataTableWrapper search(String searchKey)
    {    ContactDataTableWrapper obj =  new ContactDataTableWrapper();  
         String name = searchKey;
         system.debug(name); 
         obj.contactList=[SELECT id, Name, Email,Phone FROM contact WHERE Name=:name OR Email=:name];  
         return obj; 
     
    }*/
}
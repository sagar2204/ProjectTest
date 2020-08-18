public class SearchEdit {
    
    @AuraEnabled
    public static List<contact> getContact (String lname,String fname, String mail){
        List<contact> cList = [Select Id, FirstName, Email, LastName From Contact 
Where (LastName =:lname and FirstName=:fname and Email=:mail)];
        return cList;
    }
    @AuraEnabled
    public static List<contact> dList (String contactId){
        System.debug('contactId');
        List<contact> dLister = [Select Id, FirstName, Email, LastName From Contact Where id =: contactId];
        delete dLister;
        return dLister;
    }    
    @AuraEnabled
    public static List<contact> EditListed (List<contact> updateData){
        Update updateData;
        system.debug('updateData');
        return updateData;
    }   
     @AuraEnabled
    public static List<contact> EditList (List<contact> updatedData){
        Update updatedData;
        system.debug('updatedData');
        return updatedData;
    }
    
    @AuraEnabled
    public static List<contact> allContact (String lname,String fname, String mail){
        List<contact> allList = [Select Id, FirstName, Email, LastName From Contact 
 Where (LastName =:lname or FirstName=:fname or Email=:mail)ORDER BY Contact.LastName ASC NULLS LAST LIMIT 125
];
        return allList;
}
}
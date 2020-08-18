public class accListClass{
    @AuraEnabled 
    public List<Account> accList = new List<Account>();
    
    @AuraEnabled 
    public List<Account> delRec = new List<Account>();
    
    @AuraEnabled 
    public static List<Account> getAccounts(String query)
    {
        accListClass alc = new accListClass();
        
        alc.accList = Database.query('SELECT Id,Name,Phone,Industry from Account');
                
        return alc.accList;
    }
   
    @AuraEnabled 
    public static List<Account> delSlctRec(List<String> slctRec)
    {
        accListClass alc = new accListClass();
        alc.delRec = [SELECT Id FROM Account WHERE Id IN: slctRec ];
       try{
           delete alc.delRec;
           } catch(Exception ex)
          {
             throw new AuraHandledException(ex.getMessage());
          }
        alc.accList = Database.query('SELECT Id,Name,Phone,Industry from Account');
                
        return alc.accList;
       
    }
}
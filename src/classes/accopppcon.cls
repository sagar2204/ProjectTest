public class accopppcon { 
    @AuraEnabled 
    public static List<string>  getAllAccount(){
        
        list<string> results = new List<string>();   
        List<Account>allList=[Select Id,name,(Select name from opportunities),(Select Name from contacts) from Account limit 15];
        for(Account ac: allList){
            if(ac.contacts.size()>0 || ac.opportunities.size()>0){ 
                
                 results.add(ac.name);
            }
        }
        return results;
    } 
    @AuraEnabled
    public static accFieldWrapper getAccountDetails(list<String> parameter){
        accFieldWrapper results = new accFieldWrapper();//Instance
        list<Account> accList = new list<Account>();       
        results.contacts = new List<string>();
        results.opportunities = new List<string>();
        string query = 'Select Id,name,(Select name from opportunities),(Select Name from contacts) from Account';
        if(parameter.size()>0){
            query = query + ' where name =:parameter';  
        }
        query = query + ' LIMIT 25';
        accList = database.query(query);
        for(Account ac:accList){
            
            //results.accounts.add(ac.name);
            if(ac.contacts.size()>0){
                
                for(Contact c: ac.contacts){
                    results.contacts.add(c.name);
                }
                
            }
           /* if(ac.opportunities.size()>0){
                
                for(Opportunity op: ac.opportunities){
                    //results.opportunities.add(op.Name); 
                }   
                
            }*/
        }
        return results;
    }
    
    public class accFieldWrapper {
        @AuraEnabled
        public List<string> Accounts{get;set;}       
        @AuraEnabled
        public List<string> Contacts{get;set;}
        @AuraEnabled
        public List<string> Opportunities{get;set;}
    }    
}
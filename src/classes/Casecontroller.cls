public class Casecontroller {
    @AuraEnabled
    public static list <case> fetchCase() { 
        return[Select id,CaseNumber,Status,Priority,Origin from Case];
    } 
    @AuraEnabled
    public static list <case> fetchCase1(string accid) {
        return[Select id,CaseNumber,Status,Priority,Origin from Case where accountid=:accid];   
    }  
    @AuraEnabled
    public static list <case> fetchCases(String caseId) { 
        return[Select id,CaseNumber,Status,Priority,Origin,description,Subject from Case where Id=:caseId];
    } 
    @AuraEnabled
    public static list <SpotlightMessage__c> fetchmessage() { 
        return[select Message__c from SpotlightMessage__c  where showspotlight__c=true order by LastModifiedDate];
    }
    @AuraEnabled
    public static list <knowledge__kav> fetchknowledge() {  
        return[select Id,ArticleNumber,Title,Summary from knowledge__kav];  
    }
    @AuraEnabled 
    public static Case savecase (Case acc) {
        
        Insert acc;
        return acc; 
    }
    @AuraEnabled
    public static List<case> fetchdata(String values,string accid)
    { 
        List<Case> listofcase =new List<Case>();
        // List<User> UserRecord = [SELECT Id,ContactId,Contact.Name from user where id=:UserInfo.getUserId() limit 1];
        System.debug('values'+values);
        if(values.length()>0){
            List<String> listString=new List<String>{'New','Escalated','Working'};
                if(values=='All cases'){ 
                    String Str = 'Select id,CaseNumber,Status,Priority,Origin from Case';   
                    listofcase=Database.query(Str); 
                } 
            
            else if(values=='My Open Support Cases'){ 
                
                String Str = 'Select id,CaseNumber,Status,Priority,Origin from Case where Status in:listString'; 
                listofcase=Database.query(Str); 
            }
            else if(values=='My Closed Support Cases'){
                String s='Closed';
                String Str = 'Select id,CaseNumber,Status,Priority,Origin from Case where Status =\''+s+'\'';
                listofcase=Database.query(Str); 
            } 
            else if(values=='Institutional Open Cases'){
                
                String Str = 'Select id,CaseNumber,Status,Priority,Origin from Case where Status in:listString and Accountid=:accid';   
                listofcase=Database.query(Str); 
            } 
            else if(values=='Institutional closed Cases'){
                String s='Closed'; 
                String Str = 'Select id,CaseNumber,Status,Priority,Origin from Case where Status =\''+s+'\' and  Accountid=:accid';  
                listofcase=Database.query(Str); 
            } 
        }
        return listofcase;
    }
    
}
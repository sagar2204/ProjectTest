public class createcases { 
@AuraEnabled
    public static ListWrapper getDetails(){
        ListWrapper listwrapper = new ListWrapper(); 
        try
        {
            Schema.DescribeFieldResult status = Case.Status.getDescribe();
            Schema.DescribeFieldResult origin = Case.Origin.getDescribe();
            Schema.DescribeFieldResult Priority = Case.Priority.getDescribe();
            Schema.DescribeFieldResult Subject = Case.Subject.getDescribe();
            List<Schema.PicklistEntry> plestatus = status.getPicklistValues();
            List<Schema.PicklistEntry> pleorigin = origin.getPicklistValues();
            List<Schema.PicklistEntry> plePriority = Priority.getPicklistValues();
            List<Schema.PicklistEntry> pleSubject = Priority.getPicklistValues();
           
            for( Schema.PicklistEntry pickListVal : plestatus){
                listwrapper.methodOptionsStatus.add(pickListVal.getValue());
            } 
            for( Schema.PicklistEntry pickListVal : pleorigin){
                listwrapper.methodOptionsOrigin.add(pickListVal.getValue());
            } 
             for( Schema.PicklistEntry pickListVal : plePriority){
                listwrapper.methodOptionsPriority.add(pickListVal.getValue());
            }  
            
        }catch(Exception ex){
            listwrapper.errorMsg = ex.getMessage();
        }
        return listwrapper;
    }
    @AuraEnabled
    public static string InsertCase(ListWrapper wrapper){
        Case obj = new Case();
            obj.Status=wrapper.status;
            obj.Origin=wrapper.origin;
            obj.Priority=wrapper.Priority;
            obj.subject=wrapper.subject;  
            insert obj; 
        
        return obj.id; 
    }  
    
    public class ListWrapper{
        @AuraEnabled public List<String> methodOptionsServerity {get;set;}
        @AuraEnabled public List<String> methodOptionsStatus {get;set;}
        @AuraEnabled public List<String> methodOptionsOrigin {get;set;}
        @AuraEnabled public List<String> methodOptionsPriority {get;set;}
        @AuraEnabled public String Priority {get;set;} 
        @AuraEnabled public String status {get;set;}
        @AuraEnabled public String origin {get;set;}
        @AuraEnabled public String subject {get;set;}
        @AuraEnabled public String description {get;set;} 
        @AuraEnabled public string errorMsg {get;set;} 
        @AuraEnabled public string documentId {get;set;} 
        @AuraEnabled public string documentName {get;set;} 
        @AuraEnabled public string additionalContact {get;set;}
        @AuraEnabled public string AlternateContactId {get;set;}
        
        public ListWrapper(){
            methodOptionsStatus= new List<String>();
            methodOptionsOrigin= new List<String>();
            methodOptionsPriority=new List<String>(); 
            status='';
            origin='';
            Priority='';
            subject ='';
            
            
        }
    }
}
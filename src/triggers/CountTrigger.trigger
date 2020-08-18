trigger CountTrigger on Contact (after insert,after update) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            // Process before insert
        } else if (Trigger.isAfter) {
            
            Map<id,account> MapAcc = new Map<id,account>();
            List<Contact> ListCon = [select accountid , account.Email__c, account.Count__c, Email
                                     from contact where id =:trigger.new];
            
            for(contact c : ListCon){
                if(c.Email == c.Account.Email__c){
                    if(MapAcc.containsKey(c.AccountId)){
                        Account temp = MapAcc.get(c.AccountId);
                        temp.Count__c = temp.Count__c +1;
                        MapAcc.put(temp.Id,temp);
                    }
                    else{
                         Account Acc = new Account(id = c.AccountId , Count__c = c.account.Count__c +1);  
                        MapAcc.put(Acc.Id,Acc); 
                    }
                }
            }
            Update MapAcc.values();
        }
    }
    else if (Trigger.isDelete) {
        // Process after delete
    }
}
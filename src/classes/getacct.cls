public class getacct {
     List<account> accts=[select Id,Name,Type,Phone from Account];
   
    public List<account> getaccount()
    {
       
        return accts;
    }
    
    
    
}
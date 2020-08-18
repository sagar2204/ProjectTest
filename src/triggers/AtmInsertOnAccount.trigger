trigger AtmInsertOnAccount on Account (After insert) {
 
    
     User u=[select id from User where Name='Sagar kakkar'];
    List<Accountteammember> Atmlist=new List<Accountteammember>();
    
     for(Account a:Trigger.New){
        if(a.Industry=='Retail' && a.AnnualRevenue > 500000){
            AccountTeamMember atm=new AccountTeamMember();
            atm.accountId=a.id;
            atm.userId=u.id;
            atm.TeamMemberRole='Account Manager';
            atm.AccountAccessLevel='Edit';
            Atmlist.add(atm); 
        }
     }
    if(Atmlist.size()>0)
    {
        Insert Atmlist;  
    }
}
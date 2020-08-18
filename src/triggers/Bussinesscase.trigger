trigger Bussinesscase on Case (After insert) 
{    
    /* 
    CaseTeamMember[] newCTMs= new CaseTeamMember[]{};
    List<AccountTeamMember> ATMs = [select Accountid,TeamMemberRole,AccountAccessLevel,CaseAccessLevel,userid from 
                                        AccountTeamMember where Accountid = :trigger.new[0].accountid and(Account.NSE__c=true and Account.UC__c=true)]; 
     
    for(AccountTeamMember ATM:ATMs){
       
        CaseTeamRole CTR = [select id from caseteamrole where name = :ATM.TeamMemberRole];
        CaseTeamMember CTM = new CaseTeamMember(ParentId = trigger.new[0].id,memberid = ATM.UserId , TeamRoleId = CTR.Id);
        newCTMs.add(CTM);
    }
    
    insert newCTMs; */
         
    set<Id> CaseAccIds=new Set<Id>();
    map<Id,Case> targetmap=new  map<Id,Case>(); 
    if(trigger.isinsert)
    {
       for(case c:trigger.new)
       {
          targetmap.put(c.accountid,c);
       }
    }
  List<AccountTeamMember> oldteamember=[select Accountid,Account.NSE__c,Account.UC__c,UserId from AccountTeamMember where Accountid in:targetmap.keySet()]; 
    List<CaseTeamRole> newlist=new List<CaseTeamRole>();
    for(AccountTeamMember a:oldteamember)
    {
        if(a.Account.NSE__c==true && a.Account.UC__c==true)
        {
            CaseTeamRole cc=new CaseTeamRole();
            cc.id=cc.id;
            cc.Name='ABC';
            cc.AccessLevel='Edit';
            newlist.add(cc);

        }
    }
    insert newlist; 
}
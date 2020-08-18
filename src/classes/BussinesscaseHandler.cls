public class BussinesscaseHandler {
    Public static void caseTeamUpdateOnInsert(List<Case> newcase){  
        
        Map<String,id> caseteamroleMap = new Map<String,id>();
        Map<Id,id> caseaccountmap = new Map<id,id>();
        for(case c : newcase){
            caseaccountmap.put(c.accountid,c.id);
            
        }
        
        CaseTeamMember[] newCTMs= new CaseTeamMember[]{};
            List< CaseTeamRole> CTR = [select id,Name from caseteamrole];
        For(CaseTeamRole ct : CTR)
        {
            caseteamroleMap.put(ct.name,ct.id);
        }
        List<AccountTeamMember> ATMs = [select Accountid,TeamMemberRole,AccountAccessLevel,CaseAccessLevel,Userid from
                                        AccountTeamMember where Accountid in :caseaccountmap.keyset() and((Account.NSE__c=true and Account.UC__c=true) 
                                                                                                          AND(TeamMemberRole='Named Support Engineer' OR  TeamMemberRole='Customer Engagement Manager'))
                                       ];
        
        for(AccountTeamMember ATM:ATMs)
        {
            if(caseteamroleMap.containskey(ATM.TeamMemberRole)){
                CaseTeamMember CTM = new CaseTeamMember(ParentId = caseaccountmap.get(ATM.AccountId),memberid = ATM.UserId , TeamRoleId = caseteamroleMap.get(ATM.TeamMemberRole));
                newCTMs.add(CTM);
            }
            
        }
        
        if(newCTMs!=null)
        {
            insert newCTMs;
        }
    }
    
    
    Public static void caseTeamUpdateOnUpdate(List<Case> newcase,map<id,case> oldmap){   
        Map<String,id> caseteamroleMap = new Map<String,id>();
        Map<Id,id> caseaccountmap = new Map<id,id>();
        
        for(case c : newcase){
            if(c.AccountId!= oldmap.get(c.id).Accountid)
            { system.debug('New Accountid------>'+ c.Accountid);
             caseaccountmap.put(c.accountid,c.id);
             system.debug('caseaccmap'+caseaccountmap);
            }
        }
        
        CaseTeamMember[] newCTMs= new CaseTeamMember[]{};
            List< CaseTeamRole> CTR = [select id,Name from caseteamrole];
        For(CaseTeamRole ct : CTR)
        {
            caseteamroleMap.put(ct.name,ct.id);
            system.debug(caseteamroleMap);
        }
        
        { 
            List<CaseTeamMember> deleteCTM=[Select id from caseteammember where parentid in:oldmap.keyset()];
            system.debug('OLD CTM'+deleteCTM);
            Delete  deleteCTM;
            List<AccountTeamMember> ATMs = [select Accountid,TeamMemberRole,AccountAccessLevel,CaseAccessLevel,Userid from
                                            AccountTeamMember where Accountid in :caseaccountmap.keyset() and((Account.NSE__c=true and Account.UC__c=true)AND
                                                                                                              (TeamMemberRole='Named Support Engineer' OR  TeamMemberRole='Customer Engagement Manager'))];
            system.debug('ATMS'+ ATMs);
            
            for(AccountTeamMember ATM:ATMs)
            {  system.debug('Inside If');
             if(caseteamroleMap.containskey(ATM.TeamMemberRole)){
                 system.debug('Inside loop');
                 CaseTeamMember CTM = new CaseTeamMember(ParentId = caseaccountmap.get(ATM.AccountId),memberid = ATM.UserId , TeamRoleId = caseteamroleMap.get(ATM.TeamMemberRole));
                 system.debug(CTM);
                 newCTMs.add(CTM);
                 system.debug( 'NewCTMs..........>'+newCTMs);
             }
             
            }
            
        }
        
        if(newCTMs!=null)
        {
            insert newCTMs;
        }
        
    }
}
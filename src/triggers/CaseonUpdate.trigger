trigger CaseonUpdate on Case (before Update) 
{
    Set<Id> caseid=new set<Id>();
    Map<Id,List<case>> maper=new Map<Id,List<case>>();
    List<case> caseupdate=new List<case>();
    for(case c:Trigger.new)
    { if(c.Status=='Closed')
    {
        caseid.add(c.id); 
    }}
    system.debug(caseid);
    
    List<Case> oldcases = [ Select Id,Status,ParentId From Case where (status != 'Closed'and ISCLOSED=FALSE) and ParentId IN : caseId];
    system.debug('oldcases'+oldcases);
    for(case cs:oldcases)
    {
        if(maper.containsKey(cs.ParentId)){
            maper.get(cs.ParentId).add(cs);
        }else{
            maper.put(cs.ParentId,new Case[]{cs});
            system.debug('map====='+maper);
        }
    } 
   /* List<case> childcases=[select id,(Select Id,Status,ParentId From Cases where (status != 'Closed'and ISCLOSED=FALSE)) from case where id in:caseId];
    for(case cs:childcases)
    {
        if(maper.containsKey(cs.Id)){
            maper.get(cs.Id).add(cs);
        }else{
            maper.put(cs.Id,new Case[]{cs});
            system.debug('map====='+maper);
        }
    }*/
    for(Case c : Trigger.new){
        if(maper.get(c.Id).size() > 0){
            c.addError('Parent case cannot be closed because Child case(s) has not closed yet');
        }
    }
}
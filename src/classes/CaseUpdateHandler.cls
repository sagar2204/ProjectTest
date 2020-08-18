public class CaseUpdateHandler {
    public static void CaseUpdation(Case[] cases){
        Set<Id> closedCases = new Set<Id>();
        Map<Id, Case> caseMap = new Map<Id, Case>(cases);
        Map<Id,List<case>> maper=new Map<Id,List<case>>();
        system.debug('casemap====='+caseMap);
        for(Case record: cases) {
            if(record.Status == 'Closed')
            {
                closedCases.add(record.Id);// Add record id with status=='Closed'
                system.debug('Closed cases===='+closedCases);
            }
        } 
        List<case> oldcases=[select id,(Select Id,Status,ISCLOSED From Cases where (status != 'Closed'and ISCLOSED=FALSE)) from case where id in:closedCases];
        for( case cc:oldcases){
            maper.put(cc.id,cc.cases);    // map will have case id and related childs
            system.debug('maper==='+maper);
        } if(maper!=null)
        {
            for(ID c:maper.keyset())            //will pick  only pick those recordid who will havs status closed
            {
                if(maper.get(c).size()>0)    // will  pick childs  records with isclose=FALSE if the  map have any then it will return the size 
                {system.debug('inside if');
                 caseMap.get(c).addError('child cases should be closed before closing parent case');
                }
                
            }
        }
    }
}
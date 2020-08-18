public class CaseStatusUpdate {
    
    public static void Closecase( List<case> caseid)
    {
        Set<ID> Parentid =new Set<ID>();
        List<case> updatedcase= new List<case>();
        Map<id,List<Case>> maper=new Map<id,List<Case>>();
        if(caseid!=null)
        {
            for(case c:caseid)
            {
                Parentid.add(c.id);
                system.debug(parentid);
            }
        }
        List<case> parenttochild=[Select id,Status,(Select id,Status from cases where isclosed=false) from case where (id in:Parentid and isclosed=True) and recordtype.Name='Support1'];
        system.debug('ptoc'+parenttochild);
        if(parenttochild!=null && !parenttochild.isempty())   
        {
            for(case cc:parenttochild)
            {
                maper.put(cc.id,cc.cases);
                system.debug('map===='+maper); 
            }
            
        }
        for(case c:[Select id,Status from case where isclosed=false and parentid in:maper.keySet()])
        {   
            c.status='Closed';
            updatedcase.add(c);
            
        }
        if(updatedcase!=null && !updatedcase.isempty())
        {  system.debug('updatedcase'+updatedcase);
           update updatedcase;   
        }
        
    }
}
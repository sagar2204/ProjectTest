trigger Oppline on OpportunityLineItem (After insert,After Update) {
    Set<Id> oppid=new set<Id>();
      boolean istrue=true;
    If(trigger.isInsert)
    {
        for(OpportunityLineItem o:trigger.new)
        {
            oppid.add(o.id);
        }
    }
    
    List<OpportunityLineItem> Opplist=[Select Id,TotalPrice,Opportunity.id,Opportunity.Totalcalculate__c,Product2.id,Product2.IncludeARR__c from OpportunityLineItem where id in:oppid];
     system.debug(opplist);
    
    for(OpportunityLineItem o:opplist) 
    { decimal s=0;
        if(o.Product2.IncludeARR__c=istrue)
        {
            
            system.debug(s);
            if( o.Opportunity.Totalcalculate__c==null)
            {   s=s+o.TotalPrice;
                o.Opportunity.Totalcalculate__c=s;
                system.debug( 'Total price=====>'+o.Opportunity.Totalcalculate__c);    
            }
    }
    

}
}
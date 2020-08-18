trigger Fruit on Offer__c (before insert,before update) 
{
   if(trigger.isinsert)
   {
    map<string,string> fruitsvalues =new map<string,string>();
    fruitsvalues.put('apple','red');
    fruitsvalues.put('Banana','yellow');
    fruitsvalues.put('Orange','orange');
    fruitsvalues.put('Pears','green');
    fruitsvalues.put('Grapes','Grapes');
    system.debug('The keyset values are'+fruitsvalues.keySet());
    system.debug('The size is'+fruitsvalues.size());
    system.debug(fruitsvalues.containskey('apple'));
    system.debug('The values are'+fruitsvalues.values());
    map<string,string> clonedmap=fruitsvalues.clone();
    system.debug(clonedmap.containskey('Grapes'));
    system.debug('is empty or not='+fruitsvalues.isempty());
    
   }
    
    
}
trigger Insurance on Policy__c (before insert)
{
    for(Policy__c pp:trigger.new)
    {
        if(pp.Policy_Type__c=='Car Insurance' && pp.Policy_Tenure__c=='3 Years')
        {
            pp.Amount_after_discount__c=pp.policy__c*0.7;
        }
        else if(pp.Policy_Type__c=='Car Insurance' && pp.Policy_Tenure__c=='5 Years')
        {
            pp.Amount_after_discount__c=pp.policy__c*0.6;
        }
        else if(pp.Policy_Type__c=='Health Insurance' && pp.Policy_Tenure__c=='3 Years')
        {
            pp.Amount_after_discount__c=pp.policy__c*0.5;
        }
         else if(pp.Policy_Type__c=='Health Insurance' && pp.Policy_Tenure__c=='3 Years')
        {
            pp.Amount_after_discount__c=pp.policy__c*0.4;
            system.debug(pp.Amount_after_discount__c);
        }
       
       
    }
   
       
   
}
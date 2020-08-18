trigger Insurance1 on Policy__c (before insert)
{
    map<string,map<string,integer>> mainmap=new map<string,map<string,integer>>();
    map<string,integer> CI=new map<string,integer>();
    map<string,integer> HI=new map<string,integer>();
    CI.put('3 Years',30);
    CI.put('5 Years',50);
    HI.put('3 Years',40);
    HI.put('5 Years',60);
    mainmap.put('Car Insurance',CI);
    mainmap.put('Health Insurance',HI);
    
    for(Policy__c p:trigger.new)
    {
        integer i=mainmap.get(p.Policy_Type__c).get(p.Policy_Tenure__c);
        p.Amount_after_discount__c=p.Policy__c -p.Policy__c *i/100;
    }

}
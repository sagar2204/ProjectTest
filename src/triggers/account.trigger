trigger account on Account (before insert) {
    
    for(Account a:trigger.new)
    {
        a.AnnualRevenue=1000;
        system.debug(a);
    }

}
public class Pagination {
    
    public string currid{get;set;}
    public integer totalRecs = 0;
    public integer i = 0;
    public integer LimitSize= 5; 
    
    Public Pagination()
    {
       currid=ApexPages.CurrentPage().getparameters().get('id');
       totalRecs = [select count() from contact where accountid=:currid];
    }
    
     public List<contact> getacclist()
    {
        List<contact> acc = Database.Query('select id,account.name ,name ,Email from contact where accountid=:currid LIMIT :LimitSize OFFSET :i');
        System.debug('Values are ' + acc);
        return acc;
    }
    public void FirstPage() 
    {
        i = 0;
    }
    public void previous()
    {
        i = i-LimitSize;
    }
    public void next()
    {
        i = i + LimitSize; 
    }
    public void LastPage()
    {
        i = totalrecs-math.mod(totalRecs,LimitSize);
    }
    public boolean getprev()
    {
        if(i == 0)
            return true;
        else
            return false;
    }
    public boolean getnxt()
    {
        if((i + LimitSize) > totalRecs)
            return true;
        else
            return false;
    }
    

}
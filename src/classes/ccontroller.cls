public class ccontroller
{  
    
    public string getid{get;set;}
    public string currid{get;set;}
    public List<wAttachment> listWrappAtt {get; set;}
    public string searchstring {get;set;}
    public list <wAttachment> acc {get;set;} 
    public integer totalRecs = 0;
    public integer i = 0;
    public integer LimitSize=5 ;   
    public string name='';
    public string Email=''; 
    
    
    public class wAttachment
    {
        public Contact att {get; set;}
        public Boolean selected {get; set;}
        public wAttachment(Contact a) 
        {
            att = a;
            selected = false;
        }
    } 
    
    
    
    public ccontroller() 
    {  
        currid=ApexPages.CurrentPage().getparameters().get('id');
        totalRecs = [select count() from contact where accountid=:currid]; 
        system.debug(totalRecs);
        listWrappAtt=new List<wAttachment>();
        List<contact> newlist= [select id,account.name ,name ,Email from contact where accountid=:currid LIMIT :LimitSize OFFSET :i];
        system.debug(newlist);
        if(newlist.size()>0)
        {
            for(Contact at :newlist)
                
            {
                listWrappAtt.add(new wAttachment(at));
                system.debug(listWrappAtt);
            }
            
            
        } 
    }
    
    Public PageReference Deletec()    
    {
        List<contact> ll = [SELECT Id FROM contact
                            WHERE Id =:getid];
        Delete ll;
        PageReference curPage = Page.allcontacts;
        curPage.getParameters().put('id',currid);
        curPage.setRedirect(true);
        return  curPage; 
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
        listWrappAtt=new List<wAttachment>();
        List<contact> newlist= [select id,account.name ,name ,Email from contact where accountid=:currid LIMIT :LimitSize OFFSET :i];
        system.debug(newlist);
        if(newlist.size()>0)
        {
            for(Contact at :newlist)
                
            {
                listWrappAtt.add(new wAttachment(at));
                system.debug(listWrappAtt);
            }
            
            
        }
        
    }
    public void previous()
    {
        i = i-LimitSize;
        listWrappAtt=new List<wAttachment>();
        
        List<contact> newlist= [select id,account.name ,name ,Email from contact where accountid=:currid LIMIT :LimitSize OFFSET :i];
        system.debug(newlist);
        if(newlist.size()>0)
        {
            for(Contact at :newlist)
                
            {
                listWrappAtt.add(new wAttachment(at));
                system.debug(listWrappAtt);
            }
            
            
        }
        
    }
    public void next()
        { i = i + LimitSize; 
         system.debug('next'+searchstring+searchstring.length());
         listWrappAtt=new List<wAttachment>(); 
         List<contact> newlist = new List<Contact>();
         
         if(searchstring!=null && searchstring.TRIM()!='' && searchstring.length()>0) 
             
         {     
             newlist= [select id,Name,account.Name ,Email from contact where accountid=:currid AND  (Name=:searchstring OR Email=:searchstring) LIMIT :LimitSize OFFSET :i];         
         }
         else 
         {        
             newlist= [select id,account.name ,name ,Email from contact where accountid=:currid LIMIT :LimitSize OFFSET :i];
             
         }
         
         if(newlist.size()>0)
         {
             for(Contact at :newlist)
                 
             {
                 listWrappAtt.add(new wAttachment(at));
                 system.debug('2nd>>>>'+listWrappAtt);
             }
             
         }
    }
    public void LastPage()
    {
        i = totalrecs-math.mod(totalRecs,LimitSize);
        
        List<contact> newlist= [select id,account.name ,name ,Email from contact where accountid=:currid LIMIT :LimitSize OFFSET :i];
        system.debug(newlist);
        if(newlist.size()>0)
        {
            for(Contact at :newlist)
                
            {
                listWrappAtt.add(new wAttachment(at));
                system.debug(listWrappAtt);
            }
            
            
        }
        
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
    
    public PageReference deleteall()
    {
        
        List<Contact> lstAttToDelete = new List<Contact>();
        
        for(wAttachment wAtt: listWrappAtt) 
        {
            if(wAtt.selected  == true)
            {
                lstAttToDelete.add(wAtt.att);
                
            }
        } 
        
        if(lstAttToDelete.size() > 0 )
        {
            Delete lstAttToDelete;
        }
        
        PageReference curPage = Page.allcontacts;
        curPage.getParameters().put('id',currid);
        curPage.setRedirect(true);
        return  curPage;        
        
    }
    public void search()
    {  
        // string searchquery='select id,Name,account.Name ,Email from contact where accountid=:currid AND  (Name=:searchstring OR Email=:searchstring)';  
        //acc= Database.query(searchquery);  
        
        listWrappAtt=new List<wAttachment>(); 
        List<contact> newlist= [select id,Name,account.Name ,Email from contact where accountid=:currid AND  (Name=:searchstring OR Email=:searchstring) LIMIT :LimitSize];
        system.debug(newlist);  
        if(newlist.size()>0) 
        {
            for(Contact at :newlist)
                
            {
                listWrappAtt.add(new wAttachment(at));
                system.debug(listWrappAtt);
            }
            
            
        }
    }  
    public void clear()
    { 
          try{
            listWrappAtt.clear();  
        }
        catch(Exception e){
            
        }  
    }  
    
    
}
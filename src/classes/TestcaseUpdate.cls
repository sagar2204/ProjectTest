@isTest

public class TestcaseUpdate {
    @isTest static void CaseUpdation()
    {
     List<case> newlist=new List<case>();
     Test.startTest();
     try{
         case a= new case();
         a.Status='New';
         Insert a;
         
         Case c= new case();
         c.id=a.id;
         c.Status='Closed';
         newlist.add(c);
         update newlist;
     }
     catch(Exception e)
     { String message = e.getMessage();
       system.assert(message.contains('child cases should be closed before closing parent case'), 'message=' + message);      
      
     }
     
     Test.StopTest();
    }
    
}
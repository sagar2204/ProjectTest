@isTest
public class closecasesTest {
    @isTest Static void testdata()
    {   List<case> parentcase =new List<Case>();
     
     case c= new case();
     c.AccountId=c.Accountid;
     c.Priority='high';
     c.Status='New';
     c.Origin='phone';
     c.recordtypeid=Schema.SObjectType.Case.getRecordTypeInfosByName().get('Escalating').getRecordTypeId();  
     Insert c;  
     
     Case cc=new case();
     cc.parentid=c.id;
     cc.Status='New';
     cc.Origin='phone';
     Insert cc;
     
     system.debug('related child'+cc);
     for(case c1:[Select id,status from case where id=:c.id])
     {
         case newcase=new case();
         newcase.id=c1.id;
         newcase.status='Closed';
         parentcase.add(newcase);
     }
     
     update  parentcase;
     system.debug('ParentCase'+parentcase);
     
     CaseStatusUpdate.Closecase(parentcase);
     
    }
}
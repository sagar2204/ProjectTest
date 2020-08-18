@isTest
public class TestAggreement {
    @isTest static void Tester()
    { List<Aggreement__c> L1=new List<Aggreement__c>();
     
       Dealer__c D1=new Dealer__c(Name='Zoho');
         insert D1;
       company__c c1=new Company__C(Name='Infosys',TotalNoofEmployeeAvailable__c=5100);
         Insert C1;
       Test.startTest();
       Aggreement__c a=new Aggreement__c(Name='Agg1',NofemployeeAssigned__c=100,Company__c=c1.Id,Dealer__c=D1.id);
     
         insert a; 
       L1.add(a);
     
      AggreementHandler.Agg(L1,null);
      AggreementHandler.Agg1(null,L1);
        
        
       
        
    }
}
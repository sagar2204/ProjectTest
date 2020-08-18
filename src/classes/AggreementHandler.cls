public class AggreementHandler
{
 Public static void Agg(List<Aggreement__c> sagar,List<Aggreement__c> ss)
 { 

    set<ID> IDS=new set<ID>();
    List<Company__c> ll=new List<Company__c>();
    List<Dealer__c> L2=new List<Dealer__c>();

   
    for(Aggreement__c a1:sagar ) 
        {
            IDS.add(a1.id);
        }

    system.debug('Ids are'+IDS);
  
    
     List<Aggreement__c> newList=[Select id,NofemployeeAssigned__c,company__r.id,company__r.TotalNoofEmployeeAvailable__c,Dealer__r.NofEmployeeCurrWorking__c from Aggreement__c where id in:IDS ];
     system.debug(newlist);
     for(Aggreement__c cc:newList)
    {      
             
             Decimal temp =cc.Company__r.TotalNoofEmployeeAvailable__c-cc.NofemployeeAssigned__c;
             system.debug(temp);
             if(cc.Dealer__r.NofEmployeeCurrWorking__c!=null)
             {   Decimal temp1=cc.Dealer__r.NofEmployeeCurrWorking__c;
                 ll.add(new Company__c(id = cc.Company__r.id , TotalNoofEmployeeAvailable__c=temp));
                 L2.add(new Dealer__c (id=cc.Dealer__r.id, NofEmployeeCurrWorking__c= temp1 + cc.NofemployeeAssigned__c));
              system.debug(temp1);
              }
             else
                 L2.add(new Dealer__c (id=cc.Dealer__r.id, NofEmployeeCurrWorking__c=cc.NofemployeeAssigned__c));
        
  
    }
     
    update ll; 
    Update L2;
    system.debug(ll);

}

    
    
       Public static void Agg1(List<Aggreement__c> sagar,List<Aggreement__c> ss)
 { 

    set<ID> IDS=new set<ID>();
    List<Company__c> ll=new List<Company__c>();
    List<Dealer__c> L2=new List<Dealer__c>();

    
    for(Aggreement__c a1:ss) 
        {
            IDS.add(a1.id);
        }

     system.debug('Ids are'+IDS);

     List<Aggreement__c> newList=[Select id,NofemployeeAssigned__c,company__r.id,company__r.TotalNoofEmployeeAvailable__c,Dealer__r.NofEmployeeCurrWorking__c from Aggreement__c where id in:IDS];
     system.debug(newlist);
     for(Aggreement__c cc:newList)
    {       
             if(cc.NofemployeeAssigned__c!=null && cc.Dealer__r.NofEmployeeCurrWorking__c!=null)
             {
             Decimal temp =cc.Company__r.TotalNoofEmployeeAvailable__c+cc.NofemployeeAssigned__c;   
             Decimal temp1=cc.Dealer__r.NofEmployeeCurrWorking__c-cc.NofemployeeAssigned__c;
             ll.add(new Company__c(id = cc.Company__r.id ,TotalNoofEmployeeAvailable__c=temp));
             L2.add(new Dealer__c (id=cc.Dealer__r.id, NofEmployeeCurrWorking__c=temp1 )); 
             system.debug(temp);
             }
          
    }
     
    update ll; 
    Update L2;
  //  a072v00001AinTUAAZ

}

 
 
}
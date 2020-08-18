public class OPPtriggerhandler{


 public static void AfterInsert(List<opportunity> TriggerNew)
 {
     opptriggerhelper.Cars(TriggerNew);       
 }
 public static void afterUpdate(List<opportunity> TriggerOld, List<opportunity> TriggerNew)
{ 
    opptriggerhelper.cars(TriggerNew);
}    
    
public static void beforeDelete(){
}

public static void afterInsert( ){
}



public static void afterDelete(){
}
}
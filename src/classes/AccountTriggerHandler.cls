public class AccountTriggerHandler{

public static void beforeInsert(List<Account> TriggerNew)
{
 AccountTriggerHelper.cloneShippingPostalCode(TriggerNew);

}
public static void beforeUpdate(List<Account> TriggerNew , List<Account> Triggerold)
{
  AccountTriggerHelper.cloneShippingPostalCode(TriggerNew);
}
 public static void AfterInsert(List<Account> TriggerNew)
{
  AccountTriggerHelper.Cars(TriggerNew);          
}
        
    
public static void beforeDelete()
{
}

public static void afterUpdate(List<Account> TriggerOld, List<Account> TriggerNew)
{ AccountTriggerHelper.cars(TriggerNew);
}

public static void afterDelete()
{
}
}


// new comment added here 
@isTest
Private class TestRestrictContactByName 
{
    @isTest static void testinvalidcontact()
    {
        Test.startTest();
        try
        {
            contact con=new contact(Lastname='INVALIDNAME');
            INSERT con;
            
        }
        catch(Exception ex)
        {
           Boolean b =  ex.getMessage().contains('INVALIDNAME') ? true : false; 
            system.assertEquals(b,true);
        }
        Test.stopTest();
    }
    
    
}
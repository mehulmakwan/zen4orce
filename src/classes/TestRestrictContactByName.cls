@isTest
PRIVATE class TestRestrictContactByName 
{
    @isTest static void Test(){
        List<Contact> L = new List<Contact>();
            
        Contact cct = new Contact(FirstName='Mehul', LastName='INVALIDNAME');
        L.add(cct);
        
        // Perform test
        Test.startTest();
        insert L;	
        Test.stopTest();
    }

}
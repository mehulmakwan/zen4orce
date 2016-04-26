public class RandomContactFactory 
{
    public static List<Contact> generateRandomContacts(Integer numcts, String lname) 
    {
        List<Contact> accts = new List<Contact>();
        
        for(Integer i=0;i<numcts;i++) 
        {
            Contact a = new Contact(FirstName='Test' + i, LastName = lname);
            accts.add(a);
        }
        insert accts;
        
     
        // Insert all opportunities for all accounts
        
        return accts;
    }

}
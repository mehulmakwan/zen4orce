@isTest
public class leadCloneTestClass 
{
    // Verify that lead status has been updated
    @isTest static void checkClone() 
    {
       
        try{
                Lead l = new Lead(email = 'testclass1@gmail.com',
                          phone = '2122334455',
                          FirstName = 'Naval',
                          LastName = 'Makwana', 
                          Company = 'xyzz', 
                          Status = 'Open - Not Contacted' );
                insert l;
                
                List<Lead> clon = [select Id, status, LastName from Lead where Status = 'Working - Contacted' AND LastName =: l.LastName];
            System.debug('check 232323 -------->' + clon);    
            System.debug('check -------->' + clon[0].Status);
                System.assertEquals(clon[0].Status, 'Working - Contacted');
           }
        
           catch(DmlException e)
           {
               System.Assert(e.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'), true);
           }
    } 
}
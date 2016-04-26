public class ContactAndLeadSearch 
{
    public static List<List< SObject>> searchContactsAndLeads(string Fn)
    {
      // List<List< SObject>> searchList = new  List<List<SObject>>();
            
            return  [FIND :Fn IN ALL FIELDS
           RETURNING Contact(FirstName,LastName),lead(FirstName,LastName)];
      //System.debug(searchList);
      //  return searchList;
				
    }
    

}
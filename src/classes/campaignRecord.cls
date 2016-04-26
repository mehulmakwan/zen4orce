//Write a SOQL Query on to retrieve/print 10 Campaign records and sort in ascending
//as well as descending order.

public class campaignRecord 
{
    public static void campaigns()
    {
        
        List<Campaign> cmp = new List<Campaign>([SELECT Id,Name FROM Campaign ORDER BY Name DESC LIMIT 10]);
       /*cmp.sort();
        for (Campaign c : cmp)
        {
            System.debug(c);
        }  */
        
        
        
    }

}
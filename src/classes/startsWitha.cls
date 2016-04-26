//Find all the Account Names starting with ‘a’. Print that count and update all those
//accounts with New Name as ‘Updated via update DML operation’.

public class startsWitha 
{
    public static void updatedml()
    {
        List<Account> abc = new List<Account>();
        abc = [SELECT Id,Name FROM Account WHERE Name LIKE 'a%'];
        
        for(Account i : abc)
        {
            System.debug(i);
        }
    }

}
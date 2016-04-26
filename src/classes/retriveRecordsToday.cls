//Write a SOQL query to retrieve/print the Account records where Created Date = Today

public class retriveRecordsToday 
{
    public static void retrive()
    {
        List<Account> AccountList = new List<Account>();
        AccountList = [SELECT ID,Name FROM Account where CreatedDate = Today];
        
        for(Account i : AccountList)
        {
            System.debug(i);            
        }
        
    }

}
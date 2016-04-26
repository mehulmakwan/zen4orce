public class childParentRelationship 
{
    public static void relationship()
    {
        List<Account> abc = new List<Account>();
        List<Contact> xyz = new List<Contact>();
        
        abc = [SELECT id FROM Account];
        xyz = [SELECT Accountid,FirstName FROM Contact];  
        
        for(Account i : abc)
        {
            for(Contact j : xyz)
            {
                if(i.Id == j.AccountID)
                System.debug(j.FirstName);
            }
        }
       
    }

}
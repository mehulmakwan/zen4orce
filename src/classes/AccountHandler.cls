public class AccountHandler 
{
    
    public static Account insertNewAccount(String company)
    {
        // Create the account sObject
        try{
        Account acct = new Account(Name=company);
        
        // Insert the account by using DML
        
    	insert acct;
        //Database.SaveResult[] srList = Database.insert(acct, false);

            //System.debug(acct);
            return acct;
        
        }catch(Exception e){
            System.debug(Null);
            return NULL;
        }
    }

}
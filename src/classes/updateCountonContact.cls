public class updateCountonContact 
{
        public static void AccountManipulation(){
    	Account acct = new Account(Name='Zen4orce1');
    	insert acct;

        ID acctID = acct.Id;
        Contact ct = new Contact(FirstName='Mehul',LastName='Zen',Phone='798465132', AccountId = acctID);
        insert ct;
        
        List<Contact> contactList = new List<Contact>([Select Id, Name from Contact where Account.Name = 'Zen4orce1']);
        acct.Contact_Count__c = contactList.size();
        
        update acct;
        
    }

}
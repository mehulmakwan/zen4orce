public class ContactSearch {
    
    public static List<Contact> searchForContacts (string a , string b)
    {
        List<Contact> cts = new List<Contact>();
        cts = [select name from contact where lastname =: a AND MailingPostalCode =: b];
        return cts;
    }

}
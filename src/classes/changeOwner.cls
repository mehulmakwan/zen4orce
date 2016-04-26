public with sharing class changeOwner 
{
	public static void changeowners(List<Account> oldlist , List<Account> newlist)
    {
          Set<Id> accountids=new set<Id>();
          map<Id, String> oldOwnerIds = new map<Id, String>();
          map<Id, String> newOwnerIds = new map<Id, String>();
          list<Contact> contactsupdate=new list<Contact>(); 
        
           for(Account acc:newList)
           {
               for(Account A1 : oldList)
               {
                if(acc.OwnerId!=A1.OwnerId)
                  {
                     oldOwnerIds.put(acc.Id, A1.OwnerId);
                     newOwnerIds.put(acc.Id, acc.OwnerId);
                     accountids.add(acc.Id); 
                  }
               }
           }
          if(!accountids.isEmpty())
          {
           list<Account> acc=new list<Account>([SELECT Id,(SELECT Id,OwnerId from contacts)from Account where Id in:accountids]);
               for(Account a:acc)
               {
                    String newOwnerId=newOwnerIds.get(a.id);
                    String oldOwnerId=oldOwnerIds.get(a.id);
                    for(Contact c: a.Contacts)
                    {
                         if(c.OwnerId==oldOwnerId)
                         {
                              Contact UpdatedContact=new Contact(Id=c.Id, OwnerId=newOwnerId);
                              contactsupdate.add(UpdatedContact);
                         }
                    }
                }	
      		}
      		update contactsupdate;
    }


}
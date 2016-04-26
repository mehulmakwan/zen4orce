@isTest
public class ownerChangeTest 
{
     @isTest static void testchangeowner()
    {
        List<Account> a=new List<Account>([select id,OwnerId from account where Id='0012800000LeiQm']);
      	Contact c=new Contact(LastName='Tclass', 
                              AccountId='0012800000LeiQm');
     	insert c;
        try{           																
            c.OwnerId='00528000002V810';
            update c;
            
            String aow=a[0].OwnerId;
            String cowner=c.OwnerId;
            boolean flag=aow.equals(cowner);
  			System.assert(flag, true);
        }
        catch(DMLException e)
        {
            System.assertEquals(e.getMessage().contains('Record is already exist..'),true);
        }
        
    }   
}
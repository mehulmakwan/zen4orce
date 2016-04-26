public class day1_A1 
{
    public static void accountRecord()
    {
        List<Account> abc = new List<Account>([select ID,Name, phone,Rating from Account]);
        System.debug('Using Advance FOR Loop');
        for(account a : abc)
        {
            System.debug(a);
        }
        
        System.debug('Using Traditional FOR Loop');
        for(integer i=0;i<abc.size();i++)
        {
            System.debug(abc[i]);
        }
        integer i =1;
        System.debug('Using Traditional While Loop');
        while(i < abc.size())
        {
            System.debug(abc);
            break;
        }
    }
}
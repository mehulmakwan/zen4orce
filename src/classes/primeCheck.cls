public class primeCheck 
{
    public static void pc(integer num)
    {
        integer temp;
		boolean isPrime=true;
        
        for(integer i=2;i<=num/2;i++)
        {
           temp=math.mod(num,i);
           if(temp==0)
           {
              isPrime=false;
              break; 
           }
        }
        //If isPrime is true then the number is prime else not
        if(isPrime)
           System.debug(num + ' is Prime Number');
        else
           System.debug(num + ' is not Prime Number');
    }
        
}
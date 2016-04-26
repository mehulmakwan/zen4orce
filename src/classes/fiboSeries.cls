public class fiboSeries 
{
    public static void fibonacci(integer count)
    {
       integer n1=0,n2=1,n3;
       System.debug(n1+' '+n2);		//printing 0 and 1   
        
       for(integer i=2;i<count;++i)		
       {    
          n3=n1+n2;    
          System.debug(' '+n3);    
          n1=n2;    
          n2=n3;    
       }    
    }
}
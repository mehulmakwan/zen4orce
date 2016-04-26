public class EvenOdd 
{
    public static void checkEvenOdd(integer a)
    {
        integer y = a/2;
		integer z = y * 2;
        if(z == a)
            System.debug(a + 'Number is Even');
        else
            System.debug(a + 'Number is Odd');
    }
    ////////// Dynamic Array Program ////////////
    public static void arrayInt(integer a)
    {
        integer[] arr = new integer[a];
        for(integer i=0;i<a; i++){
            arr[i]=i;
        }
        for(integer i : arr)
            System.debug(i);
    }

	////////// Array Oprations ////////////
	
    public static void arrayOperation(integer[] a)
    {
        for(integer i=0; i<a.size(); i++)
        {
            for(integer j=0;j<i;j++)
            {
                if(a[i]<a[j])
                {
                integer temp = a[i];
                		a[i] = a[j];
                        a[j] = temp; 
                }		
            }
        }
        System.debug('Assending Order :' + a); 
        
        /// Decending Logic
        for(integer i=0; i<a.size(); i++)
        {
            for(integer j=0;j<i;j++)
            {
                if(a[i]>a[j])
                {
                integer temp = a[i];
                		a[i] = a[j];
                        a[j] = temp; 
                }		
            }
        }
        System.debug('Desending Order :' + a); 
        
        //// Print Maximum
        System.debug('Maximum Number :' + a[0]);
        //// Print Mainimum
        System.debug('Minimum Number :' + a[a.size()-1]);
        
        //// Print Duplicate
        Integer len=a.size();
		for(Integer i=0;i<len;i++)
		{
			Integer cnt=1;
			for(Integer j=i+1;j<len;j++)
			{
                if(a[i]==a[j])
				{
					i++;
                    cnt++;
				}
			}
            system.debug(a[i] +':'+ cnt);
        }
    }
    // ------ output arrayoperation ------//
    // EvenOdd.arrayOperation(new Integer[]{2,2,3,4,4,5});
   
    
   // zero to parameter number
   public static void sum(integer a)
   {
       integer total=0;
       for(integer i=0;i<=a;i++)
       {
            total = total + i;
       }
	System.debug(total);
   }

	public static void simpleInterest(double p,double r,double t)
	{
		double i=(p*r*t)/100;
		system.debug('Interrest Amount '+i);
	}
    
    // Demo of Constructor
    public EvenOdd()
    {
        System.debug('I am Inside Constructor ');
    }
    
    // Calculator 
    
    public static void calculator(String a, integer b, integer c)
    {
        integer result;
        if(a == 'SUM')
        {
            result = (b+c);
        }
        if(a == 'SUB')
        {
            result = (b-c);           
        }
        if(a == 'MUL')
        {
            result = (b*c);        
        }
        if(a == 'DIV')
        {
            result = (b/c);
        }
        System.debug('Result is : ' + result);
    }
 	// ------------- End of Class --------------   
}
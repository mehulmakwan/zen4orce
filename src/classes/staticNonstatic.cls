public class staticNonstatic 
{
    public static void test()
    {
        System.debug('I am Static method');
    }
    
    public void nonStatic()
    {
        test();
        System.debug('I am Non - Static method');
    }

}

// ---------- Output ------------ //
// staticNonstatic A = new staticNonstatic();
//A.nonStatic();
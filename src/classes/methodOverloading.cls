public class methodOverloading 
{
    public static void over(integer i)
    {
        System.debug(i);
    }
    public static void over(integer i, String s)
    {
        System.debug(i + ' ' + s);
    }
    public static void over(integer i,integer j, String s)
    {
        System.debug(i + ' ' + j + ' ' + s);
    }

}


// ------ Output ---------//
// methodOverloading.over(5,7, 'Mehul');
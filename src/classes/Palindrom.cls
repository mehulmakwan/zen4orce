public class Palindrom 
{
    public static void cp(String str)
    {
        
        String revStr = str.reverse();
        if (str.equalsIgnoreCase(revStr)) {
            System.debug('string is a Palindrome');
        } else {
            System.debug('string is not a Palindrome');
        }
    }

}
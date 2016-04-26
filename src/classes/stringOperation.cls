public class stringOperation 
{
    public static void sop()
    {
        System.Debug('Welcome to @pex Programming');
        String s1 = 'Welcome to @pex Programming';
        String s2 = s1.replace('@', 'A');
        System.debug('Replaced String is : '+ s2);
        
        // Substring
        System.debug('Substring is :'+ s2.substring(11));
        
        // Remove Spaces
        System.debug('Without Space : ' + s1.deleteWhitespace());
        
        //Upper Case
        System.debug('All Upper case :' + s2.toUpperCase());
        
        //Lower Case
        System.debug('All Lower case :' + s2.toLowerCase());
    }
    
    public static void occurrence(String S)
    {
        integer c=0;
        string[] arr = S.split('');
        for(integer i=0; i<arr.size();i++)
        {
            c++;
        }
            System.debug(c);
        
    }

}
public class uniqueID 
{
    public void Distinct( List<integer> A ) 
    {
        Set<Integer> set1 = new Set<Integer>();

        set1.addall(A);
   		
        System.debug('Unique number is: '+ set1);
    }

}

 // ----------------------- Output ------------- //
 /* uniqueID u = new uniqueID();
List<Integer> xc = new List<Integer>{4,4,5,7,9,5,8,4,6};
u.Distinct(xc); */
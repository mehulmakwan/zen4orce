public virtual class Calculation 
{
    integer z;
    public void Add(integer a, integer b)
    { 
        z=a+b;
        System.debug('Addition is: ' + z);
    }

}
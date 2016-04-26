public class abstractChild extends myAbstractClass
{  
	public override void m3() // the abstract method declared in child class using override but object is created in child class only.
    {
        System.debug('I am in abstractChild: m3 ');
	}
}
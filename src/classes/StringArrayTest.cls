public with sharing class StringArrayTest {
	
	public static list<String> generateStringArray (integer n)
	{
		List<String> testadd = new List<String>();
		
			for(integer i=0 ; i<n ; i++)
			{
				testadd.add('Test '+i);
			
			}
		//System.debug(testadd);
		return testadd;
		
	}

}
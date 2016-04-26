public with sharing class SecondPage 
{
	private final UT_Transaction__c ut;
	
	public SecondPage(ApexPages.StandardController stdController)
    {
	 ut.Transaction_Type__c = 'Redemption(Switch out)';
     upsert ut;
	
	}
}
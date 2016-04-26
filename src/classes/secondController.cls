public class secondController 
{
    private ApexPages.StandardController stdController ;
    public UT_Transaction__c u ;
    public string str;
    public string flag{get;set;}
   
   
	public  secondController(ApexPages.StandardController stdController)
	{
        this.u = (UT_Transaction__c)stdController.getRecord();
        this.stdController = stdController;
     	system.debug(u);
        str = ApexPages.currentPage().getParameters().get('str');
        flag = ApexPages.currentPage().getParameters().get('flag');
        this.u.Transaction_Type__c = str;
        system.debug('Constructor');               
	}
}
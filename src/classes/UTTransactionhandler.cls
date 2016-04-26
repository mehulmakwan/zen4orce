public class UTTransactionhandler 
{
    private ApexPages.StandardController stdController;
    public  UT_Transaction__c UTT;
    public UT_Fund__c Fundobj;
    public String str{get;set;}
    public String flag1{get;set;}
    public string fundcurrency;
    public String fname;
    PageReference pg;
   
    public UTTransactionhandler(ApexPages.StandardController stdController)
    {
        this.UTT=(UT_Transaction__c)stdcontroller.getRecord();
        this.stdController= stdController; 
        flag1=ApexPages.currentPage().getParameters().get('flag');
    }
    
   public PageReference Save()
   {
      String var = null;
      insert UTT;
      String meh=UTT.UT_Fund_Name__c;
      Fundobj=[select id,Cut_off_Time__c,Currency__c from UT_Fund__c where id=:meh];
       
       UTT.Currency1__c=Fundobj.Currency__c;
       update UTT;
       
     	if(Fundobj.Cut_off_Time__c < System.now())
     		{
     	  		var='true';
       		} 
       String var1 = UTT.Transaction_Type__c;
       var = 'true';
      if(var1 != 'Purchase'||var1 != 'Redemption')
      {
        pg=new PageReference('/apex/UTpage1');
      }
       
       pg=new PageReference('/apex/UTpage2');
         pg.getParameters().put('str',var1);
         pg.getParameters().put('flag',var);     
         pg.setRedirect(true);
         return pg;
    }
}
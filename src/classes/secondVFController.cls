public class secondVFController {
   private ApexPages.StandardController stdController;
   public  UT_Transaction__c UTT;
   public String str;
   public String flag{get;set;}
    
   public secondVFController(ApexPages.StandardController stdController)
   {
        this.UTT=(UT_Transaction__c)stdcontroller.getRecord();
        this.stdController= stdController; 
        string trasType = ApexPages.CurrentPage().getParameters().get('str');
        flag=ApexPages.currentPage().getParameters().get('flag');
        System.debug('flag value'+flag);
        system.debug('Transaction Type'+trasType);
            if(trasType=='Purchase (switch In)') 
            {
                UTT.Transaction_Type__c='Redemption (Switch Out)';
            }
            else if(trasType=='Redemption (Switch Out)')
               {
                   UTT.Transaction_Type__c='Purchase (switch In)';
               }
            else
               {
                   UTT.Transaction_Type__c=trasType;
               }
            }
        
            public PageReference Save()
            {
                  upsert UTT;
                return  new ApexPages.StandardController(UTT).view();
            }
   
}
public with sharing class UtTransaction 
{
    private final  UT_Transaction__c u;
    private ApexPages.StandardController controller;
    private final string ide ;
    public  string flag{get;set;} 
    public string var{get;set;}
        public UtTransaction(ApexPages.StandardController controller)
        {
            this.controller = controller;
            this.u = (UT_Transaction__c)controller.getRecord();
            system.debug('In Constructor');
            ide = u.Id;
        
        }
  		public PageReference Save()
        {
            insert u;  
            var = null;
            PageReference pr;
            
                        UT_Fund__c fund = new  UT_Fund__c();
                        id num = u.id;
                      
                        fund = [SELECT id,Name,Cut_off_Time__c,Currency__c FROM UT_Fund__c WHERE id =: num];
            			u.Currency1__c = fund.Currency__c;
            			update u;
            
                        if(fund.Cut_off_Time__c < System.today())
                        {
                             flag = 'True';   
                        }
                        else
                        { 
                            flag = 'False';
                        }
            var = u.Transaction_Type__c;
            
            if(var != 'Purchase' || var != 'Redemption')
            {
                pr = new PageReference('apex/TransactiontypeForNormal');
                
            }
         	pr = New PageReference('/apex/ut');
            pr.getParameters().put('str',var);
            pr.getParameters().put('flag',flag);                    
            pr.setRedirect(true);   
            system.debug(pr);
            return pr;          
            
        }
       
          
          
                
}
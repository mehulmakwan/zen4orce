@isTest
public class InvoiceFirstTestClass 
{
	 public static testMethod void invoicegen()
     {
        //INSERTING SAMPLE DATA
        Date firstDayOfMonth = date.newInstance(2016,4,1);
    	Date lastDayOfMonth = date.newInstance(2016,4,30);
         
      	Account acc = new Account();
		acc.Name = 'TEST CLASS';
		insert acc;
        
        Contact cn = new Contact();
        cn.LastName = 'APEX TEST';
        insert cn;
        Project__c prj = new Project__c (Name = 'PRJ ONE', 
        								 Account__c = acc.Id,
                                         Start_Date__c = firstDayOfMonth,
                                         End_Date__c = lastDayOfMonth);
        
        Project__c prj1 = new Project__c(Name = 'PRJ TWO',
        								 Account__c = acc.Id,
                                         Start_Date__c = firstDayOfMonth,
                                         End_Date__c = lastDayOfMonth);
        
        Project__c prj2 = new Project__c(Name = 'PRJ THIRD',
        								 Account__c = acc.Id,
                                         Start_Date__c = firstDayOfMonth,
                                         End_Date__c = lastDayOfMonth);
        insert prj;
        insert prj1;
        insert prj2;
         
        Time_Entrie__c te = new Time_Entrie__c();
        te.Name = 'TEST CLASS ENTRY';
        te.Project__c = prj.Id;
        te.Contact__c = cn.Id;
        insert te;
         
        //CALLING CONTROLLER SEARCH METHOD
        Invoice__c inv = new Invoice__c(Account__c = acc.Id,
                                        Invoice_Start_Date__c = firstDayOfMonth,
                                        Invoice_End_Date__c = lastDayOfMonth
                                        );
        InvoiceGenerationController controller = new InvoiceGenerationController(new ApexPages.StandardController(inv));   
        controller.search();
        System.assertEquals(3, controller.wrap.size());
        
        controller.wrap[0].isselected = TRUE;
        //CALLING CONTROLLER GENRATE METHOD
        controller.genrateinvoice();
        System.assertEquals(1, controller.addLineItem.size());
        System.assertEquals(1, controller.addedInvoice.size());
        
     }
}
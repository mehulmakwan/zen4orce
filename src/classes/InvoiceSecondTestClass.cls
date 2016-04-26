@isTest
public class InvoiceSecondTestClass 
{
    public static testMethod void secondmethod()
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
        insert prj;
        
        Time_Entrie__c	tim = new Time_Entrie__c(Name = 'TEST APEX',
                                                 Project__c = prj.Id,
                                                 Contact__c = cn.Id,
                                                Invoiced__c = FALSE);   
        insert tim;
        
        Time_Entrie__c	tim1 = new Time_Entrie__c(Name = 'TEST APEX1',
                                                 Project__c = prj.Id,
                                                 Contact__c = cn.Id,
                                                Invoiced__c = FALSE);   
        insert tim1;
        
        System.debug('query result : ' + [select id,Name,Invoiced__c,Project__c,Billable_Amount__c,Duration__c,Description__c,Date__c from Time_Entrie__c where Project__c=:prj.Id and Invoiced__c=:false]);
        //CONTROLLER
        InvoiceSecondController cont = new InvoiceSecondController(new ApexPages.StandardController(prj));  
        System.assertEquals('PRJ ONE', cont.prj.Name);
        
        cont.search();
        System.assertEquals(2, cont.teList.size());
        
        cont.generate();
        System.assertEquals(2, cont.InvLineList.size());
    }

}
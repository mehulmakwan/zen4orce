public class InvoiceTriggerHandler 
{
	public static void checkInvoice(List<Invoice__c> oldList)
    {
       
        List<Time_Entrie__c> te=new LIST<Time_Entrie__c>();
        for(Invoice__c i:oldList)
        {
            for(Time_Entrie__c tim:[select id,Name,Invoiced__c,Project__c from Time_Entrie__c])
            {
    			if(i.Project__c==tim.Project__c)   
                {
                    tim.Invoiced__c=false;
                    te.add(tim);
                }
            }
        }
        update te;
    
    }
}
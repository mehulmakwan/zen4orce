public class InvoiceSecondController 
{
    public Project__c prj;
    Date startDate;
    Date endDate;
    List<Time_Entrie__c> TimeEntry;
    
    public List<wprojects> teList{get;set;}
    public List<Time_Entrie__c> selectedte{get;set;}
    
    public List<Invoice_Line_Item__c> InvLineList;
    List<Invoice__c> InvList;
    
    //Constructor 
	public InvoiceSecondController(ApexPages.StandardController controller)
    {
        
    	this.prj=(Project__c)controller.getRecord();
		startDate = System.Date.today().toStartOfMonth(); 
		endDate = startDate.addMonths(1).addDays(-1);
        prj.Start_Date__c=startDate;
        prj.End_Date__c=endDate;
        
    }
    
    //Search Button
    public void search()
    { 
        teList  = new list<wprojects>();
        TimeEntry=new List<Time_Entrie__c>([select id,Name,Invoiced__c,Project__c,Billable_Amount__c,Duration__c,Description__c,Date__c 
                                            from Time_Entrie__c 
                                            where Project__c=:prj.Id and Invoiced__c=:false]);
  	        
    	    for(Time_Entrie__c t:TimeEntry)
        	{
        	   	teList.add(new wprojects(t));
        	}    
    }
    
    //Genrate Button
    public void generate()
    {
        selectedte=new List<Time_Entrie__c>();
        for(wprojects p1:teList)
        {
            if(p1.selected==true)
            {
                 selectedte.add(p1.te);
            }
        }
        
        InvLineList =new List<Invoice_Line_Item__c>();
        TimeEntry =new List<Time_Entrie__c>();
        
        List<Project__c> prj1=new List<Project__c>([select Account__c,Name,id from Project__c where id=:prj.Id]);
        
        Invoice__c invc = new Invoice__c(Name='Invoice for '+prj.Name,
                                         Invoice_Start_Date__c = startDate,
                                         Invoice_End_Date__c=endDate,
                                         Project__c=prj.Id,
                                         Account__c=prj1[0].Account__c);
        Insert invc;
		for(Time_Entrie__c t:selectedte)
            {
                if(invc.Project__c == t.Project__c && t.Invoiced__c == false)
                {
                    system.debug(t);
                    Invoice_Line_Item__c ilt=new Invoice_Line_Item__c(Name='Invoice '+t.Name,
                                                                      Invoice__c = invc.Id,
                                                                      Time_Entry__c = t.Id,
                                                                      Invoice_Hrs__c = t.Duration__c,
                                                                      Invoice_Amount__c = t.Billable_Amount__c,
                                                                      Description__c = t.Description__c,
                                                                      Entry_Date__c = t.Date__c);
                    t.Invoiced__c = true;
                    TimeEntry.add(t);
                    InvLineList.add(ilt);
                }
            }
        insert InvLineList;
        update TimeEntry;
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Invoice Generated Successfully.Thank you!'));
    }
    
    //Wrapper Class
    public class wprojects
    {
    	public Time_Entrie__c te{get; set;}
        public Boolean selected {get; set;}
        
       	public wprojects(Time_Entrie__c t) 
        {
           te = t;
           selected = true;
        }
    }


}
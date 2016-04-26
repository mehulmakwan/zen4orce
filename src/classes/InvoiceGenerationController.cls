public class InvoiceGenerationController 
{
    public final Invoice__c Inv;
    public Date firstDayOfMonth;
    public Date lastDayOfMonth;
    //public List<Invoice__c> wraplist {get; set;} 
	public List<wrapprj> wrap = new list<wrapprj>(); 
    public list<Invoice__c> addedInvoice = new list<Invoice__c>();
    list<Project__c> project = new list<Project__c>();    
    
    list<Time_Entrie__c> timeEntryList = new list<Time_Entrie__c>([select id,Name,Contact__c,Date__c,Description__c,Duration__c,Invoiced__c,Project__c from Time_Entrie__c]);
    list<Invoice_Line_Item__c> linei = new list<Invoice_Line_Item__c>();
    public list<Invoice_Line_Item__c> addLineItem = new list<Invoice_Line_Item__c>();
    list<Time_Entrie__c> teobj = new list<Time_Entrie__c>();
    
	//Constructor 
    public InvoiceGenerationController(ApexPages.StandardController controller)
    {
        this.Inv = (Invoice__c)controller.getRecord();
        
        
        
        firstDayOfMonth = System.today().toStartOfMonth();
        lastDayOfMonth = firstDayOfMonth.addDays(Date.daysInMonth(firstDayOfMonth.year(), firstDayOfMonth.month()) - 1);
        
        Inv.Invoice_Start_Date__c=firstDayOfMonth;
        Inv.Invoice_End_Date__c=lastDayOfMonth;
        
        System.debug('In side Constructor : ' + Inv.Account__c); 
    }
    
    //Search Button
    public void search() 
    {
      project = [select id, name,Account__c, Start_Date__c, End_Date__c, Total_Invoiced_Hrs__c, Total_Project_Hrs__c  from project__c where Account__c =: Inv.Account__c];
        System.debug('Project query is  >    '+ project);
           for(Project__c Pr: project)
           {  
               wrap.add(new  wrapprj(Pr));
           }
        	System.debug('Added to Wrap result here --> '+wrap);

	}
    
    //Genrate Button
    public void genrateinvoice()
    {
        list<Project__c> outputlist = new list<Project__c>();
        
        for(wrapprj obj: wrap)
        {
             if(obj.isSelected == true)
            {
                outputlist.add(obj.prj);
                System.debug(outputlist);
            }
        }
        
        for(Project__c pr : outputlist)
      	{
            Invoice__c invo = new Invoice__c();
        
            invo.Account__c = pr.Account__c;
            invo.Project__c = pr.id;
            invo.Invoice_Start_Date__c = pr.Start_Date__c;
            invo.Invoice_End_Date__c = pr.End_Date__c;    
            system.debug(invo);
            
            addedInvoice.add(invo);
            system.debug(addedInvoice);       
      	}
        insert addedInvoice;
        
        for(Invoice__c ins : addedInvoice)
        {
            for(Time_Entrie__c te : timeEntryList)
            {
                if((ins.Project__c == te.Project__c) &&  te.Invoiced__c == FALSE)
                {    System.debug('insid--> ' + ins.Id);
                    Invoice_line_item__c LI = new Invoice_line_item__c(
                    	Name = te.Name,
                        Invoice__c = ins.Id,
                    	Invoice_Hrs__c = te.Duration__c,
                    	Entry_Date__c = te.Date__c,
                    	Description__c = te.Description__c,
                    	Time_Entry__c = te.Id); 
                    addLineItem.add(LI);
                    te.Invoiced__c = TRUE;
                    teobj.add(te);
                }
                
            }
            insert addLineItem;   
            update teobj;
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Invoice Generated Successfully.Thank you!'));
        }
        
            
    }

    //Wrapper Class
    public class wrapprj
    {
        public Project__c prj{get; set;}
        public boolean isSelected{get; set;}
        
        public wrapprj(Project__c a)
        {
             this.prj=a;
             isselected=false;
    	}
    }
    
}
public class QueryBuilderController 
{
    public String selectedObject {get; set;}
    public List<SelectOption> objNames{get; set;}
    public List<String> selectedField {get; set;}
    public List<SelectOption> fieldNames {get;set;}
    public String Assce{get;set;}
    public String records{get;set;}
    public String radio{get;set;}
    public String message {get; set;}
 	public List<sObject> sobjList{get; set;}
    public List<SelectOption> addedFields{get; set;}
    public List<String> addFieldSelected{get; set;}
    public Map <String, Schema.SObjectType> schemaMap {get;set;}
        
    //Constructor 
    public QueryBuilderController()
    {    
     try{
         	fieldNames = new List<SelectOption>();
            schemaMap = Schema.getGlobalDescribe();
            records = ' ';Assce=' ';
            selectedObject = '- - - NONE - - -';
            selectedField = new List<String>();

                objNames = new List<SelectOption>();
                objNames.clear();
          		fieldNames.clear();
                List<String> objects = new List<String>(schemaMap.keySet());
                objects.sort();
                objNames.add(new SelectOption('- - - NONE - - -','- - - NONE - - -'));    
                for(String Name : objects)
                {
                    objNames.add(new SelectOption(Name,Name));
                }

        }
        catch(Exception e){
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'QueryBuilderController'));
        }
    } 
    
    //Getting Fields
    public pagereference populateFields(){
       
        System.debug('Populate Fields');
        System.debug('field null  check: ' + fieldNames);
        selectedField = new List<String>();
        fieldNames.clear();
        sobjList = new List<sObject>();
        addedFields = new List<SelectOption>();
         try{
                Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);
                
                Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
                
                for (String fieldName: fieldMap.keySet()) 
                {  
                    fieldNames.add(new SelectOption(fieldName,fieldName));
                }
         	}
        catch(Exception e)
        {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'getObjectFields'));
        }
       return null;
    }
    //Record Limit    
    public List<SelectOption> getrecordsOptions() 
    {
    	List<SelectOption> recordsOptions = new List<SelectOption>();
        try{
                recordsOptions.add(new SelectOption('LIMIT 500',String.valueOf(500)));
                recordsOptions.add(new SelectOption('LIMIT 1000',String.valueOf(1000)));
                recordsOptions.add(new SelectOption('LIMIT 5000',String.valueOf(5000)));
                recordsOptions.add(new SelectOption('LIMIT 50000',String.valueOf(50000)));
            }
        catch(Exception e)
        {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'getrecordsOptions'));
        }
        return recordsOptions;
    }
        
    //Radio Button
    public List<SelectOption> getradioOptions() 
    {
        List<SelectOption> radioOptions = new List<SelectOption>();           
        try{
                radioOptions.add(new SelectOption('ORDER BY ID ASC','ASC')); 
                radioOptions.add(new SelectOption('ORDER BY ID DESC','DESC'));  
           }
        catch(Exception e)
        {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'getradioOptions'));
        }
        return radioOptions;
    }
        
    //Auto-Load Textarea and Generating Query
    public pageReference add()
    {
        addedFields=new List<SelectOption>();
        //addFieldSelected.clear();
        addedFields.clear();
    	try{ 
            message = 'SELECT ';
			Integer count=1;            
            for(String so : selectedField)  
            {
            	if(count<selectedField.size())
                {
                	message += so;
                    message += ', ';
                }
                else
                {
					message += so;         
                }
                count++;
                addedFields.add(new SelectOption(so,so));
            }
            if(Assce == NULL)
            {
                message += ' ' + 'FROM'+ ' ' + selectedObject +' '+ records;
            }
            else
            {
                message += ' ' + 'FROM'+ ' ' + selectedObject + ' '+ Assce +' '+ records;
            }	
            System.debug('messgage = ' +message );   
   			
        }	
        catch(Exception e)
        {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'save'));
        }
        return Null;
    }
    
    //Execute Button
    public void execute()
    {
        try{
            sobjList = Database.query(message);
            System.debug('list size' + sobjList.size() );
            System.debug('object' + sobjList);
            if(sobjList != null || sobjList.size() == 0)
            {
                System.debug('NO RECORDS FOUND');
                ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.INFO,'NO RECORDS FOUND');
            	ApexPages.addMessage(errormsg);
                //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'No Records Found'));
            }
           }
        
        catch(Exception e)
        {
            System.debug('IN EXCEPTION');
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Execute Button'));
        } 
    }  
    
}
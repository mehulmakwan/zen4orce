public class objectController
{
    public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();

    public String selectedObject {get; set;}

    public String selectedField {get; set;}

    //constructor
    Public objectController()
    {   
        selectedObject = 'account';
    }

    
     public List<SelectOption> getObjectFields() 
     {
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
         
            Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);
         
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
            List<SelectOption> fieldNames = new List<SelectOption>();
            for (String fieldName: fieldMap.keySet()) 
            {  
                fieldNames.add(new SelectOption(fieldName,fieldName));
              //fieldMap.get(fieldName).getDescribe().getLabel();//It provides to get the object fields label.
            }
            return fieldNames;
      }       
}
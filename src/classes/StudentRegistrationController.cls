public class StudentRegistrationController 
{
    public Student__c stu;
    public string language{set; get;}
    
    public StudentRegistrationController(ApexPages.StandardController controller)
    {
        this.stu = (Student__c)controller.getRecord();
    }
	public PageReference save()
    {
       insert stu;
       ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Your admission application has been submitted successfully'));  
   	   return Null;  
    }
    public List<SelectOption> getlanguageOptions() 
    {
            List<SelectOption> languageOptions = new List<SelectOption>();
           
                languageOptions.add(new SelectOption('en_US','English'));
                languageOptions.add(new SelectOption('fr','French'));
                languageOptions.add(new SelectOption('es','Spanish'));
            
            return languageOptions;
    }
}
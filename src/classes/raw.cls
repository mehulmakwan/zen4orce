public class raw 
{
    public boolean showField {get; set;}

  	public List<SelectOption> getradioOptions() 
    {
        List<SelectOption> radioOptions = new List<SelectOption>();           
		radioOptions.add(new SelectOption('TRUE','TRUE'));       
        return radioOptions;
    }

}
public class queryLead 
{
      
    public void method()
    {
        
    Set<Lead> Leadset = new Set<Lead>();
    List<Lead> LeadList = new List<Lead>();
        
    LeadList = [SELECT ID FROM Lead];

    For(Lead acc : LeadList)
    {
  		Leadset.add(acc) ;
        
    }   
    System.debug(Leadset);
	}

}
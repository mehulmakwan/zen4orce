public class cmcontroller 
{
    public Campaign cmp;
    String sysID = '';
    //public string filterId {get; set;}
    public cmcontroller(ApexPages.StandardController controller)
    {
       this.cmp= (Campaign) controller.getRecord();
	   Id sysID1 = (Id) cmp.Id;
    	System.debug(this.sysID);

        
    }

}
public class CM_controller 
{
    public Campaign cmp;
      
    public CM_controller(ApexPages.StandardController controller)
    {
        this.cmp = (Campaign)controller.getRecord();
        System.debug('In side Constructor : ' + cmp);
        
    }
    public PageReference processButtonClick() 
    {
        cmp.Soft_delete__c = TRUE;
        update cmp;
        return null;
    }
}
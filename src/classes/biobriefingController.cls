public class biobriefingController 
{
    private final Biobriefing__c bob  ;
 
     public biobriefingController(ApexPages.StandardController controller)
      {   
         this.bob = (Biobriefing__c)controller.getRecord();  
     }
 
    public PageReference Save()
    {
     String fileId = '';
        List<Attachment> attachedFile = [SELECT Id,Name FROM Attachment where ParentId =: bob.id Order By LastModifiedDate DESC  LIMIT 1];
     
        if(attachedFile != null && attachedFile.size() > 0)
        {
            fileId = attachedFile[0].Id;
        }

        bob.link__c = '/servlet/servlet.FileDownload?file='+fileId;
     upsert bob;
     return  new ApexPages.StandardController(bob).view();
     
    }
}
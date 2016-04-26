public with sharing class leadclone_handler 
{
  public static void clonelead(List<Lead> newlist)
  {
   lead led = new lead();
   //For Storing all new list whose Status = Open - Not Contacted
   list<Lead> leadList = new list<Lead>();
      
   //For Saving Clone Lead  
   list<Lead> listOfUpdated = new list< Lead>();
   
   //Iterating newely created lead data
   for(integer i = 0 ; i < newlist.size() ; i++)
   {
         if(newlist[i].Status == 'Open - Not Contacted')
         {
          leadList.add(newList[i]);
         
         }
   
   }


   for(Lead l : leadList)
    {
     led = l.clone();
     led.Phone = '';
     led.Email = '';
     led.Status = 'Working - Contacted';
     listOfUpdated.add(led);
     
    } 
      insert listOfUpdated;
      system.debug('ADD');
 }

}
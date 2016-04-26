public class leadNewTask 
{
    public static void newTaskonLead(List<Lead> newlist)
    {
        List<Task> tlist = new List<Task>();
             
        for(Lead l: newlist)
        {
             Task t = new Task();
             t.Subject = 'You have assigned new task....';
             t.OwnerId = l.OwnerId;
             t.whoId = l.Id;
             //system.debug(t.OwnerId);
             
             tlist.add(t);
  
        }
    
       if(tlist.size()> 0)
        {
            insert tlist;
        }

    }
}
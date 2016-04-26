trigger allLeadTrigger on Lead (before insert, before update, after insert, after update) 
{
    trigger11.method1(Trigger.New); 
    if(Trigger.Isbefore)
    {
         leadclone_handler.clonelead(Trigger.new);    
         D_Dup_handler.dup(Trigger.new);
         D_Dup_handler.dupafter(Trigger.new, Trigger.old);  
    }
    if(Trigger.Isafter)
    {
            leadNewTask.newTaskonLead(Trigger.new);
         
    }

}
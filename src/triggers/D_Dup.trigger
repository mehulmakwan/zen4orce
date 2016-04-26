trigger D_Dup on Lead (before insert, before update) 
{
    
    if(Trigger.Isbefore)
    {
        if(Trigger.isinsert)
        {
            D_Dup_handler.dup(Trigger.new);
        }
        if(Trigger.isupdate)
        {
            D_Dup_handler.dupafter(Trigger.new, Trigger.old);
        }
    }

}
trigger leadclone on Lead (after insert) 
{ 
    if(Trigger.Isafter)
    {
        if(Trigger.Isinsert)
        {
           leadclone_handler.clonelead(Trigger.new);
        }
    }

}
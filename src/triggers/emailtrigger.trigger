trigger emailtrigger on Opportunity (after insert)
{
    if(Trigger.Isafter)
    {
        if(Trigger.Isinsert)
        {
          emailHandler.oppemail(Trigger.new);
        }
    }
}
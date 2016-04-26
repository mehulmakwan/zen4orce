trigger oppClose on Opportunity (after insert, after update) 
{   
        if(Trigger.isupdate)
        {
           chatter.ChatterHandler(Trigger.new);
        }
    
    

}
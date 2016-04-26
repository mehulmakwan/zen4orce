trigger ownerChangerTrigger on Account (after update) 
{
    changeOwner.changeowners(Trigger.Old , Trigger.New);

}
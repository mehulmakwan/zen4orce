trigger HelloworldTrigger on Account (before insert) 
{
    System.debug('Hello World!');
}
public with sharing class emailHandler 
{
    public static void oppemail(List<Opportunity> newlist)
    {
        List<Opportunity> opp = new  List<Opportunity>();
        
        for(integer i = 0 ; i < newlist.size() ; i++)
        {
            if(newlist[i].Amount > 25000)
            {
                EmailManager.sendMail('mehul.makwan@live.com', 'Test Trigger', 'Hi this is test email from trigger');
            }
        }
    }

}
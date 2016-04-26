@isTest
public with sharing class emailTestClass 
{
     @isTest static void greaterthan()
     {
         Date d=date.newInstance(2016,3,22);
         Opportunity Opp=new Opportunity(Name='TestOpp',
                          CloseDate=d,
                          StageName='Closed Won',
                          Amount=250000000
                          );
         try{
             insert Opp;
             ID OId=Opp.Id;
              List<Opportunity> Op = new List<Opportunity>([select id,Name,Amount from Opportunity where id=:OId]);
              System.debug('state Name'+Op[0].Amount);
              System.assertEquals(Op[0].Amount,250000000);
         }
         catch(DMLException e)
         {
             System.debug('Error occure');
         }
         
     }

}
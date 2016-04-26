@isTest
public class OpportunityAmountAggregatorTest 
{

    static testMethod void testbatch() 
    {        
        List<Opportunity> lstopp = new List<Opportunity>();
        for(Integer i=0 ;i < 10;i++)
        {
            Opportunity Opp = new Opportunity();
            Opp.Name = 'Test'+i;
            Opp.Amount = 250000;
            Opp.CloseDate = Date.newInstance(2016,11,20);
            Opp.StageName ='Closed Won';
            lstopp.add(Opp);
        }
        
        insert lstopp;
        
        

        Test.startTest();
        	String crns = '0 30 8 * * ? 2017';
            scheduledBatchable m = new scheduledBatchable();        
            OpportunityAmountAggregator obj = new OpportunityAmountAggregator();
            DataBase.executeBatch(obj);  
        	
        	ID jobID = system.schedule('Oppourtunity Aggregate',crns,m);
            CronTrigger job = [SELECT Id, CronJobDetail.Id,CronJobDetail.Name, CronJobDetail.JobType FROM CronTrigger WHERE ID=:jobID][0];
            system.assertEquals('Oppourtunity Aggregate',job.CronJobDetail.Name);    
        Test.stopTest();
        
        
    }

}
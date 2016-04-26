global class OpportunityAmountAggregator implements Database.Stateful, Database.Batchable<sObject> 
{
    decimal total = 0;
    global datetime start;
    global Decimal totalhr;
    global datetime ends;
    String template;
    String query = 'SELECT Amount,CreatedDate,Isaggregated__c FROM Opportunity WHERE StageName = \'Closed Won\' AND CreatedDate = TODAY';
                
    global Database.QueryLocator start(Database.BatchableContext bc) 
    { 
        start = datetime.now();
        return Database.getQueryLocator(query); 
    }

    global void execute(Database.BatchableContext bc, List<Opportunity> Opp)
    {
        	System.debug('Opp = ' + Opp);
            if(!Opp.isEmpty()) 
            {
                for(Opportunity o: Opp) 
                {
                    total = total + o.Amount;
                    o.Isaggregated__c = TRUE;
                }
                update Opp;
    		}
    }
    
    global void finish(Database.BatchableContext bc)
    {
        profile ad=[select id from profile where name='System Administrator'];
        User u=[select id,Email from user where ProfileId=:ad.id];
        ends = datetime.now();
        AggregateResult[] groupedResults  = [SELECT SUM(Amount)Opamt FROM Opportunity WHERE CreatedDate = TODAY];
        Object avgAmount = groupedResults[0].get('Opamt');

        Integer Opps = [SELECT Count() FROM Opportunity WHERE StageName = 'Closed Won' AND CreatedDate = TODAY];
        template = 'The batch job for Daily Opportunity Amount Aggregation has completed successfully. The details associated with the job are as follows: \n\n';
        template+= 'Start DateTime :                 ' + start;
        template+= '\n End DateTime :                   ' + ends; 
        template+= '\n Total Duration (in Hours) :	   ' + (ends.hour() - start.hour());
        template+= '\n Number of Opportunities Closed Won Today :  ' + Opps;
        template+= '\n Total Opportunity Amount for today : ' + avgAmount;
        
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :bc.getJobId()];
        // send email
        System.debug('email id : '+u.Email);
        EmailManager.sendMail(u.Email, 'Opportunity Amount Aggregator Job Complete', template);
    
    }  
	
}


// ---- Execute (scheduledBatchable) -----
 
//scheduledBatchable m = new scheduledBatchable();
//String sch = '0 30 20 ? * MON-FRI';
//String jobID = system.schedule('OAA', sch, m);
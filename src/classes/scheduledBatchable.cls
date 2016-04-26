global class scheduledBatchable implements Schedulable 
{
   global void execute(SchedulableContext sc) 
   {
       OpportunityAmountAggregator b = new OpportunityAmountAggregator(); 
      	database.executebatch(b);
       
   }
}
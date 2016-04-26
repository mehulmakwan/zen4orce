public class SchedualOpportunityController 
{
    public Integer seconds{get;set;}
    public Integer minute{get;set;}
    public Integer hours{get;set;}
    public String days{get;set;}
    public String months{get;set;}
    public String weeks{get;set;}
    public String years{get;set;}
    public string name{get;set;}
    
    scheduledBatchable m = new scheduledBatchable();
    
    public SchedualOpportunityController(){
    }
    //Seconds 
    public List<SelectOption> getsecondsOptions() 
    {
            List<SelectOption> secondsOptions = new List<SelectOption>();
            for(integer i=0;i<61;i++)
            {
                secondsOptions.add(new SelectOption(String.valueOf(i),String.valueOf(i)));
            }
            return secondsOptions;
    }
    //Minute
    public List<SelectOption> getminuteOptions() 
    {
            List<SelectOption> minuteOptions = new List<SelectOption>();
            for(integer i=0;i<61;i++)
            {
                minuteOptions.add(new SelectOption(String.valueOf(i),String.valueOf(i)));
            }
            return minuteOptions;
    }
	//Hours
    public List<SelectOption> gethoursOptions() 
    {
            List<SelectOption> hoursOptions = new List<SelectOption>();
            for(integer i=0;i<24;i++)
            {
                hoursOptions.add(new SelectOption(String.valueOf(i),String.valueOf(i)));
            }
            return hoursOptions;
    }
    //Day of Month 
    public List<SelectOption> getdaysOptions() 
    {
            List<SelectOption> daysOptions = new List<SelectOption>();
        	daysOptions.add(new SelectOption('*','All'));
        	daysOptions.add(new SelectOption('?','Any'));
            for(integer i=0;i<32;i++)
            {
                daysOptions.add(new SelectOption(String.valueOf(i),String.valueOf(i)));
            }
            return daysOptions;
    }
    //Month 
    public List<SelectOption> getmonthsOptions() 
    {
            List<SelectOption> monthsOptions = new List<SelectOption>();
            monthsOptions.add(new SelectOption('*','All'));
            monthsOptions.add(new SelectOption('1','Jan'));
        	monthsOptions.add(new SelectOption('2','Feb'));
        	monthsOptions.add(new SelectOption('3','March'));
        	monthsOptions.add(new SelectOption('4','April'));
        	monthsOptions.add(new SelectOption('5','May'));
        	monthsOptions.add(new SelectOption('6','June'));
        	monthsOptions.add(new SelectOption('7','July'));
        	monthsOptions.add(new SelectOption('8','Aug'));
        	monthsOptions.add(new SelectOption('9','Sept'));
        	monthsOptions.add(new SelectOption('10','Oct'));
        	monthsOptions.add(new SelectOption('11','Nov'));
        	monthsOptions.add(new SelectOption('12','Dec'));

            return monthsOptions;
    }
    //Weeks of Month 
    public List<SelectOption> getweeksOptions() 
    {
            List<SelectOption> weeksOptions = new List<SelectOption>();
            weeksOptions.add(new SelectOption('?','Any'));
        	weeksOptions.add(new SelectOption('*','All'));
        	weeksOptions.add(new SelectOption('SUN','SUN'));
            weeksOptions.add(new SelectOption('MON','MON'));
        	weeksOptions.add(new SelectOption('TUE','TUE'));
        	weeksOptions.add(new SelectOption('WED','WED'));
        	weeksOptions.add(new SelectOption('THU','THU'));
        	weeksOptions.add(new SelectOption('FRI','FRI'));
        	weeksOptions.add(new SelectOption('SAT','SAT'));        	

            return weeksOptions;
    }
    //Year 
    public List<SelectOption> getyearsOptions() 
    {		
            List<SelectOption> yearsOptions = new List<SelectOption>();
        	yearsOptions.add(new SelectOption('*','All'));
            for(integer i=1970;i<2021;i++)
            {
                yearsOptions.add(new SelectOption(String.valueOf(i),String.valueOf(i)));
            }
            return yearsOptions;
    }
    //Schedual Button
    public void schedule()
    {   try{
        string crn = string.valueOf(seconds)+' ' + string.valueOf(minute)+' '+ string.valueOf(hours)+' '+ days+' ' + months+' ' + weeks+' '+ string.valueOf(years) ;
        System.debug('cron Expression ==> ' + crn);   
		String jobID = system.schedule(name, crn, m);
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Schedule Successfully !!!'));
    } catch(Exception e)
    {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'Invalid Cron : You are not allowed set Day-of-Month and Day-of-Week as "ANY"'));
    }
        
    }
    //Preview Button 
    public PageReference save()
    {
       string preview = string.valueOf(seconds)+' ' + string.valueOf(minute)+' '+ string.valueOf(hours)+' '+ days+' ' + months+' ' + weeks +' '+ string.valueOf(years);
       ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,preview));
       return null;
    }
}
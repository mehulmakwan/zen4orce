public class CountryStateController 
{
    public String country{get;set;}
    public String city{get;set;}
    
    public CountryStateController(){
        
    }
    
     public List<SelectOption> getcountryOptions() 
     {
        	List<Country__c> countryNames = new List<Country__c>([SELECT Name FROM Country__c]);
            List<SelectOption> countryOptions = new List<SelectOption>();        
            countryOptions.add(new SelectOption('','-- Select One --'));
        	
        	for(Country__c country : countryNames)
            {    
                countryOptions.add(new SelectOption(country.Name,country.Name));
            }
            return countryOptions;
     }
    
     public List<SelectOption> getcityOptions() 
     {
          	List<City__c> cityNames = new List<City__c>([SELECT Name, Country__c FROM City__c]);
            List<SelectOption> cityOptions = new List<SelectOption>();        
            cityOptions.add(new SelectOption('','-- Select One --'));
        	
        	for(City__c ci : cityNames)
            { 
                if(country == ci.Country__c)
                {
                    cityOptions.add(new SelectOption(ci.Name,ci.Name));
                }
                
            }
            return cityOptions;
     }

}
@isTest
public class TestDataFactory {           
    public static List<Lead> createNewLeads(Integer nuoflead) {
        List<zone__c> data1 = new List<zone__c>();
        for(Integer i=0;i<10;i++) {
		zone__c zon = new zone__c(State__c = 'CA'+i, Area_Code__c = '20'+i, Time_Zone__c = 'Est');    
        data1.add(zon);
        }
        insert data1;
        
        List<Lead> data = new List<Lead>();
        
        for(Integer i=0;i<nuoflead;i++) {
            Lead l = new Lead(LastName='TestAccount' + i, 
                              Phone='(20' +i + ')341-671',  
                              Status='Open Not - Contacted',
                              Company='zen');    
            data.add(l);
        }
        insert data;

        return data;
    }
    
    public static List<Lead> leadnulltest(Integer nuoflead)
    {
         List<Lead> data = new List<Lead>();
        
        for(Integer i=0;i<nuoflead;i++) {
            Lead l = new Lead(LastName='TestAccount' + i, 
                              
                              Email= 'test'+ i+'@gmail.com', 
                              Status='Open Not - Contacted',
                              Company='zen');    
            data.add(l);
        }
        insert data;

        return data;
    }
}
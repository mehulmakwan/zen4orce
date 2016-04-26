public class trigger11 
{
    public  static void method1(List<Lead> newlist)
    {    
        List<zone__c> zn = new List<zone__c>([select Time_Zone__c, State__c,Area_Code__c from zone__c]);
        List<zone__c> zc = new List<zone__c>();
        
        Map<String, zone__c> m = new Map<String, zone__c>();
        
        for(zone__c zz : zn)
        {
           m.put(zz.Area_Code__c, zz);
        }
        System.debug(m);
        
        //---------
        for(Lead l : newlist) 
    	{
           if(l.State == Null)
            { 
                String ph = l.Phone;
                String sph;
                if(ph != NULL)
                {
                sph = ph.substring(1, 4);
                System.debug(sph);
                }
                
                zone__c Obj1 = m.get(sph);
                if(Obj1 != NULL)
                {
                    l.State = obj1.State__c;
                	l.Time_Zone__c = obj1.Time_Zone__c;
                }
                else
                {
                    System.debug('Error : Area Code Null Received');
                }
                
    
            }
           
    	}
    }

}
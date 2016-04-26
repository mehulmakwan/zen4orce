trigger statTimeZone on Lead (before insert , before update) 
{  
    //Map<String, zone__c> m = new Map<String, zone__c>();
   // m = trigger11.method1();

    for(Lead l : Trigger.New) 
    {
       if(l.State == Null)
        {
            String ph = l.Phone; 
            String sph = ph.substring(1, 4);
            System.debug(sph);
            
            zone__c Obj1; //= m.get(sph);
            System.debug('obj1 =>' + Obj1);
            
            l.State = obj1.State__c;
            System.debug('l.State =>' + l.State);
            
            l.Time_Zone__c = obj1.Time_Zone__c;
            System.debug('l.Time_Zone__c =>' + l.Time_Zone__c);
            

        }
    }    
}
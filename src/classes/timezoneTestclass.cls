@isTest
private class timezoneTestclass 
{
     //Basic Insert Test
     @isTest static void statetest()
     {      
         Lead[] leds = TestDataFactory.createNewLeads(1);
         System.debug(leds);
         
         Test.startTest();        
         List<Lead> led = new List<Lead>([select id,Time_Zone__c,State from lead where id =: leds[0].id]);
         Test.stopTest();

         System.debug('state Name '+led[0].State);
         System.debug('Time Zone Name '+led[0].Time_Zone__c);
         System.assertEquals(led[0].State,'CA0');  
     }
    
     //State NUll Check
     @isTest static void statetestNullCheck()
     {
           Lead[] leds = TestDataFactory.leadnulltest(1);
           
         try{
             Test.startTest();
         	 List<Lead> led = new List<Lead>([select id,Time_Zone__c,State from lead where id =: leds[0].id]);
             Test.stopTest();
             
              System.debug('state Name'+led[0].State);
              System.assertEquals(null,led[0].State);
         }
         catch(DMLException e)
         {
             System.Assert(e.getMessage().contains('CANNOT_INSERT_UPDATE_ACTIVATE_ENTITY'), true);
         }
     }
    
     //By Inserting All data
     @isTest static void statetest2()
     {
         Lead[] leds = TestDataFactory.createNewLeads(1);
         leds[0].state = 'MB';
         leds[0].Time_Zone__c='Est';
         update leds;
         
         Test.startTest();        
         List<Lead> led = new List<Lead>([select id,Time_Zone__c,State from lead where id =: leds[0].id]);
         Test.stopTest();
         try{
              
              System.debug('state Name'+led[0].State);
              System.assertEquals(led[0].State,'MB');
         }catch(DMLException e)
         {
             System.Assert(e.getMessage().contains('CANNOT_INSERT_UPDATE_ACTIVATE_ENTITY'), true);
         }
     }  
    
     //Update Phone Number and check
     @isTest static void statetestUpdatePhone()
     {
         Lead[] leds = TestDataFactory.createNewLeads(1);
         leds[0].Phone='(202)345-6789';
         update leds;
         
         Test.startTest();        
         List<Lead> led = new List<Lead>([select id,Time_Zone__c,State from lead where id =: leds[0].id]);
         Test.stopTest();
         try{
              
              System.debug('state Name'+led[0].State);
              System.assertEquals(led[0].State,'CA0');
            }
         catch(DMLException e)
         {
             System.Assert(e.getMessage().contains('CANNOT_INSERT_UPDATE_ACTIVATE_ENTITY'), true);
         }
     }
    
    //Verify BUlk
     @isTest static void statetestUpdateTimeZone()
     {
         Lead[] leds = TestDataFactory.createNewLeads(100);
         
         List<Lead> led = new List<Lead>([select id,State from lead where id IN: leds]);

         System.assertEquals(100,led.size());  

     }

}
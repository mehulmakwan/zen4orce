@isTest
public class allTriggerTestClass 
{
        //Global Lead Insert
    Lead l = new Lead(email = 'testclass1@gmail.com',
                      phone = '2122334455', 
                      LastName = 'Abc1', 
                      Company = 'xyz', 
                      Status = 'Open - Not Contacted' );
    
    
    // All Test Methods //
    //------------------------------------------------------------
    
    // ----------------------- Lead New Task Test Clas ----------------------
    @isTest static void checkNewTaskBulks()
    {
        List<Lead> led = new List<Lead>();
        Lead l;
        for(integer i=0;i<50;i++)
        {
             l = new Lead(email = i+'testclas@gmail.com',
                      phone = '21223344'+i+'2', 
                      LastName = 'Abc', 
                      Company = 'xyz', 
                      Status = 'Open - Not Contacted' );     
            led.add(l);
        }      
        insert led;
        
        List<Task> tsk = [select Id from Task where whoId IN : led];

        System.assertEquals(50, tsk.size());
    }
    
    //For Single Record Insert
    @isTest static void checkNewTask()
    {
             Lead l = new Lead(email = 'testclass1@gmail.com',
                      phone = '2122334455', 
                      LastName = 'Abc', 
                      Company = 'xyz', 
                      Status = 'Open - Not Contacted' );     
       
        insert l;
        
        List<Task> tsk = [select Id from Task where whoId =: l.Id];

        System.assertEquals(1, tsk.size());
    }
    
    
    //Test Method For Lead Clone---------------------
        @isTest static void checkClone() 
    	{
       
        try{
                Lead l = new Lead(email = 'testclass1@gmail.com',
                          phone = '2122334455',
                          FirstName = 'Naval',
                          LastName = 'Makwana', 
                          Company = 'xyzz', 
                          Status = 'Open - Not Contacted' );
                insert l;
                
                List<Lead> clon = [select Id, status, LastName from Lead where Status = 'Working - Contacted' AND LastName =: l.LastName];
            System.debug('check 232323 -------->' + clon);    
            System.debug('check -------->' + clon[0].Status);
                System.assertEquals(clon[0].Status, 'Working - Contacted');
           }
        
           catch(DmlException e)
           {
               System.Assert(e.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'), true);
           }
    	} 
    
    // Finding Duplictae lead, by email
    @isTest static void emailDBtest() 
    {
       List<Lead> dupes = [SELECT Id FROM Lead WHERE Email = 'testclass1@gmail.com'];
       System.assertEquals(0, dupes.size());
    }
    
    //Finding Duplictae lead, by phone
    @isTest static void phoneDBtest() 
    {
       List<Lead> dupes = [SELECT Id FROM Lead WHERE Email = '2122334455'];
       System.assertEquals(0, dupes.size());
    }
    
    //Check For Inserting------------------------------------------
    @isTest static void duplicationCheckIns() 
    {
        try
           {
            allTriggerTestClass t = new allTriggerTestClass();
            insert t.l;
            System.debug(' first Record Inserted in try 1 ');
           }
        catch(DmlException e)
        {
            System.debug(' first Record exception ');
            System.Assert(e.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'), true);
        } 
    }
    
    //Same record Inserted for Duplication Check----------------------
    @isTest static void duplicationCheckInsSame() 
    {
            allTriggerTestClass t = new allTriggerTestClass();
            insert t.l;
        try {
             insert t.l;
             System.debug('second Record Inserted in try 2 ');
            }
            catch (Exception e) 
            { 
                System.debug('second excpetion');
                
            }
    }
    
    //Only Phone Changed ----------------------------------
    @isTest static void duplicationCheckPhnChng() 
    {
            allTriggerTestClass t = new allTriggerTestClass();
            insert t.l;
         try{
             Lead le = new Lead(email = 'testclass1@gmail.com',
                      phone = '4564564562', 
                      LastName = 'Abc4', 
                      Company = 'xyz', 
                      Status = 'Open - Not Contacted');
             insert le;
             
             System.debug('Fifth Record Inserted - Email and phone NULL');
         }
         catch(DMLException e)
         {
             System.debug('Fifth excpetion not NULL - Done third ');
         }
         
    }
    
    //Only Email Changed ---------------------------------------------
    @isTest static void duplicationCheckEmailChg() {
            allTriggerTestClass t = new allTriggerTestClass();   
            insert t.l;
        
        try {
            Lead le = new Lead(email = 'changedemail@gmail.com',
                      phone = '2122334455', 
                      LastName = 'Abc4', 
                      Company = 'xyz', 
                      Status = 'Open - Not Contacted');
            insert le;    
            System.debug('six inserted');
        }
        catch(exception e)
        {
             System.debug('six exception - Done four');
            System.Assert(e.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'), true);
        }
              
    }
    
     //Check for Update ----------------------
    @isTest static void testBeforeUpdate()
    {
        allTriggerTestClass t = new allTriggerTestClass();   
      	Lead led1=new Lead(Email='newemail@gmail.com',
                           Phone='2122434455',
                           LastName='Abc1',
                           Company='xyz',
                           Status='Open Not - Contacted');
        
          insert t.l;
          insert led1;
          led1.Phone='2122334455';
          led1.Email='testclass1@gmail.com';
          try{
           update led1; 
          }
          catch(DmlException e)
          {
           System.assertEquals(e.getMessage().contains('Record is already exist..'),true);
          }    
    }
    // -------------------- Time Zone Test Class --------------------------
    
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
    
    //Verify BUlk
     @isTest static void statetestUpdateTimeZone()
     {
         Lead[] leds = TestDataFactory.createNewLeads(100);
         
         List<Lead> led = new List<Lead>([select id,State from lead where id IN: leds]);

         System.assertEquals(100,led.size());  

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
     @isTest static void stateTestUpdatesTimeZone()
     {
         try{
         Lead[] leds = TestDataFactory.createNewLeads(1);
         leds[0].state = 'MB';
         leds[0].Time_Zone__c='Est';
         update leds;
         
         Test.startTest();        
         List<Lead> led = new List<Lead>([select id,Time_Zone__c,State from lead where id =: leds[0].id]);
         Test.stopTest();
         
              
              System.debug('state Name'+led[0].State);
              System.assertEquals(led[0].State,'MB');
         }catch(DMLException e)
         {
             System.Assert(e.getMessage().contains('Phone Record is already exist..'), true);
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
             System.Assert(e.getMessage().contains('Email Record is already exist..'), true);
         }
     }


}
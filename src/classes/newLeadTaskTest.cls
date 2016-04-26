@isTest
public class newLeadTaskTest 
{    
    //
    @isTest static void checkNewTaskBluk()
    {
        List<Lead> led = new List<Lead>();
        Lead l;
        for(integer i=0;i<50;i++)
        {
             l = new Lead(email = 'testclass1@gmail.com',
                      phone = '2122334455', 
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

}
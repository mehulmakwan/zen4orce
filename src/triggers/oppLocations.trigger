trigger oppLocations on OpportunityLocation__c (before update) 
{
    list<HR__c> empno = new list<HR__c>([SELECT Employee_Number__c FROM HR__c]);
    list<Contact> empno_cont = new list<Contact>([SELECT Employee_Id__c,Reports_To_Employee_Id__c FROM Contact]);
    
    string rep_no,emp_HR;
    
    for(integer i = 0; i<empno.size();i++)
    {
        for(integer j=0; j<empno_cont.size(); j++)
        {
            if(empno[i].Employee_Number__c == empno_cont[j].Employee_Id__c)
            {
                rep_no = empno_cont[j].Reports_To_Employee_Id__c;
                System.debug('inside if condition' + rep_no);
            }
        }
    }
    System.debug([SELECT First_Name__c FROM HR__c WHERE Employee_Number__c like: rep_no]);
    
    list<HR__c> empno1 = new list<HR__c>([SELECT First_Name__c FROM HR__c WHERE Employee_Number__c like: rep_no]);
    for(integer i = 0; i<empno1.size();i++ )
    {
        System.debug('jhddfjhgfdgf'+empno[i]);
        OpportunityLocation__c obj = new OpportunityLocation__c(ID= empno[i].Id , Name = empno[i].First_Name__c);
        
        upsert obj;
    }
    
    System.debug([SELECT Name FROM OpportunityLocation__c]);
        
}
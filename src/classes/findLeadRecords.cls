//Find all the Lead records having Status as Won & update the stage with New value

public class findLeadRecords 
{
    public static void leadrecords()
    {
        List<Lead> abc = new List<Lead>([select ID, Name from lead where LeadSource = 'Web']);
        
        for(lead i : abc)
        {
            i.Industry ='Retail';            
        }
        update abc;      
    }

}
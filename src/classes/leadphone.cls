public class leadphone 
{
    public static void UpdateState(List<Lead> newlist,List<Lead> oldList)
    {
        List<zone__c>  obj = new List<zone__c>([select State__c,Area_Code__c,Time_Zone__c from zone__c]);
        for(Lead l:newlist)
        {
            if(l.Phone!=null)
            {
                String Phonee=l.Phone;
                String acc=Phonee.substring(1,4);
                for(zone__c zz : obj)
                {
                    if(acc == zz.Area_Code__c)
                    {
                        l.state=zz.State__c;
                        l.Time_Zone__c =zz.Time_Zone__c;
                    }
                        
                }
                
            }
            
        }
    }
    
    public static void UpdateStates(List<Lead> newlist,List<Lead> oldList)
    {
        Boolean flag=false; 
        for(Lead l:newlist)
        {
            for(Lead l1:oldList)
            {
                if(l.Phone!=l1.Phone)
                {
                    flag=true;
                }       
            }
        }
        List<zone__c > obj=new List<zone__c >([select State__c,Name from zone__c ]);
        for(Lead l:newlist)
        {
            if(l.Phone!=null && flag==true)
            {
                String Phone=l.Phone;
                String acc=Phone.substring(1,4);
                
                
            }
        }
    }

}
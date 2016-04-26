public with sharing class D_Dup_handler 
{
     public static void dup(List<Lead> newlist)
	{
       List<Lead> led = new List<Lead>([select email,phone from lead]);
		           
        for(integer i=0;i<newList.size() ; i++)
        {
            for(integer j = 0 ; j < led.size() ; j++)
            {
                 if(newList[i].Email != Null && (newList[i].Email == led[j].Email)) //
                {
					newList[i].Email.addError('Email Record is already exist..');
                    System.debug('E Record is already exist..');
                    break;
       			}
              
                if(newList[i].Phone != Null && (newList[i].Phone == led[j].Phone)) //
                 {
                    newList[i].Phone.addError('Phone Record is already exist..');
                    System.debug('P Record is already exist..');
                    break;
                }  
                
            }
        }
  
    }
    
    public static void dupafter(List<Lead> newList,List<Lead> oldList)
    {
         
          List<Lead> led=new List<Lead>([select id,Name,Phone,Email from lead]);
          for(Lead l:newList)
          {
           	for(Lead m:led)
           	{
                if(l.Id!= m.Id)
            	{
                     if((l.Phone== m.Phone && l.Email== m.Email))
                     {
                      	l.addError('Record is already exist..'); 
                     }
           		}
            }
         }
    }
    
}
public class chatter 
{
    public static void ChatterHandler(List<Opportunity> os)
    {
       list<FeedItem> zzz = new  list<FeedItem>();
       List<Opportunity> opp = [SELECT Name, Account.Name, Owner.Name, Amount FROM Opportunity WHERE IsWon = true];
        
       for(Opportunity o: opp)
       {
           String status = 'Hi I am generated from TRIGERS..! ' +  o.Account.Name + ' ' + o.Owner.Name;
           FeedItem post = new FeedItem(Body = status);
           post.ParentID = o.Id;
            zzz.add(post);
       }
   		insert zzz;
    }   
}
trigger testBillingcity on Account (before insert) 
{
    
    for(Account a: Trigger.New)
    {
        If(a.BillingCity == NULL)
        {
            a.BillingCity = a.ShippingCity;
        }
    }

}
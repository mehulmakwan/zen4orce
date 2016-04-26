trigger AccountAddressTrigger on Account (before insert) 
{
    //Account a = new Account();
    Account a =Trigger.New[0];
    if(a.Match_Billing_Address__c == TRUE)
    {
        
        a.ShippingPostalCode = a.BillingPostalCode;
    }
    
}
trigger InvoiceLineitemFalse on Invoice__c (after delete) 
{
    InvoiceTriggerHandler.checkInvoice(Trigger.old);

}
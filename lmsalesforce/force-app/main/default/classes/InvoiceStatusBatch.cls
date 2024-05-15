public class InvoiceStatusBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select id,Name from Invoice__c where Invoice_Status__c='Open' AND Invoice_Close_Date__c < LAST_N_DAYS:30]);
    }
	public void execute(Database.BatchableContext bc,List<Invoice__c> inv){
        List<Invoice__c> invoicelist=new List<Invoice__c>();
        for(Invoice__c i:inv){
        	i.Invoice_Status__c = 'Void';
            invoicelist.add(i);
        }
        update invoicelist;
    }
	public void finish(Database.BatchableContext bc){
    }
}
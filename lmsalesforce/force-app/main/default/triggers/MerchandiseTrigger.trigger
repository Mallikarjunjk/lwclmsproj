trigger MerchandiseTrigger on Merchandise__c (before insert,before update,after update,before delete , after delete,after undelete)
{
if(Trigger.isDelete && Trigger.isBefore)
{
 MerchandiseArchCls.insertMerchandiseArch(Trigger.old);
 }
}
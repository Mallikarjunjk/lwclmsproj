trigger UpdateBillingAddressTrigger on Contact (after insert, after update) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
UpdateBillingAddressHandler.updateBillingAddress(Trigger.new);
    }
}
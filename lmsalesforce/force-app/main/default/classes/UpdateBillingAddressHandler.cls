public class UpdateBillingAddressHandler {
    public static void updateBillingAddress(List<Contact> updatedContacts) {
        List<Account> accountsToUpdate = new List<Account>();
        
        for(Contact con : updatedContacts) {
            // Check if contact is associated with an account
            if(con.AccountId != null) {
                Account acc = [SELECT Id, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry
                               FROM Account WHERE Id = :con.AccountId LIMIT 1];
                if(acc != null) {
                    acc.BillingStreet = con.MailingStreet;
                    acc.BillingCity = con.MailingCity;
                    acc.BillingState = con.MailingState;
                    acc.BillingPostalCode = con.MailingPostalCode;
                    acc.BillingCountry = con.MailingCountry;
                    accountsToUpdate.add(acc);
                }
            }
        }
        
        if(!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}
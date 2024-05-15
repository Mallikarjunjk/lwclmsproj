@RestResource(urlMapping='/InsertMerchandise/*') 
global class WebserviceMerch {
        @httpPost 
        global static void addMerchandise(List<Merchandise__c> Merch){ 
            insert Merch; 
        }   
}
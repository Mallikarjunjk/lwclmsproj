@RestResource(urlMapping='/QuoteReceiver/*')
global with sharing class QuoteDataReceiver {
    @HttpPost
    global static String receiveQuote() {
        // Parse JSON opportunity data
        system.debug('Received Response '+RestContext.request.requestBody.toString());
        String jsonQuotes= RestContext.request.requestBody.toString();
        system.debug('JSON'+jsonQuotes);
        List<Quote> deserializeOppty = (List<Quote>) JSON.Deserialize(jsonQuotes, List<Quote>.class);
         //Map<String, Object> deserializeOppty=(Map<String, Object>)JSON.Deserialize(jsonOpportunities, (Map<String, Object>).class)
         //Opportunity deserializeOppty = (Opportunity) JSON.deserialize(jsonOpportunities,Opportunity.class);
        insert deserializeOppty;
/*        for(Opportunity oppty : deserializeOppty)
        {
            system.debug('oppty' +oppty);
        }*/

        system.debug('deserial' +deserializeOppty);
        return 'Record Processed Succesfully';
    }
}
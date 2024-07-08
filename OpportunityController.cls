public with sharing class OpportunityLineItemController {
    @AuraEnabled(cacheable=true)
    public static List<OpportunityLineItem> getOpportunityLineItems(String opportunityId) {

        return [SELECT Id,ProductLineItemName__c, UnitPrice,
                Quantity,Discount_Value__c,
                Discount_Type__c,GST__c 
                FROM OpportunityLineItem 
                WHERE OpportunityId = :opportunityId];
    }

    //added code to the repository.
}
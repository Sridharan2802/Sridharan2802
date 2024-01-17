public class SearchController {

    public List<Building__c> bu { get; set; }  //Here custom object is Building__c.
    public String searchstring { get; set; }

    public SearchController() {
        bu = new List<Building__c>();
        searchstring = '';
    }

    public void search() {
        
        // Here retrieving the query from Building__c oject.
        // Here I'm using the custom label for both warning and Error Messages.
        // As a best Practice, Here I'm using WITH SECURITY_ENFORCED keyword in SOQL Query to restrict access from unauthorized User.
        
        try {
            if (String.isNotBlank(searchstring)) {
                bu = [SELECT Id, Name, Building_Type__c,
                      Construction_Year__c, Number_Of_Floors__c, Revenue__c,
                      Total_Units_Flats__c, Total_Vacant_Flats__c 
                      FROM Building__c 
                      WHERE Name LIKE : '%' + searchstring + '%' WITH SECURITY_ENFORCED];
            } else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING,System.Label.Warning_Message));
            }
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,System.Label.Error_Occurred + e.getMessage()));
        }
    }

    public void clear() {
        bu.clear();
    }
}
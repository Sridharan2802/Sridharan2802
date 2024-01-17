public class SearchTenantContractController {
    
    public list<Tenant__c> ten{get;set;}
    public string searchstring {get;set;}
    
    public SearchTenantContractController( ) 
    {
        
    }
    public void search()
    {
        // Here retrieving the query from Tenant__c oject.
        // Here I'm using the custom label for both warning and Error Messages.
        // As a best Practice, Here I'm using WITH SECURITY_ENFORCED keyword in SOQL Query to restrict access from unauthorized User.
        
        try
        {
            if(String.isNotBlank(searchstring))
            {
                ten =[SELECT Id, Firstname__c,Lastname__c,
                  Address__c,Email__c,Phone_Number__c,
                  Tenant_Work_Informtion__c FROM 
                  Tenant__c where 
                  Firstname__c  like: '%' + searchstring + '%' WITH SECURITY_ENFORCED];

                
            }
            else 
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING,System.Label.Warning_Message));
            }
                            
            
        }
        
        catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,System.Label.Error_Occurred + e.getMessage()));
        }
        
        
    }
    public void clear()
    {
        ten.clear();
    }

    

}
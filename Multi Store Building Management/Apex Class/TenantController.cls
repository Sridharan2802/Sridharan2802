public class TenantController {
    
    public Tenant__c ten{get;set;}
    
    public TenantController()
    {
        ten=new Tenant__c();
        
        
    }
    
    public PageReference saveaction()
    {
        try {
            
            insert ten;
            if (!isValid()) {
                // If validation fails, add an error message and return null
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.TenantControllerMessage));
                return null;
            }
            // Add an informational message using a custom label
            String infoMessage = System.Label.Record_Created;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, infoMessage));
            
            // Redirect to the newly created record
            PageReference pageRef = new PageReference('/' + ten.Id);
            pageRef.setRedirect(true);
            return pageRef;
        } catch (Exception e) {
            // Handle exceptions, e.g., display an error message
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,System.Label.Error_Occurred));
            return null; // Or redirect to an error page
        }
        
        
    }
    
    private Boolean isValid() {
        // Add your validation logic here
        // Example: Check if required fields are populated
        if (String.isBlank(ten.Firstname__c) || String.isBlank(ten.Email__c)) {
            return false;
        }
        return true;
    }
    
    
    
    public void clear()
    {
        ten.clear();
        
    }

}
public class ContractController {
    
    public Contract__c ct{get;set;}
    
    public ContractController()
    {
        ct=new Contract__c();
        
    }
    
    public List<Selectoption> getItemsList()
    {
        List<SelectOption> options = new List<SelectOption>(); 
        List<Schema.Picklistentry> fieldResult = Contract__c.Status__c.getDescribe().getPicklistValues();
        options.add(new SelectOption('', '-- select -- '));
        for(Schema.PicklistEntry f : fieldResult) {
            options.add(new SelectOption(f.getValue(), f.getLabel()));
        }
        return options;
	}
    
    
    
    public PageReference saveaction()
    {
        try {
            
            insert ct;
            if (!isValid()) {
                // If validation fails, add an error message and return null
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.ContractControllerFields));
                return null;
            }
            // Add an informational message using a custom label
            String infoMessage = System.Label.Record_Created;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,infoMessage));
            
            // Redirect to the newly created record
            PageReference pageRef = new PageReference('/' + ct.Id);
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
        if (ct.Start_Date__c==null || ct.End_Date__c==null) {
            return false;
        }
        return true;
    }
    
    public void clear()
    {
        ct.clear();
        
    }


}
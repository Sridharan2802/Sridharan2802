public class BuildingController {
    
    public Building__c bul{get; set;}
    
    public BuildingController()
    {
        bul=new Building__c();
        
    }
    
    public List<Selectoption> getItemsList()
    {
        List<SelectOption> options = new List<SelectOption>(); 
        List<Schema.Picklistentry> fieldResult = Building__c.Building_Type__c.getDescribe().getPicklistValues();
        options.add(new SelectOption('', '-- Select -- '));
        for(Schema.PicklistEntry f : fieldResult) {
            options.add(new SelectOption(f.getValue(), f.getLabel()));
        }
        return options;
    }
    
    public List<Selectoption> getFlatList()
    {
        List<SelectOption> options = new List<SelectOption>(); 
        List<Schema.Picklistentry> fieldResult = Building__c.Flat_Status__c.getDescribe().getPicklistValues();
        options.add(new SelectOption('', '-- Select -- '));
        for(Schema.PicklistEntry f : fieldResult) {
            options.add(new SelectOption(f.getValue(), f.getLabel()));
        }
        return options;
    }
    
    
    
    
    public PageReference saveaction() {
        try {
            // Perform some logic or validation if needed
            insert bul; // Insert the record
            if (!isValid()) {
                // If validation fails, add an error message and return null
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Required_Field_Miissing));
                return null;
            
            }
            // Add an informational message using a custom label
            String infoMessage = System.Label.Record_Created;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, infoMessage));
            
            // Redirect to the newly created record
            PageReference pageRef = new PageReference('/' + bul.Id);
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
        if (String.isBlank(bul.Name) || String.isBlank(bul.Building_Type__c)) {
            return false;
        }
        return true;
    }
    
    public void clear()
    {
        bul.clear();
        
    }
    
}
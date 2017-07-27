/*
 * @author		Pranav Raulkar (pranavraulkar@gmail.com)
 * @description	This is the controller for lightning autocomplete component.
 * @version		1.0 
 * 				Initial version by default uses 'Id' field as the value to be used internally.
 * 				Name field will be used by default in case field is not accessible.
 */ 
public with sharing class AutocompleteController {
    /*
    * getAutocompleteEntries
    * @param	oName - Name of te object on which autocomplete will work.
    * @param	fName 	- Name of the field to be used as value for autocomplete.
    * @param 	recLimit - Number of records to be retrieved by SOQL.
    * @returns	String		- Serialized object containing list of label-value pairs for use in autocomplete component.
    */
	@AuraEnabled
    public static String getAutocompleteEntries(String oName, String fName, Decimal recLimit) {
        List<AutocompleteEntry> entryList = new List<AutocompleteEntry>();
        
        // Check if we have a valid sobject
        if(!String.isEmpty(oName) && isValidObject(oName)) {
            // Check if we have a valid field
            if(String.isEmpty(fName) || !isValidField(oName, fName)) {
                fName = 'Name';
            }
            
            // Check that we are with-in SOQL record limits
            recLimit = (recLimit <= 0 || recLimit > 2000) ? 200 : recLimit;
            
            // Go ahead and fetch records
            for(SObject sobj : Database.query('SELECT Id, ' + fName + ' FROM ' + oName + ' LIMIT ' + Integer.valueOf(recLimit))) {
                entryList.add(new AutocompleteEntry((String) sobj.get(fName), (String) sobj.get('Id')));
            }
        }
        
        return JSON.serialize(entryList);
    }
    
    /*
    * isValidObject
    * This method performs below validations - 
    * 1. Check if object name is provided and that it is not empty or null
    * 2. Checks if the object name provided is a valid object
    * 3. Checks if the object specified is accessible to currently logged in user
    * @param	oName - Name of te object on which autocomplete will work.
    * @returns	Boolean
    */
    private static Boolean isValidObject(String oName) {
        Boolean isValidObject = false;
        
        // Make sure the object is accessible
        Schema.SObjectType sobjectType = Schema.getGlobalDescribe().get(oName);     
        if(sobjectType != null) {
            isValidObject = sobjectType.getDescribe().isAccessible();
        }
        
        return isValidObject;
    }
    
    /*
    * isValidField
    * This method performs below validations - 
    * 1. Check if field name is provided and that it is not empty or null
    * 2. Checks if the field name provided is a valid
    * 3. Checks if the field specified is accessible to currently logged in user
    * @param	oName - Name of te object on which autocomplete will work.
    * @param	fName 	- Name of the field to be used as value for autocomplete.
    * @returns	Boolean
    */
    private static Boolean isValidField(String oName, String fName) {
        Boolean isValidField = false;
        
        // Make sure the object is accessible
        Schema.SObjectType sobjectType = Schema.getGlobalDescribe().get(oName);     
        if(sobjectType != null) {
            // Make sure field is accessible
            Schema.SObjectField sobjectField = sobjectType.getDescribe().fields.getMap().get(fName);
            if(sobjectField != null) {
                isValidField = sobjectField.getDescribe().isAccessible();
            }
        }
        
        return isValidField;
    }
    
    /*
     * @author		Pranav Raulkar (pranavraulkar@gmail.com)
     * @description	Inner class representing autocomplete entry.
     */ 
    public with sharing class AutocompleteEntry {
        public String label { get; set; }
        public String value { get; set; }
        
        /*
         * Constructor
         * @param	label - Name/Label used to display in autocomplete input.
         * @param	value - Unique value used internally to identify selected autocomplete entry.
         */
        public AutocompleteEntry(String label, String value) {
            this.label = label;
            this.value = value;
        }
    }
}
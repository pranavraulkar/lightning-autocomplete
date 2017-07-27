({
	afterScriptsLoaded : function(component, event, helper) {
        helper.callServer(component, "c.getAutocompleteEntries", function(result) {
        	var $j = jQuery.noConflict(true); 
            
            if($j != null || $j !== "undefined") {
                $j("#autocompleteInput").autocomplete({
                    source: JSON.parse(result),
                    focus: function(event, ui) {
                        event.preventDefAault();
                        $j("#autocompleteInput").val(ui.item.label);
                    },
                    select: function(event, ui) {
                        event.preventDefault();
                        $j("#autocompleteInput").val(ui.item.label);
                        
                        var acEvent = component.getEvent("acEvent");
                        acEvent.setParams({
                            "selectedValue" : ui.item.value
                        });
                        acEvent.fire();
                    }
                })._renderItem = function(u, i) {
                    return $j("<li>")
                    .append("<div>" + i.value + "<br/>" + i.label + "</div>")
                };
            }
        }, {
            "oName" : component.get("v.sObjectName"),
            "fName" : component.get("v.fieldName"),
            "recLimit" : component.get("v.recordLimit")
        });
	}
})
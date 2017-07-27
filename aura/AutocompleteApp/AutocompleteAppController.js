({
	handleComponentEvent : function(component, event, helper) {
		var selectedValue = event.getParam("selectedValue");
        component.set("v.selectedValue", selectedValue);
	}
})
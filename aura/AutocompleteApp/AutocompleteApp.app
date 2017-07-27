<aura:application extends="force:slds" >
    <aura:attribute name="selectedValue" type="String" description="Selected value obtained from the autolookup event." />
    <aura:handler name="acEvent" event="c:AutocompleteEvent" action="{!c.handleComponentEvent}"/>
    <c:Autocomplete sObjectName="Opportunity" inputLabel="Search Opportunities" />
    
    <div class="slds-box slds-m-around_xx-small">
        <b>Selected value: </b> {!v.selectedValue}
    </div>    
</aura:application>
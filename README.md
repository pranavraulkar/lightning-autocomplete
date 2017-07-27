# Autocomplete / Lookup Component

## License
Apache License, Version 2.0. See [Apache License, Version 2.0](https://opensource.org/licenses/Apache-2.0) for more details.

## Description
An c:Autocomplete creates an Autocomplete/Lookup text input that provides suggestions to user, as he types. You can use the attributes on this component to configure it to be compatible with any standard and custom object's field. 

By default the 'Name' field on the object is used as the search field.

## Usage
```sh
<c:Autocomplete sObjectName="Position__c" 
			fieldName="Name" 
			inputLabel="Search 
			Positions" 
			recordLimit="250" 
			showRequired="true" />
```

## Attributes
| Name | Type | Description |
| ------ | ------ | ------ |
| sObjectName | String | Required. Object on which autocomplete/lookup is to be created. Defaults to Account. |
| fieldName | String | Required. The field on which user will get autocomplete suggestions while typing. Defaults to standard Name field. |
| inputLabel | String | Required. The label string for the lookup field. Defaults to 'Search'. |
| recordLimit | Integer | Required. The number of records to be fetched. Default 200. Minimum 1. Maximum 2000. |
| showRequired | Boolean | Required. Boolean attibute to show requiredness (red asterisk) indicator before label. |

## Features
* Event driven. The c:Autocomplete event allows you to subscribe to selection event which sends you the id of the selected item from the autocomplete list.
* Works with any standard or custom object. Defaults to standard Account object.
* Works with any standard or custom field. Defaults to Name field.
* Takes into account object and field permissions.
* Responsive. Fits to any screen size.
* Optimized. Limits the recods to be searched. Minimum 1 - Maximum 2000.

## To-Do
* Allow autocomplete/lookup filtering with component attribute.

## Dependencies
* JQuery 2.2.4
* JQuery UI 1.11.4
> NOTE: Uses modified JQuery CSS, so do not use your version or the default version.

## Screenshots
### Fig 1: Setup:

![Fig 1: Setup:](https://github.com/pranavraulkar/lightning-autocomplete/blob/master/screenshots/autocomplete_setup.png)

### Fig 2: Working:

![Fig 2: Working:](https://github.com/pranavraulkar/lightning-autocomplete/blob/master/screenshots/autocomplete_working.png)
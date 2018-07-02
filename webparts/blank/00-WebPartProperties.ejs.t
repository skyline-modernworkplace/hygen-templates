---
to: src/webparts/<%= h.inflection.underscore(name) %>/<%= h.inflection.camelize(name, false) %>Properties.ts
---
<%
 Name = h.inflection.camelize(name, false)
%>
import { 
    PropertyPaneTextField, 
    IPropertyPaneField, 
    IPropertyPaneTextFieldProps 
} from '@microsoft/sp-webpart-base';
import WebPartContext from '@microsoft/sp-webpart-base/lib/core/WebPartContext';

export interface WebPartProperties {
    title: string,
}

export let getPropertyPane = function(properties: WebPartProperties, context: WebPartContext, onUpdate: Function) {
    return {
        pages: [{
            header: {
                description: "Configure your webpart",
            },
            groups: [
                {
                    groupName: "General",
                    groupFields: [
                        PropertyPaneTextField('title', {
                            label: "Web Part Title"
                        })
                    ]
                }
            ]
        }]
    }
}
---
to: <%= path %>/propertyfield_<%= h.inflection.underscore(name) %>/PropertyField<%= h.inflection.camelize(name, false) %>.ts
---
<%
 Name = h.inflection.camelize(name, false)
%>
import * as React from 'react';
import * as ReactDOM from 'react-dom';
import <%=Name%> from './<%=Name%>';

import {
    IPropertyPaneField,
    PropertyPaneFieldType,
    IPropertyPaneCustomFieldProps,
} from '@microsoft/sp-webpart-base';

export interface PropertyField<%=Name%>Properties {
    value: any,
    onUpdate: (targetProp:string, newValue:any) => void,
    label: string
}

export interface _PropertyField<%=Name%>Properties extends PropertyField<%=Name%>Properties, IPropertyPaneCustomFieldProps {}

export default class PropertyField<%=Name%> implements IPropertyPaneField<PropertyField<%=Name%>Properties> {
    public type: PropertyPaneFieldType = PropertyPaneFieldType.Custom;
    public targetProperty: string;
    public properties: _PropertyField<%=Name%>Properties;
    private elem: HTMLElement;

    constructor(targetProperty: string, properties: PropertyField<%=Name%>Properties) {
        this.targetProperty = targetProperty;
        this.properties = { 
            ...{ 
                key: "<%=Name%>-key", 
                onRender: this.onRender.bind(this) 
            }, 
            ...properties
        };
    }

    public render() {
        if (!this.elem) return null;
        this.onRender(this.elem);
    }

    private onRender(elem) {
        if (!this.elem) this.elem = elem;
        // import a React component to handle most of the work
        let props = {
            value: this.properties.value,
            label: this.properties.label,
            onChange: (newValue) => {
                this.properties.onUpdate(this.targetProperty, newValue)
            } 
        };
        var reactComponent = React.createElement(<%=Name%>, props)
        ReactDOM.render(reactComponent, elem);
    }
}
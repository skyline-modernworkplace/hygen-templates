---
to: src/webparts/<%= h.inflection.underscore(name) %>/<%= h.inflection.camelize(name, false) %>WebPart.ts
---
<%
 Name = h.inflection.camelize(name, false)
%>
import * as React from 'react';
import * as ReactDom from 'react-dom';
import { Version } from '@microsoft/sp-core-library';
import { BaseClientSideWebPart, IPropertyPaneConfiguration } from '@microsoft/sp-webpart-base';

import <%= Name %>, { <%= Name %>Props } from "./components/<%= Name %>";
import { WebPartProperties, getPropertyPane } from "./<%= Name %>Properties";

export default class <%= Name %>WebPart extends BaseClientSideWebPart<WebPartProperties> {

    public render(): void {
      
        let props : <%= Name %>Props = {
            webpart: {
                title: this.properties.title,
                displayMode: this.displayMode,
                updateProperty: this.handleUpdate.bind(this),
                webUrl: this.context.pageContext.web.absoluteUrl
            },
        }
        var element = React.createElement(<%= Name %>, props);
        ReactDom.render(element, this.domElement);
    }
  
    protected get dataVersion(): Version {
        return Version.parse('1.0');
    }
  
    protected onDispose(): void {
        ReactDom.unmountComponentAtNode(this.domElement);
    }
    protected handleUpdate(property, value) {
        this.properties[property] = value;
        this.render();
        this.context.propertyPane.refresh();
    }

    protected getPropertyPaneConfiguration(): IPropertyPaneConfiguration {
      return getPropertyPane(this.properties, this.context, this.handleUpdate.bind(this));
    }
} 
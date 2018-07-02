---
to: src/webparts/<%= h.inflection.underscore(name) %>/components/<%= h.inflection.camelize(name, false) %>.tsx
---
<%
 Name = h.inflection.camelize(name, false)
%>
import * as React from 'react';
import { DisplayMode } from '@microsoft/sp-core-library';
import styles from "./<%= Name %>.module.scss";
import WebPartTitle from '../../../components/webpart_title/WebPartTitle';

export default class <%= Name %> extends React.PureComponent<<%= Name %>Props, {}> {
    render() {
        return (
            <div className={styles.container}>
                <WebPartTitle {...this.props.webpart} />
                <div><%= name %> {this.props.webpart.title}</div>
            </div>
        );
    }
}

export interface <%= Name %>Props {
    webpart: {
        title: string,
        displayMode: DisplayMode,
        updateProperty: (key:string, value:string) => void,
        webUrl: string,
    },
}
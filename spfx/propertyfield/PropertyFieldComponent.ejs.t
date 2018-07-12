---
to: <%= path %>/<%= h.inflection.underscore(name) %>/<%= h.inflection.camelize(name, false) %>.tsx
---
<%
 Name = h.inflection.camelize(name, false)
%>
import * as React from 'react';
import styles from "./<%= Name %>.module.scss"
export default class <%= Name %> extends React.Component<<%= Name %>Props, {}> {
    render() {
        return (
            <div className={styles.<%= h.inflection.camelize(name, true)%>}>
                <%= h.inflection.humanize(name, false) %> Component
            </div>
        );
    }
}

export interface <%= Name %>Props {
    //props
    value: any,
    onChange: (newValue) => void,
    label: string,
}

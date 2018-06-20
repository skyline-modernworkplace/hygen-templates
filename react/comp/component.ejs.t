---
to: <%= locals.path || "src/components" %>/<%= h.inflection.underscore(name) %>/<%= name %>.tsx
---
<%
 Name = h.inflection.camelize(name, false);
%>
import * as React from 'react';
import styles from "./<%= Name %>.module.scss"
export default class <%= Name %> extends React.Component<<%= Name %>Props, {}> {
    render() {
        return (
            <div className={styles.container}>
                <%= h.inflection.humanize(name, false) %> Component
            </div>
        );
    }
}

export interface <%= Name %>Props {
    //props
}

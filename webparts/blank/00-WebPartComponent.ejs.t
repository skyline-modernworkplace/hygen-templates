---
to: src/webparts/<%= h.inflection.underscore(name) %>/components/<%= h.inflection.camelize(name, false) %>.tsx
---
<%
 Name = h.inflection.camelize(name, false)
%>
import * as React from 'react';
import * as SPScript from "spscript";
import { DisplayMode } from '@microsoft/sp-core-library';
import styles from "./<%= Name %>.module.scss";
import WebPartTitle from '../../../components/webpart_title/WebPartTitle';
import { useSiteData, Loading, InvalidSitePlaceholder, validateListExists } from "../../../components/site-data/SiteData";

function <%= Name %>(props: <%= Name %>Props) {
  let { data, isLoading, validation } = useSiteData<Data>({
    dataKey: props.webpart.webUrl + props.webpart.title,
    getData: siteUrl => getListItemCount(siteUrl, "Site Pages"),
    siteUrl: props.webpart.webUrl,
    // Optional - if not passed it will validate the site exists
    validate: siteUrl => validateListExists(siteUrl, "Site Pages"),
  });

  const renderContent = () => {
    if (isLoading) return <Loading />;
    if (!validation.isValid) return <InvalidSitePlaceholder message="Sorry couldn't find that list on that site" />;
    return (
      <div>
        <h4>Site Pages Count</h4>
        <h1>{data.count}</h1>
      </div>
    );
  };

  return (
    <div className={styles.container}>
      <WebPartTitle {...props.webpart} />
      {renderContent()}
    </div>
  );
}
export default React.memo(<%= Name %>);

export interface <%= Name %>Props {
    webpart: {
        title: string,
        displayMode: DisplayMode,
        updateProperty: (key:string, value:string) => void,
        webUrl: string,
    },
}

const getListItemCount = async (siteUrl, listTitle): Promise<Data> => {
  let ctx = SPScript.createContext(siteUrl);
  let items = await ctx.lists(listTitle).getItems("$select=Id");
  return { count: items.length };
};

interface Data {
  count: number;
}
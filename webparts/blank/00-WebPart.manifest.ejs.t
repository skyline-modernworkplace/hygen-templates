---
to: src/webparts/<%= h.inflection.camelize(name,false) %>/<%= h.inflection.camelize(name, false) %>WebPart.manifest.json
---
<%
 Name = h.inflection.camelize(name, false)
%>
{
    "$schema": "https://dev.office.com/json-schemas/spfx/client-side-web-part-manifest.schema.json",
    "id": "<%= componentId %>",
    "alias": "<%= name %>WebPart",
    "componentType": "WebPart",
    "version": "*",
    "manifestVersion": 2,
    "supportsThemeVariants": true,
    "requiresCustomScript": false,
    "preconfiguredEntries": [{
      "groupId": "5c03119e-3074-46fd-976b-c60198311f70",
      "group": { "default": "Other" },
      "title": { "default": "<%= displayName %>" },
      "description": { "default": "<%= description %>" },
      "officeFabricIconFontName": "Vacation",
      "properties": {
        "title": "<%= displayName %>"
      }
    }]
  }
  
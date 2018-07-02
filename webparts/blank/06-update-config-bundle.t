---
inject: true
to: config/config.json
after: components
skip_if: <%= h.inflection.camelize(name, false) %>WebPart.js
---
<%
 Name = h.inflection.camelize(name, false)
%>
				{
					"entrypoint": "./lib/webparts/<%= h.inflection.underscore(name) %>/<%= Name %>WebPart.js",
					"manifest": "./src/webparts/<%= h.inflection.underscore(name) %>/<%= Name %>WebPart.manifest.json"
				},
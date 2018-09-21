---
inject: true
to: config/config.json
after: components
skip_if: TabifyWebPart.js
---
				{
					"entrypoint": "./lib/webparts/tabify/TabifyWebPart.js",
					"manifest": "./src/webparts/tabify/TabifyWebPart.manifest.json"
				},
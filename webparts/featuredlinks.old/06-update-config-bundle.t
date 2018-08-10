---
inject: true
to: config/config.json
after: components
skip_if: FeaturedLinksWebPart.js
---
				{
					"entrypoint": "./lib/webparts/featured_links/FeaturedLinksWebPart.js",
					"manifest": "./src/webparts/featured_links/FeaturedLinksWebPart.manifest.json"
				},
---
inject: true
to: config/config.json
after: components
skip_if: AnnouncementsWebPart.js
---
				{
					"entrypoint": "./lib/webparts/announcements/AnnouncementsWebPart.js",
					"manifest": "./src/webparts/announcements/AnnouncementsWebPart.manifest.json"
				},
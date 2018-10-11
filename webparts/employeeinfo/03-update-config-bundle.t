---
inject: true
to: config/config.json
after: components
skip_if: AnniversariesWebPart.js
---
				{
					"entrypoint": "./lib/webparts/employee-info/anniversaries/AnniversariesWebPart.js",
					"manifest": "./src/webparts/employee-info/anniversaries/AnniversariesWebPart.manifest.json"
				},
				{
					"entrypoint": "./lib/webparts/employee-info/birthdays/BirthdaysWebPart.js",
					"manifest": "./src/webparts/employee-info/birthdays/BirthdaysWebPart.manifest.json"
				},
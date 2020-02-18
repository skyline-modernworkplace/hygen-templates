---
inject: true
to: config/config.json
after: components
skip_if: AlertsBannerWebPart.js
---
        {
          "entrypoint": "./lib/webparts/alerts_banner/AlertsBannerWebPart.js",
          "manifest": "./src/webparts/alerts_banner/AlertsBannerWebPart.manifest.json"
        },
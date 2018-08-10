---
inject: true
to: config/config.json
after: localizedResources
skip_if: PropertyControlStrings
---
		"PropertyControlStrings": "./node_modules/@pnp/spfx-property-controls/lib/loc/{locale}.js",
		"ControlStrings": "./node_modules/@pnp/spfx-controls-react/lib/loc/{locale}.js"
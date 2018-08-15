---
inject: true
to: package.json
after: dependencies
skip_if: "@pnp/sp\":"
---
    "@pnp/sp": "^1.1.4",
---
inject: true
to: package.json
after: scripts
skip_if: fixbuild
---
    "fixbuild": "rimraf .\\node_modules\\@microsoft\\gulp-core-build-typescript\\node_modules\\typescript",
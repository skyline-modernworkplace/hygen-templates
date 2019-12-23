---
inject: true
to: package.json
after: scripts
skip_if: package.ps1
---
        "package": "powershell tasks/package.ps1",
---
inject: true
to: package.json
after: scripts
skip_if: deployDev.ps1
---
        "deploy:dev": "powershell tasks/deployDev.ps1",
---
inject: true
to: package.json
after: scripts
skip_if: "bit:import"
---
        "bit:import": "powershell \"_templates\\_helpers\\tryBitImport.ps1\"".
---
inject: true
to: package.json
after: scripts
skip_if: cloneTemplates
---
        "cloneTemplates": "git clone https://skyline.visualstudio.com/Skyline-Portals-Reusables/_git/hygen-templates _templates",
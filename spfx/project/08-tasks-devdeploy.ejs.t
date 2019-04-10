---
to: tasks/devdeploy.ps1
---

gulp.cmd clean
gulp.cmd bundle --ship
gulp.cmd package-solution --ship
Connect-PnPOnline https://skylinespark.sharepoint.com/sites/devshowcase
Add-PnPApp -Path ./sharepoint/solution/REPLACEME.sppkg -Scope Site -Publish -Overwrite -SkipFeatureDeployment
# CREATE PROJECT FOLDER
$projectFolder = Read-Host "What is the project folder name?"

# BEGIN: ASK IF IT SHOULD CREATE A SPARK SITE
$shouldCreateSiteInput = Read-Host "Create new SPARK Communication Site? ( y / n )" 
Switch ($shouldCreateSiteInput) 
 { 
   Y {$shouldCreateSite=$true} 
   N {$shouldCreateSite=$false} 
   Default {$shouldCreateSite=$false} 
 }

if ($shouldCreateSite) {
    $siteTitle = Read-Host "What is the Site Title?"
    $sitePath = Read-Host "What is the Site Path (/sites/{PATH})?"
    $siteUrl = "https://skylinespark.sharepoint.com/sites/" + $sitePath
}
# END: ASK IF IT SHOULD CREATE A SPARK SITE

# Create a new folder for the project and cd into it
mkdir $projectFolder
Set-Location $projectFolder

# Initialize GIT
git init

# SETUP HYGEN TEMPLATES
git clone https://skyline.visualstudio.com/Skyline-Portals-Reusables/_git/hygen-templates _templates
Set-Location _templates
npm install
Set-Location ..

# INSTALL & RUN MICROSOFT GENERATOR
npm install @microsoft/generator-sharepoint 
yo @microsoft/sharepoint --framework "react" --skip-install --skip-feature-deployment true --whichFolder "current" --component-type "webpart" --component-name "DeleteME" --component-description "DeleteME web part" 

# Make a GIT commit
git add -A 
git commit -m "generated microsoft project"

# Install dev dependencies and initialize BIT
npm install --save-dev bit-bin @microsoft/generator-sharepoint typescript rimraf
bit init
node "_templates/spfx/project/updateConfigs.js"

# Delete the webpart the Microsoft's Generator created
rimraf src/webparts/deleteMe

# Import commonly used BIT components
.\_templates\_helpers\TryBitImport.ps1 -Id core/polyfills
.\_templates\_helpers\TryBitImport.ps1 -Id core/utils
.\_templates\_helpers\TryBitImport.ps1 -Id components/webpart_title
.\_templates\_helpers\TryBitImport.ps1 -Id components/site-data
.\_templates\_helpers\TryBitImport.ps1 -Id components/site-url-input
.\_templates\_helpers\TryBitImport.ps1 -Id propertyfields/propertyfield_sitepicker
node "_templates/spfx/project/cleanup.js"

# Install extra npm packages (including upgrading React)
npm install @pnp/spfx-controls-react @pnp/spfx-property-controls spscript date-fns react@latest react-dom@latest @types/react@latest @types/react-dom@latest office-ui-fabric-react

# Run the hygen project generator (add npm scripts, setup /tasks etc...)
hygen spfx project

# Generate an example webpart so the bundle isn't empty
hygen webparts blank --name "Example" --displayName "Example (Custom)" --description "Example Web Part"

# GIT Commit
git add -A 
git commit -m "added core bit components and generated example webpart"

# Create the SPARK Communication site if user said to
if ($shouldCreateSite) {
    Write-Host "Creating Site: " $siteUrl
    Connect-PnPOnline https://skylinespark.sharepoint.com
    New-PnPSite -Type CommunicationSite -Title $siteTitle -Url $siteUrl
    Connect-PnPOnline $siteUrl
    Add-PnPSiteCollectionAdmin -Owners @( "sotto@skylinespark.onmicrosoft.com", "apetersen@skylinespark.onmicrosoft.com", "wspiering@skylinespark.onmicrosoft.com" )
    Add-PnPSiteCollectionAppCatalog -Site $siteUrl
}

npm install
# Removed teh nested version of typescript compliler found inside @microsoft/gulp*-typescript/nodemodule/typescript
npm run fixbuild
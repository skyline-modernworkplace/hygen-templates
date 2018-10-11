# CREATE PROJECT FOLDER
$projectFolder = Read-Host "What is the project folder name?"
# $packageFriendlyName = Read-Host "What is the friendly name of the App Package (eg 'MySkyline Intranet Web Parts')?"
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

mkdir $projectFolder
Set-Location $projectFolder

# Initialize GIT
git init

# SETUP HYGEN TEMPLATES
git clone https://skyline.visualstudio.com/Skyline-Portals-Reusables/_git/hygen-templates _templates
Set-Location _templates
npm install
Set-Location ..

# INSTALL MICROSOFT GENERATOR
npm install @microsoft/generator-sharepoint 
yo @microsoft/sharepoint --framework "react" --skip-install --skip-feature-deployment true --whichFolder "current" --component-type "webpart" --component-name "DeleteME" --component-description "DeleteME web part" 

git add -A 
git commit -m "generated microsoft project"

npm install --save-dev bit-bin @microsoft/generator-sharepoint typescript rimraf
bit init
node "_templates/spfx/project/updateConfigs.js"
rimraf src/webparts/deleteMe
.\_templates\_helpers\TryBitImport.ps1 -Id core/polyfills
.\_templates\_helpers\TryBitImport.ps1 -Id core/utils
.\_templates\_helpers\TryBitImport.ps1 -Id components/webpart_title
.\_templates\_helpers\TryBitImport.ps1 -Id components/site-data
.\_templates\_helpers\TryBitImport.ps1 -Id components/site-url-input
.\_templates\_helpers\TryBitImport.ps1 -Id propertyfields/propertyfield_sitepicker
node "_templates/spfx/project/cleanup.js"

npm install @pnp/spfx-controls-react @pnp/spfx-property-controls spscript date-fns react@latest react-dom@latest @types/react@latest @types/react-dom@latest office-ui-fabric-react


hygen webparts blank --name "Example" --displayName "Example (Custom)" --description "Example Web Part"

git add -A 
git commit -m "added core bit components and generated example webpart"

if ($shouldCreateSite) {
    Write-Host "Creating Site: " $siteUrl
    Connect-PnPOnline https://skylinespark.sharepoint.com
    New-PnPSite -Type CommunicationSite -Title $siteTitle -Url $siteUrl
    Connect-PnPOnline $siteUrl
    Add-PnPSiteCollectionAdmin -Owners @( "sotto@skylinespark.onmicrosoft.com", "apetersen@skylinespark.onmicrosoft.com" )
    Add-PnPSiteCollectionAppCatalog -Site $siteUrl
}

npm install

Param(
    $Name
)
$projectFolder = $Name;

if (!$projectFolder) {
    $projectFolder = Read-Host "What is the project folder name?"
}
mkdir $projectFolder
Set-Location $projectFolder

# SETUP MICROSOFT GENERATOR CONFIG
$yeomanConfig = "{
`"@microsoft/generator-sharepoint`": {
    `"environment`": `"spo`",
    `"componentType`": `"webpart`",
    `"framework`": `"react`",
    `"version`": `"1.9.1`",
    `"packageManager`": `"npm`",
    `"whichFolder`": `"current`",
    `"skipFeatureDeployment`": true,
    `"isDomainIsolated`": false
  }
}"
Set-Content -Path ".yo-rc.json" -Value $yeomanConfig;

git init
# SETUP HYGEN TEMPLATES
git clone https://skyline.visualstudio.com/Skyline-Portals-Reusables/_git/hygen-templates _templates
Set-Location _templates
npm install
Set-Location ..

# RUN PNP GENERATOR
yo @pnp/spfx --skip-install --environment "spo"

git add -A 
git commit -m "Generated PnP SPFx Project project"

# Delete the webpart the Microsoft's Generator created
rimraf src/webparts/helloWorld

# Copy in core source code
Copy-Item .\_templates\_static\* .\ -Force -Recurse

hygen spfx project
# Generate an example webpart so the bundle isn't empty
Write-Host ""
Write-Host "=========================="
Write-Host "=========================="
Write-Host "Running Web Part Generator"
hygen webparts blank

git add -A 
npx npm-add-dependencies spscript date-fns styled-components
git commit -m "Added core source code and generated example webpart"
npm install

# TODO: Fix duplicate react types. 
# TODO: Yank the localized webpart strings from the microsoft web part
# TODO: update .gitignore to replace "*.sppkg" with "sharepoint/solution"

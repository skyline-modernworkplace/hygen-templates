---
to: tasks/Install.ps1
---
Param(
    [Parameter(Mandatory = $true)]
    [string]$Tenant
)

$SiteScriptName = "CHANGEME!";
$SiteScriptPath = ".\tasks\siteScript.json";
$ThemePath = ".\tasks\theme.json";
$CommunicationSiteDesign = "CHANGEME! Communication Site"
$TeamSiteDesign = "CHANGEME! Team Site"

# Connect to the tenant's admin site
$Url = "https://" + $Tenant + ".sharepoint.com"
Write-Host "Connecting to " $Url -ForegroundColor Gray
Connect-PnPOnline $Url

.\tasks\_helpers\AddTheme.ps1 -Path $ThemePath
.\tasks\_helpers\AddSiteScript.ps1 -Name $SiteScriptName -Path $SiteScriptPath
.\tasks\_helpers\AddSiteDesign.ps1 -Name $CommunicationSiteDesign -SiteScriptName $SiteScriptName -SiteType "CommunicationSite";
.\tasks\_helpers\AddSiteDesign.ps1 -Name $TeamSiteDesign -SiteScriptName $SiteScriptName -SiteType "TeamSite";
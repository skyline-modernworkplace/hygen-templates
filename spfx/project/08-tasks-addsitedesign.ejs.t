---
to: tasks/_helpers/AddSiteDesign.ps1
---
param(
    [Parameter(Mandatory = $true)]
    $SiteScriptName,
    [Parameter(Mandatory = $true)]
    $Name,
    [ValidateSet("CommunicationSite","TeamSite")]
    [string]$SiteType
)

# CommunicationSite == 68
# Teamsite == 64
$webTemplate = 68;
if ($SiteType -eq "TeamSite") {
    $webTemplate = 64
}

$existing = Get-PnPSiteDesign | where { $_.Title -eq $Name -and $_.WebTemplate -eq $webTemplate }
if ($existing) {
    Write-Host "We found an existing Site Design with that name for that Site Type!" -ForegroundColor Red
    Write-Host "Removing existing Site Design..."
    Remove-PnPSiteDesign -Identity $existing.Id -Force
    Write-Host "Existing Site Design removed." -ForegroundColor Yellow
}


$siteScripts = Get-PnPSiteScript
$siteScriptMatch = $siteScripts | where { $_.Title -eq $SiteScriptName }

if ($siteScriptMatch) {
    Write-Host "Adding Site Design..." $Name
    $siteDesign = Add-PnPSiteDesign -Title $Name -WebTemplate $SiteType -SiteScriptIds $siteScriptMatch.Id
    Write-Host "SUCCESS! Added Site Design - " $Name -ForegroundColor Green
} else {
    Write-Host "Unable to find Site Script" $SiteScriptName -ForegroundColor Red
}
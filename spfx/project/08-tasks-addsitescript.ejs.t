---
to: tasks/_helpers/AddSiteScript.ps1
---
param(
    [Parameter(Mandatory = $true)]
    $Path,
    [Parameter(Mandatory = $true)]
    $Name
)

$content = Get-Content $Path -Raw
$existing = Get-PnPSiteScript | where { $_.Title -eq $Name }
if ($existing) {
    Write-Host "We found an existing Site Script with that name!" -ForegroundColor Red
    Write-Host "Removing existing Script Script..."
    Remove-PnPSiteScript -Identity $existing.Id -Force
    Write-Host "Existing Site Script removed" -ForegroundColor Yellow
}
$siteScript = Add-PnPSiteScript -Title ($Name) -Content $content
Write-Host "Success! Added Site Script - " $Name -ForegroundColor Green

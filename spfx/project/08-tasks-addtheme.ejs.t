---
to: tasks/_helpers/AddTheme.ps1
---
param(
    [Parameter(Mandatory = $true)]
    $Path
)

$Theme = Get-Content -Raw -Path $Path | ConvertFrom-Json
$palette = @{}
($Theme.theme).psobject.properties | Foreach { $palette[$_.Name] = $_.Value }

Remove-PnPTenantTheme -Identity $Theme.name -ErrorAction SilentlyContinue

Write-Host "Adding theme..."
Add-PnPTenantTheme -Identity $Theme.name -Palette $palette -IsInverted $false
Write-Host "Success! Added theme - " $Theme.name -ForegroundColor Green

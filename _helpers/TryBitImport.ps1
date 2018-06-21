param(
    [parameter(Mandatory = $True)]
    $Id
)

$path = Join-Path -Path $pwd  -ChildPath ("/src/" + $Id)

if (Test-Path $path) {
    Write-Host "BIT Component Already Exists"
} else {
    Write-Host "IMPORTING BIT COMPONENT"
    bit import droopytersen.portalsdev/$Id --ignore-package-json
}
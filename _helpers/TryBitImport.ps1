param(
    [parameter(Mandatory = $True)]
    $Id
)

Function CheckExists($SrcPath) {
    $path = Join-Path -Path $pwd  -ChildPath ("/src/" + $SrcPath)
    if (Test-Path $path) {
        $itemCount = (Get-ChildItem $path | Measure-Object).Count
        return $itemCount -gt 0
    } else {
        return false
    }
}
if (CheckExists -SrcPath $Id) {
    Write-Host "BIT Component Already Exists"
} else {
    Write-Host "IMPORTING BIT COMPONENT"
    bit import droopytersen.portalsdev/$Id --ignore-package-json
}
param(
    [parameter(Mandatory = $True)]
    $path,
    [parameter(Mandatory = $True)]
    $dest
)
git clone https://skyline.visualstudio.com/Skyline-Portals-Reusables/_git/spfx-ip _temp
Copy-Item -Path ("_temp\\" + $path) -Destination $dest -Force -Recurse
rimraf _temp
# .\_templates\_helpers\copyIPFolder.ps1 -path featured_links/src/webparts/featured_links -dest src/webparts
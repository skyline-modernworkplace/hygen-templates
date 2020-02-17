param(
    [parameter(Mandatory = $True)]
    $repo,
    [parameter(Mandatory = $True)]
    $path,
    [parameter(Mandatory = $True)]
    $dest
)
git clone $repo _temp
Copy-Item -Path ("_temp\\" + $path) -Destination $dest -Force -Recurse
rimraf _temp
# .\_templates\_helpers\copyGitFolder.ps1 -repo https://skyline.visualstudio.com/DefaultCollection/Skyline-Portals-Reusables/_git/ip-tabify -path src/webparts/tabify -dest src/webparts
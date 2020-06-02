
git clone https://skyline.visualstudio.com/DefaultCollection/Skyline-Portals-Reusables/_git/ip-designsystem _temp
$destBase = "src";
$src = "_temp\\ui-toolkit\src\ui-toolkit"

Copy-Item -Path $src -Destination $destBase -Force -Recurse
rimraf _temp
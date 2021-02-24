
git clone https://github.com/skyline-modernworkplace/ip-designsystem _temp
$destBase = "src";
$src = "_temp\\ui-toolkit\src\ui-toolkit"

Copy-Item -Path $src -Destination $destBase -Force -Recurse
rimraf _temp

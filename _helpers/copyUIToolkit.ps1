
git clone https://skyline.visualstudio.com/DefaultCollection/Skyline-Portals-Reusables/_git/ip-designsystem _temp
$destBase = "src/ui-toolkit/";
$srcBase = "_temp\\portalsdev-ui-toolkit\src\\"
Copy-Item -Path ($srcBase + "hooks") -Destination ($destBase) -Force -Recurse
Copy-Item -Path ($srcBase + "components") -Destination ($destBase ) -Force -Recurse
Copy-Item -Path ($srcBase + "core") -Destination ($destBase) -Force -Recurse
Copy-Item -Path ($srcBase + "propertyfields") -Destination ($destBase) -Force -Recurse
rimraf _temp
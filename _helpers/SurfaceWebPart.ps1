param(
    [parameter(Mandatory = $True)]
    $name
)
$parentPath = Join-Path -Path $pwd -ChildPath ("/src/webparts/" + $name)
$tempPath = Join-Path -Path $pwd -ChildPath ("/src/webparts/_" + $name)
$nestedPath = Join-Path -Path $parentPath -ChildPath ("/webparts/" + $name)

if (Test-Path $nestedPath) {
    mv $nestedPath $tempPath
    rimraf $parentPath
    mv $tempPath $parentPath
}

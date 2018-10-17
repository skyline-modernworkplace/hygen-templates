$filesToRemove = @(
    "src/core/utils/index.ts"   
)

Function tryRemoveFile($file) {
    $filePath = join-path -path $pwd -childpath $file;
    Remove-Item $filePath -ErrorAction SilentlyContinue;
}

forEach($file in $filesToRemove) {
    tryRemoveFile($file);
}
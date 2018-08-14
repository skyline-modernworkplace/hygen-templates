const fs = require("fs");
const pathUtils = require("path");

let replaceFile = function(path, contents) {
    try {
        fs.writeFileSync(_getFilePath(path), contents);

    } catch(err) {
        console.log(err)
        console.log("Unable to rewrite file:", path)
    }
}

let findAndReplace = function(path, regex, replaceStr) {
    try {
        let fileContents = fs.readFileSync(_getFilePath(path),"utf8");
        fileContents = fileContents.replace(regex, replaceStr);
        fs.writeFileSync(_getFilePath(path), fileContents);

    } catch(err) {
        console.log(err)
        console.log("Unable to Find and Replace:", path)
    }
}
let modifyJson = function(path, modifier) {
    try {
        var jsonFile = JSON.parse(fs.readFileSync(_getFilePath(path),"utf8"));
        let updatedFile = modifier(jsonFile);
        fs.writeFileSync(_getFilePath(path), JSON.stringify(updatedFile, null, "\t"))
    } catch (err) {
        console.log(err);
        console.log("Unable to modify " + path);
    } 
}

let _getFilePath = function(path) {
    // Assumes it lives in /_templates/helpers
    return pathUtils.join(__dirname,"../../", path); 
}

let getJsonFile = function(path) {
    try {
        return JSON.parse(fs.readFileSync(_getFilePath(path),"utf8"));
    } catch (err) {
        console.log(err);
        console.log("Unable to get JSON file:" + path);
    } 
}
module.exports = { modifyJson, getJsonFile, findAndReplace, replaceFile }
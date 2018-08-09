const fileHelpers = require("../../_helpers/fileHelpers");

fileHelpers.modifyJson("package.json", (package)=> {
    let updateDependencies = Object.keys(package.dependencies).reduce((newDependencies, key) => {
        console.log(key);
        console.log(newDependencies);
        if (key.indexOf("@bit") === -1) {
            newDependencies[key] = package.dependencies[key];
        }
        return newDependencies;
    }, {})
    console.log(updateDependencies);
    package.dependencies = updateDependencies;
    return package;
})

fileHelpers.findAndReplace("config/config.json", "[]",  `[
        ]`
    )
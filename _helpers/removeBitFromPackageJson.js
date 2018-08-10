const fileHelpers = require("./fileHelpers");

fileHelpers.modifyJson("package.json", (package)=> {
    let updateDependencies = Object.keys(package.dependencies).reduce((newDependencies, key) => {
        if (key.indexOf("@bit") === -1) {
            newDependencies[key] = package.dependencies[key];
        }
        return newDependencies;
    }, {})
    package.dependencies = updateDependencies;
    return package;
})
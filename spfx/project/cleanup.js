const fileHelpers = require("../../_helpers/fileHelpers");

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

fileHelpers.findAndReplace("config/config.json", "[]",  `[
        ]`
    )

fileHelpers.findAndReplace("config/package-solution", '"skipFeatureDeployment": "true"', '"skipFeatureDeployment": true')
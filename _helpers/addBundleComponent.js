let params = require('minimist')(process.argv.slice(2));
const fileHelpers = require("./fileHelpers");

if (params && params.name && params.folder) {
    fileHelpers.modifyJson("config/config.json", config => {
        let firstBundle = Object.keys(config.bundles)[0];
        config.bundles[firstBundle].components.push({
            "entrypoint": `./lib/webparts/${params.folder}/${params.name}WebPart.js`,
            "manifest": `./src/webparts/${params.folder}/${params.name}WebPart.manifest.json`
        })
        return config;
    })
}
const fs = require("fs");
const path = require("path");

const WEBPARTS_DIR = "src/webparts";
module.exports = function() {
    let defaultOption = path.join("src", "components");
    let checkIsDir = (path) => fs.statSync(path).isDirectory()
    
    
    let webpartFolders = fs.readdirSync(WEBPARTS_DIR)
            .map(name => path.join(WEBPARTS_DIR, name))
            .filter(dir => checkIsDir(dir))
            .map(dir => path.join(dir, "/components"))
    
    let options = [
        defaultOption,
        ...webpartFolders
    ]
    return options;
}


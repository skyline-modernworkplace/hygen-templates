const getPathOptions = require("./getCompPathOptions");
module.exports = {
    prompt: ({ inquirer, args }) => {
        let pathOptions = getPathOptions();
        return inquirer.prompt([{
            type: 'list',
            name: "path",
            message: "Where?",
            choices: pathOptions
        },{
            type: "input",
            name: "name",
            message: "Name?"
        }, {
            type: "list",
            name: "createFolder",
            message: "Create Folder?",
            choices: [ "Yes", "No" ]
        }]).then(params => {
            params.folderName = (params.createFolder === "Yes") 
                ? params.name
                : ""
            return params;
        })
    }
  }
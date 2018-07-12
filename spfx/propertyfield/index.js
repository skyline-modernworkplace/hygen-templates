const getPathOptions = require("./getPathOptions");
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
            message: "Name (e.g. CategoryPicker)?"
        }]);
    }
  }
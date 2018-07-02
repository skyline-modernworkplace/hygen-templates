const uuid = require('uuid/v4');
module.exports = {
    prompt: ({ inquirer, args }) => {
        return inquirer.prompt([
            {
                type: "input",
                name: "name",
                message: "Name (Capitlized, No Spaces ex: 'FeaturedLinks'):"
            },
            {
                type: "input",
                name: "displayName",
                message: "Display Name (ex: 'Featured Links'):"
            },
            {
                type: "input",
                name: "description",
                message: "Web Part Description:"
            }
        ]).then(params => {
            params.componentId = uuid();
            return params;
        })
    }
}
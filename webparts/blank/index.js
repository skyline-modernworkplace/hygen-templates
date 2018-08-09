const uuid = require('uuid/v4');
let prompts = [
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
]
module.exports = {
    prompt: ({ inquirer, args }) => {
        console.log(args);
        let argKeys = Object.keys(args);
        return inquirer.prompt(prompts.filter(p => !argKeys.includes(p.name)))
        .then(params => {
            params.componentId = uuid();
            return { ...params, ...args };
        })
    }
}
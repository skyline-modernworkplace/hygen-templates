const uuid = require("uuid/v4");
module.exports = {
	params: ({ args }) => {
		if (!args || !args.name) {
			console.log("Pass a --name arg to name the webpart");
		}
		let name = args.name || "NewWebPart";
		return {
			name,
			displayName: name,
			description: name + " description",
			componentId: uuid(),
			...args,
		};
	},
};

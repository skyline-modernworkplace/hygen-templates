const fileHelpers = require("../../../_helpers/fileHelpers");
let projectSettings = fileHelpers.getJsonFile(".yo-rc.json")["@microsoft/generator-sharepoint"];

fileHelpers.findAndReplace(
	"config/package-solution.json",
	'"skipFeatureDeployment": "true"',
	'"skipFeatureDeployment": true'
);

// TSConfig
// In "lib" replace es5 with "es2017"
fileHelpers.modifyJson("tsConfig.json", tsConfig => {
	tsConfig.compilerOptions.lib = ["es2017", "dom"];
	tsConfig.allowSyntheticDefaultImports = true;

	tsConfig.extends = "./node_modules/@microsoft/rush-stack-compiler-3.3/includes/tsconfig-web.json";
	return tsConfig;
});

// config/config.json
// Rename bundle to match project name, delete localized resources
fileHelpers.modifyJson("config/config.json", config => {
	let newBundleName = projectSettings.libraryName + "-bundle";
	config.bundles = {};
	config.bundles[newBundleName] = { components: [] };
	config.localizedResources = {};
	return config;
});

// config/package-solution.json
fileHelpers.modifyJson("config/package-solution.json", config => {
	config.solution.name = projectSettings.libraryName + " SPFx Package";
	return config;
});
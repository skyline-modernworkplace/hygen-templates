const fileHelpers = require("../../../_helpers/fileHelpers");
let projectSettings = fileHelpers.getJsonFile(".yo-rc.json")["@microsoft/generator-sharepoint"];

// TSConfig
// In "lib" replace es5 with "es2017"
fileHelpers.modifyJson("tsConfig.json", tsConfig => {
  tsConfig.compilerOptions.lib = ["es2017", "dom"];
  tsConfig.compilerOptions.allowSyntheticDefaultImports = true;

  return tsConfig;
});

fileHelpers.modifyJson("tslint.json", tslint => {
  console.log(tslint);
  tslint.rules["member-access"] = false;
  tslint.rules["no-function-expression"] = false;
  tslint.rules["no-unnecessary-semicolons"] = false;
  tslint.rules["no-use-before-declare"] = false;
  return tslint;
});

// config/config.json
// Rename bundle to match project name, delete localized resources
fileHelpers.modifyJson("config/config.json", config => {
  let newBundleName = projectSettings.libraryName + "-bundle";
  config.bundles = {};
  config.bundles[newBundleName] = { components: [] };
  if (config.localizedResources && config.localizedResources["HelloWorldWebPartStrings"]) {
    delete config.localizedResources.HelloWorldWebPartStrings;
  }
  return config;
});

// config/package-solution.json
fileHelpers.modifyJson("config/package-solution.json", config => {
  config.solution.name = projectSettings.libraryName + " SPFx Package";
  return config;
});

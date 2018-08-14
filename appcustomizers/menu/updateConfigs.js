const fileHelpers = require("../../_helpers/fileHelpers");

function getServeConfiguration() {
    return {
        "default": {
          "pageUrl": "https://myskyline365.sharepoint.com/sites/portals",
          "customActions": {
            "c2de4f7d-5979-49dc-9b52-b81ccc1630b7": {
              "location": "ClientSideExtension.ApplicationCustomizer",
              "properties": {
                "menuSiteUrl": "https://myskyline365.sharepoint.com",
                "menuType": "TopNav"
              }
            }
          }
        }
    }
}

fileHelpers.modifyJson("config/serve.json", (config) => {
    config.serveConfigurations = getServeConfiguration()
    return config;
})

---
to: <%= path %>/<%= h.inflection.underscore(folderName) %>/<%= h.inflection.camelize(name, false) %>.module.scss
---
@import '~@microsoft/sp-office-ui-fabric-core/dist/sass/SPFabricCore.scss';
.container {
    position: relative;
    box-sizing:border-box;
}
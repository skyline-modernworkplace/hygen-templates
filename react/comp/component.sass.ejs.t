---
to: <%= locals.path || 'src/components' %>/<%= h.inflection.underscore(name) %>/<%= name %>.module.scss
---
@import '~@microsoft/sp-office-ui-fabric-core/dist/sass/SPFabricCore.scss';
.container {
    position: relative;
    box-sizing:border-box;
}
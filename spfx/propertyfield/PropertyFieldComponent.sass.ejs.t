---
to: <%= path %>/propertyfield_<%= h.inflection.underscore(name) %>/<%= h.inflection.camelize(name, false) %>.module.scss
---
@import '~@microsoft/sp-office-ui-fabric-core/dist/sass/SPFabricCore.scss';
.<%= h.inflection.camelize(name, true)%> {
    position: relative;
    box-sizing:border-box;
}
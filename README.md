# Portals Dev Code Templates
## Install 
```
npm install -g hygen
```

## SPFX React Component
```
hygen react comp [--path]
```
This will generate a new React component with all the boilerplate as well as a SASS module for styling that component.

1. Create a new folder for the component using a lowercased, underscored version of `name`
2. Create `{name}.module.scss` file.
    - Import the UI Fabric stuff so you can reference theme variables
3. Create a `{name}.tsx` file with basic React component boilerplate.
    - Import the newly created `{name}.module.scss`

*Create a new component using the default path, `src/components`. It will ask you for a Component Name.*

```
hygen react comp
```
*Expected output*
```
added: src/components/my_new_comp_demo/MyNewCompDemo.tsx
added: src/components/my_new_comp_demo/MyNewCompDemo.module.scss
```
> **Why is it creating that "lowercased, underscored" folder?!** 
> This is to provide future support for BIT components. Currently, Bit components can not contain capital letters.

*Create a new component with a specific `path`*
```
hygen react comp --path .\src\webparts\FeaturedLinks\com
```
*Expected output*
```
added: .\src\webparts\FeaturedLinks\components/link_tile/LinkTile.tsx
added: .\src\webparts\FeaturedLinks\components/link_tile/LinkTile.module.scss
```

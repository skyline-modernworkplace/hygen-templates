# Portals Dev Code Templates
## Install 
Install the `hygen` tool, as well as a few tools the generators depend on.
```
npm install -g hygen
npm install -g bit-bin rimraf
```

## Roadmap
- ~~React Component (SPFx, Typescript, w/ Sass Module)~~
    - `hygen react comp`
- ~~Announcements Web Part~~
    - `hygen webparts announcements`
- ~~Featured Links Web Part~~
    - `hygen webparts featuredlinks`
- ~~Tabify Web Part~~
    - `hygen webparts tabify`
- Modern Branding (tasks/applyBranding)
- Create Site Collection App Catalog (tasks/appCatalog)
- SPFx Custom Property Field
- My Groups Web Part
- Blank Web Part
- Component Installer
- Top Nav (Menu)
- Project Generator (that plays niceley with SPFx 1.5)
- Anniversaries Web Part

## Setup a Project to use Generators
1. Add `_templates` to the bottom of your project's `.gitignore`
2. Clone the [generator repo](https://skyline.visualstudio.com/Skyline-Portals-Reusables/_git/hygen-templates) into `/_templates`
```
git clone https://skyline.visualstudio.com/Skyline-Portals-Reusables/_git/hygen-templates _templates
```

This will create a nested GIT repository. If you end up modifying generators, you'll need to `cd` into the `_templates` folder and commit it via the CLI


*For example, if I created a new generator*
```
cd _templates
git add -A
git commit -m "added a BLAH generator"
git push origin master
cd ..
```
> If you push updates PLEASE DOCUMENT them!!

## Announcements Web Part
```
hygen webparts announcements
```

- Import [Bit Dependencies](https://bitsrc.io/droopytersen/portalsdev)
    - [`core/utils`](https://bitsrc.io/droopytersen/portalsdev/core/utils/code)
    - [`components/ensure-dependencies`](https://bitsrc.io/droopytersen/portalsdev/components/ensure-dependencies/code)
    - [`components/icon-image`](https://bitsrc.io/droopytersen/portalsdev/components/icon-image/code)
    - [`propertyfields/propertyfield-blank`](https://bitsrc.io/droopytersen/portalsdev/propertyfields/propertyfield-blank/code)
    - [`webparts/announcements`](https://bitsrc.io/droopytersen/portalsdev/webparts/announcements/code)
- Fix the stupid Bit component thing where the actual web part code is nested in the BIT Component
    - Move `/webparts/announcements/webparts/announcements` to `/webparts/_announcements`
    - Delete `/webparts/announcements`
    - Rename `/webparts/_announcements` to `/webparts/announcements`
- Add a `bundle` entry to `config/config.json`
- Ensure PnP controls' `localizedResources` in `config/config.json`
- NPM install `date-fns`, `sp-pnp-js`, `@pnp/spfx-property-controls`, `@pnp/spfx-controls-react`

## Featured Links Web Part
```
hygen webparts announcements
```

- Import [Bit Dependencies](https://bitsrc.io/droopytersen/portalsdev)
    - [`core/utils`](https://bitsrc.io/droopytersen/portalsdev/core/utils/code)
    - [`components/ensure-dependencies`](https://bitsrc.io/droopytersen/portalsdev/components/ensure-dependencies/code)
    - [`propertyfields/propertyfield-blank`](https://bitsrc.io/droopytersen/portalsdev/propertyfields/propertyfield-blank/code)
    - [`webparts/featured_links`](https://bitsrc.io/droopytersen/portalsdev/webparts/featured_links/code)
- Fix the stupid Bit component thing where the actual web part code is nested in the BIT Component
    - Move `/webparts/featured_links/webparts/featured_links` to `/webparts/_featured_links`
    - Delete `/webparts/featured_links`
    - Rename `/webparts/_featured_links` to `/webparts/featured_links`
- Add a `bundle` entry to `config/config.json`
- Ensure PnP controls' `localizedResources` in `config/config.json`
- NPM install `sp-pnp-js`, `@pnp/spfx-property-controls`, `@pnp/spfx-controls-react`

## Tabify Web Part
```
hygen webparts tabify
```

- Import [Bit Dependencies](https://bitsrc.io/droopytersen/portalsdev)
    - [`core/utils`](https://bitsrc.io/droopytersen/portalsdev/core/utils/code)
    - [`components/sortable_list`](https://bitsrc.io/droopytersen/portalsdev/components/sortable_list/code)
    - [`components/webpart_title`](https://bitsrc.io/droopytersen/portalsdev/components/webpart_title/code)
    - [`webparts/tabify`](https://bitsrc.io/droopytersen/portalsdev/webparts/tabify/code)
- Fix the stupid Bit component thing where the actual web part code is nested in the BIT Component
    - Move `/webparts/tabify/webparts/tabify` to `/webparts/_tabify`
    - Delete `/webparts/tabify`
    - Rename `/webparts/_tabify` to `/webparts/tabify`
- Add a `bundle` entry to `config/config.json`
- NPM install `react-sortable`, `@pnp/spfx-property-controls`, `@pnp/spfx-controls-react`

## SPFX React Component
```
hygen react comp
```
This will generate a new React component with all the boilerplate as well as a SASS module for styling that component.

![React Component Generator](https://res.cloudinary.com/droopytersen/image/upload/v1529693803/docs/hygen/hygen-react-comp1.gif)

1. Create a new folder for the component using a lowercased, underscored version of `name`
2. Create `{name}.module.scss` file.
    - Import the UI Fabric stuff so you can reference theme variables
3. Create a `{name}.tsx` file with basic React component boilerplate.
    - Import the newly created `{name}.module.scss`


## TODO: Project
- Update `tsconfig` set `lib` to `es6`

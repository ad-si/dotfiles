# Dotfiles

Installation:

```bash
curl --silent https://raw.githubusercontent.com/adius/dotfiles/master/install.sh | bash
```


## Structure

* `bin` — custom scripts
* `home` — files that are symlinked to `$HOME` directory
* `terminal` — terminal config


## Steps

1. Install Command Line Developer Tools
1. Run install script
1. Enable Shiftit
    (System Preferences > Security & Privacy > Privacy > Accessibility)


## Scripts

Jxa macOS automation scripts are symlinked from
`~/dotfiles/scripts` to `~/Library/Scripts`
and are displayed in the scripts editor submenu in the menu bar.
(Enable via
`Script Editor.app > Preferences > General > Show Script menu in menu bar`)
Add subdirectories with app names for app specific scripts.


## Script Libraries

Script libraries are symlinked from
`~/dotfiles/script-libraries` to `~/Library/Script Libraries/dotfiles`
and can be imported like this:

```js
const tools = Library('dotfiles/tools')
```

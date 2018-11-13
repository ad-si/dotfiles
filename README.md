# Dotfiles

Installation:

```bash
curl --silent https://gitlab.com/adius/dotfiles/raw/master/install.sh | bash
```

**Attention:** The user must have sudo rights to install dependencies


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

The `symlink-dotfiles` script must be run after adding new scripts.


## Script Libraries

Script libraries are symlinked from
`~/dotfiles/script-libraries` to `~/Library/Script Libraries/dotfiles`
and can be imported like this:

```js
const tools = Library('dotfiles/tools')
```


## TODO

- MacOS
    - `defaults write com.apple.desktopservices DSDontWriteNetworkStores true`
    - System Preferences > General: Set "Show scroll bars" to "When scrolling"
    - Change Finder Preferences
- Check out https://github.com/danburzo/percollate for PDF generation
- Activate Sublime Text `gopass sublimetext.com/license-key`
- Logitech Control Center config
  To install and/or use logitech-control-center you may need to enable their kernel extension in
  System Preferences → Security & Privacy → General
- ShiftIt preferences
- Key repetition speed of keyboard
- Install brew fonts
- gopass config
  gopass fsck
  If password on gpg key => install pinentry-mac from brew and configure it in ~/gpg/gpg-agent.conf
  `echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf`
  Restart shell afterwards
- set: Warning: $PATH entry "/usr/local/Cellar/php/7.2.12/bin" is not valid (No such file or directory)
- set: Warning: $PATH entry "/Users/adrian/.cargo/bin" is not valid (No such file or directory)
- set: Warning: $PATH entry "/Users/adrian/.go/bin" is not valid (No such file or directory)
- set: Warning: $PATH entry "/usr/local/Cellar/ruby/2.5.3_1/bin" is not valid (No such file or directory)
- set: Warning: $PATH entry "/Users/adrian/.local/bin" is not valid (No such file or directory)
- set: Warning: $PATH entry "/Users/adrian/.config/yarn/global/node_modules/.bin" is not valid (No such file or directory)
- Firefox bookmarks
- Install app store apps with https://github.com/mas-cli/mas
- Set "Load preferences from a custom folder or URL" in iTerm to `~/dotfiles/terminal`
- Install TaskLite
- Printer driver software

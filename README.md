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
    - System Preferences > General: Set "Show scroll bars" to "When scrolling"
    - Change Finder Preferences
    - Change date and time preferences
    - Use "U.S." keyboard layout to have correct direct output of "~" and "\`"
    - Automatically hide menu bar
    - Change primary display
- Check out https://github.com/danburzo/percollate for PDF generation
- Activate Sublime Text `gopass sublimetext.com/license-key`
- Logitech Options config
  Activate the Logitech Options Daemon at
  `System Preferences → Security & Privacy → Accessibility`
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
- Backup fish history
- Install TexLive packages after installation of MacTeX
- Run `yarn install` in the dotfiles directory
- Add Hunspell dictionaries after installation
  (e.g. https://github.com/titoBouzout/Dictionaries to
  `~/Library/Application Support/Sublime Text 3/Packages`)
- Configure Firefox to not print headers, footers, and margins
- Write `sun` with https://github.com/flosse/rust-sun
- Set default apps for file types with https://github.com/moretension/duti
- Install https://github.com/purescript/psc-package
- Install and setup Brother QL-810W label printer
- Install good CLI tools available on `pip`
- Install languages for Tesseract (e.g.
  https://github.com/tesseract-ocr/tessdata_best/blob/master/deu.traineddata?raw=true)
  to `/usr/local/Cellar/tesseract/4.0.0/share/tessdata`
- Remap Caps Lock key to CTRL

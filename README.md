# Dotfiles

## Installation

1. Install XCode via the macOS App Store
1. Accept XCode license agreement

```bash
curl --silent https://github.com/ad-si/dotfiles/raw/master/install.sh | bash
```

**Attention:** The user must have sudo rights to install dependencies


## Manual Steps

1. Copy all relevant files from backup to new Machine


### MacOS

- Invert scroll direction
- System Preferences > General
  - [x] Automatically hide and show the menu bar
  - [x] Show scroll bars: When scrolling
- System Preferences > Date & Time: Change date and time preferences
  - [x] Display the time with seconds
  - [x] Use a 24-hour clock
  - [x] Show the day of the week
  - [x] Show date
- System Preferences > Language & Region
  - Preferred languages: English (US)
  - First day of the week: Monday
  - Calendar: ISO 8601
  - Temperature: Celsius
  - Advanced:
    - General:
      - Grouping: Space
      - Decimal: .
      - Measurement: Metric
    - Dates:
      - Short: y-MM-dd
      - Medium: y-MM-dd
      - Long: y-MM-dd
      - Full: y-MM-dd, D', W'w, EEEE
    - Times:
      - Short: HH:mmZZZZZ
      - Medium: HH:mm:ssZZZZZ
      - Long: HH:mm:ssZZZZZ
      - Full: HH:mm:ss.SSSZZZZZ

- Change Finder Preferences
  - Show nothing on the Desktop
  - New Finder windows show home
  - Sidebar:
      Show Applications, Desktop, Downloads,
      Home, iCloud Drive, All Locations, Tags
  - Advanced:
    - [x] Show all filename extensions
    - [x] Show warning before removing from iCloud Drive
    - [x] Show warning before emptying the Trash
    - [x] Remove items from the Trash after 30 days
    - When performing a search: Search the Current Folder
- System Preferences > Displays:
  - Change primary display
- Activate Siri
- System Preferences > Keyboard:
  - Key Repeat: Fast
  - Delay Until Repeat: Short
  - [x] Show keyboard and emoji viewers in menu bar
  - > Input Sources
    - Use "ABC - extended" keyboard layout
        to have correct direct output of "\~" and "\`"
  - > Shortcuts
    - [x] Show Spotlight search "⌥Space"
- System Preferences > Mission Control > Hot Corners
  - Top Left: Launchpad
  - Top Right: --
  - Bottom right: Desktop
  - Bottom Left: Put Display to Sleep


### General

- Install TaskLite
- Printer driver software
- Backup fish history
- Install TexLive packages after installation of MacTeX
- Run `yarn install` in the dotfiles directory
- Add Hunspell dictionaries after installation
  (e.g. https://github.com/titoBouzout/Dictionaries to
  `~/Library/Application Support/Sublime Text 3/Packages`)
- Configure Firefox to not print headers, footers, and margins
- Set default apps for file types with https://github.com/moretension/duti
- Install https://github.com/purescript/psc-package
- Install and setup Brother QL-810W label printer
- Install languages for Tesseract (e.g.
  https://github.com/tesseract-ocr/tessdata_best/blob/master/deu.traineddata?raw=true)
  to `/usr/local/Cellar/tesseract/4.0.0/share/tessdata`
- For Mac Books: Remap Caps Lock key to CTRL


### Dropbox

- Copy directories from backup
- Enable sync


### iTerm

Chek for new updates

General > Preferences:

- [x] Load preferences from a custom folder or URL: `~/dotfiles/terminal`
- [x] Save changes to folder when iTerm2 quits


### Gopass

1. Copy password store from backup
1. If password on gpg key => `brew install pinentry-mac`.
1. Then add to gpg-agent config:
    ```sh
    echo "pinentry-program /usr/local/bin/pinentry-mac" \
      >> ~/.gnupg/gpg-agent.conf
    ```
1. Restart shell afterwards.
1. `gopass fsck`


### Sublime Text

- Copy preferences from backup
- Activate Sublime Text `gopass sublimetext.com/license-key`


### ShiftIt

1. Open `/Applications/ShiftIt.app`
1. Set necessary System Preferences
1. Replace `~/Library/Preferences/org.shiftitapp.ShiftIt.plist`
    with file from backup


### Brave

1. Go to brave://sync
1. Join Sync Chain
1. Install extensions Midnight Lizard, Flattr, Just Read
1. Clean up sync chain


### Firefox

- Login to Firefox Sync


### Thunderbird

1. Copy backup to `~/Library/Thunderbird`
1. Open and close Thunderbird once
1. Copy name of newly created profile directory
1. Delete newly created profile directory
1. Give the backup profile directory the copied name


### Logitech

- Log into Logitech Options account to sync mouse settings
  - Scroll direction Natural
- Logitech Options config
- Activate the Logitech Options Daemon at
    `System Preferences → Security & Privacy → Accessibility`


### Spotify

- Stream quality: Very High
- [x] Show unavailable songs in playlists


### Logic Pro X

- Download all additional content


### Xcode

- Accept License


## Structure

* `bin` — custom scripts
* `home` — files that are symlinked to `$HOME` directory
* `terminal` — terminal config


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

- Check out https://github.com/danburzo/percollate for PDF generation
- Use https://github.com/Homebrew/homebrew-bundle
- Write `sun` with https://github.com/flosse/rust-sun

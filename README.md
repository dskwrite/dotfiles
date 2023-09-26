# dotfiles

# What I Use (Software)

## OS
macOS 11  
iOS / iPadOS  
Windows 11  


## Shells/Terminals
[Nushell](https://www.nushell.sh)  
[Powershell](https://learn.microsoft.com/en-us/powershell/scripting/overview)  
[bash](https://www.gnu.org/software/bash/)  
[oh-my-posh](https://ohmyposh.dev)   
[iTerm2](https://iterm2.com)  
[Warp](https://www.warp.dev)  


## Package/App Management
[Homebrew](https://brew.sh)   
[mas](https://github.com/mas-cli/mas)  
[mackup](https://github.com/lra/mackup/tree/master)  
[Setapp](https://setapp.com)  
[pnpm](https://pnpm.io)  
[Bun](https://bun.sh)  


## Browsers
[Safari](https://www.apple.com/safari/)  
[Arc](https://arc.net)  
[Microsoft Edge](https://www.microsoft.com/edge)  
<!-- Vivaldi  -->


## File Storage/Management
[iCloud](https://www.icloud.com)  
[OneDrive](https://www.microsoft.com/en/microsoft-365/onedrive/online-cloud-storage)  \[macOS | iOS | Windows\]  
[CommandX](https://sindresorhus.com/command-x) \[macOS\]  *Cut and paste files in Finder*  
[Forklift](https://binarynights.com) \[macOS\] (via Setapp)   


## Utilities
[1Password](https://1password.com)  
	- 1Password CLI  
	- 1Password for Safari  
[Raycast](https://www.raycast.com) *Launcher, windows management*  
[AltTab](https://alt-tab-macos.netlify.app) *Windows `alt`-`tab` on macOS*  
[PopClip](https://www.popclip.app) (via Setapp)  
[Bartender](https://www.macbartender.com) (via Setapp)  
[OpenIn](https://loshadki.app/openin4/) (via Setapp)
[Snagit](https://www.techsmith.com/screen-capture.html)  
[Beyond Compare](https://www.scootersoftware.com/home)  
[Microsoft Remote Desktop](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-clients)  
[Rewind](https://www.rewind.ai)  
[DaisyDisk](https://daisydiskapp.com)  
[Magic Window Air](https://www.jetsoncreative.com/airmac) (via Setapp)


## Tasks
[Reminders](https://support.apple.com/en-us/HT205890)  
[Todoist](https://todoist.com)  


## Email / Calendar
[Spark](https://sparkmailapp.com)  
[Microsoft Outlook](https://www.microsoft.com/en-us/microsoft-365/outlook/email-and-calendar-software-microsoft-outlook)    


## Chat / Video Calls
[Discord](https://discord.com)  
[Slack](https://slack.com)  
[Microsoft Teams](https://www.microsoft.com/en-us/microsoft-teams/group-chat-software)  
[Zoom](https://www.zoom.us)  
<!-- (Mirror Magnet) -->


## Writing
[Obsidian](https://obsidian.md/)  
[Notion](https://notion.so)  


## Content Consumption
[Readwise Reader](https://readwise.io/read)  
	- Save to Reader (Readwise)  
[Cubox](https://cubox.cc)  
	- Cubox for Safari  
[Omnivore](https://omnivore.app)  
[Kindle](https://read.amazon.com/landing)   
[Audible](https://www.audible.com)
[Pocket Casts](https://pocketcasts.com)  


## Dev
[Git](https://git-scm.com)  
[Github](https://github.com)  
[Docker](https://www.docker.com)  
[Visual Studio Code](https://code.visualstudio.com)  
[VSCodium](https://vscodium.com)  
[dotnet SDK](https://dotnet.microsoft.com/en-us/download)  
[Azure CLI](https://learn.microsoft.com/en-us/cli/azure/what-is-azure-cli)  


## Data Dev (local)
[Microsoft Excel](https://www.microsoft.com/en-us/microsoft-365/excel)   
[Python](https://www.python.org)  
[SQLite](https://www.sqlite.org/index.html)  
[DuckDB](https://duckdb.org)  


## Creative
[Figma](https://www.figma.com)  
[Figjam](https://www.figma.com/figjam/)  
[Affinity Designer](https://affinity.serif.com/en-us/designer/)  
[Affinity Photo](https://affinity.serif.com/en-us/photo/)  


# What I Use (Hardware)
[MacBook Pro 16 inch (2021)](https://support.apple.com/kb/SP858?locale=en_US)
[Mackbook Pro 13 inch(2020)](https://support.apple.com/kb/SP824?locale=en_US)


# Configurations
## Git
[GitHub commit email address](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address)

# Mac Setup

## Initial Setup


## Automated Steps
```
xcode-select --install
```

```
git clone https://github.com/dskwrite/dotfiles.git ~/.dotfiles
```

```
zsh ~/.dotfiles/setup_mac.zsh
```

## Manual Steps

```nu
let $machine_name = 'ADD MACHINE NAME HERE, e.g., dsk-mbp-2020-13'
scutil --set ComputerName $machine_name
scutil --set HostName $machine_name
scutil --set LocalHostName $machine_name
#TODO: review if this is needed ... and if so, what needs to be fixed
#defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $machine_name
```

Restart

### System Settings
- General > Software Update
	- `Install macOS updates`: on 
	- `Install application updates from the App Store`: on
- Profile > iCloud > iCloud Drive
	- `Sync Desktop & Document Folders`: on
- Touch ID & Password
	- Apple Watch
- Keyboard > Touchbar Settings
	- `Touchbar shows`: F1, F2, etc. Keys
- Trackpad
	- `Tracking speed`: max
	- `Tap to click`: on
- Accessibility > Pointer Control > Trackpad Options
	- `Use trackpad for dragging`: on
	- `Dragging style`: Three Finger Drag

### 1Password
- Sign in
- Settings > Developer
	- `Integrate with 1Password CLI`

### Safari
- General
	- `Safari opens with`: All windows from last session
	- `Remove history items`: Manually
	- `Remove download list items`: Manually
	- `Open "safe" files after downloading`: off
- Tabs
	- `Tab layout`: Compact
- Autofill
	- Turn off all
- Search
	- `Search engine`: Bing
- Extensions
	- Enable all extensions
- Advanced
	- `Show full website address`: on
- Configure toolbar


### Raycast
- Change main hotkey to `⌘ SPACE`
- Sign in
- Turn on `Cloud Sync`
- Extensions
	- Re-apply hotkeys
	- Activate menu bar items
		- Menubar Weather
		- Todoist

### Logitech Options
- TODO

### Visual Studio Code
- Turn on Settings sync


### Obsidian
- `Open vault from Obsidian Sync`
	- set local directory to `~/.obsidian`
- Settings > Sync
	- Turn on all sync toggles

### Arc Browser
- General
	- `Archive tabs after`: 30 days
	- `Search engine`: Bing
- Advanced
	- `When opening Arc, restor windows from previous session`: on
- Extensions
	- [1Password](https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa)
	- [Cubox](https://chrome.google.com/webstore/detail/cubox/bflmgpechpeohjfomgfdkkfcbhfcjohl)
	- [Readwise Highlighter](https://chrome.google.com/webstore/detail/readwise-highlighter/jjhefcfhmnkfeepcpnilbbkaadhngkbi)
	- [Omnivore](https://chrome.google.com/webstore/detail/omnivore/blkggjdmcfjdbmmmlfcpplkchpeaiiab)
	- [Todoist](https://chrome.google.com/webstore/detail/todoist-for-chrome/jldhpllghnbhlbpcmnajkpdmadaolakh)

### Microsoft Edge
- Login with personal Microsoft account
- Vertical tabs
- Start, home and new tabs
	- `When Edge starts`: Open tabs from the previous session

### iTerm
- General > Preferences
	- `Save changes`: Automatically

### Bartender

### Mosaic
- General
	- `Manage Preferences`: Import `~/.dotfiles/configs/mosaic`

### OpenIn
- Restore last backup

### SnippetsLab
- Sync
	- `iCloud Sync`: Enabled

# Prep for Reset

```
mackup backup --verbose
```
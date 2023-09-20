#TODO: change this script to run with Nushell

#TODO: paramaterize name
# Set computer name
#sudo scutil --set ComputerName "dsk-mbp-2021-16"
#sudo scutil --set HostName "dsk-mbp-2021-16"
#sudo scutil --set LocalHostName "dsk-mbp-2021-16"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "dsk-mbp-2021-16"

#Disable the sound effects on boot
sudo nvram StartupMute=%01

#Dark Mode
# this is now configured on the manual installation
#defaults write NSGlobalDomain AppleInterfaceStyle Dark

#Don't show Spotlight in menu bar
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# TODO: review what this does
#defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
#defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
# TODO: review what this does
#defaults write NSGlobalDomain AppleKeyboardUIMode -int 3


###############################################################################
# SOFTWARE UPDATES
###############################################################################

#TODO: check to see if these settings still work

# Enable the automatic update check
#defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
#defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
#defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
#defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Turn on app auto-update
#defaults write com.apple.commerce AutoUpdate -bool true


###############################################################################
# FINDER
###############################################################################

# Finder: show hidden files by default 
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"



###############################################################################
# DOCK
###############################################################################

# Dock item size
defaults write com.apple.dock tilesize -int 24

# Dock items are magnified when hovering over them
defaults write com.apple.dock magnification -bool true

# Dock item hover size
defaults write com.apple.dock largesize -int 96;

# Only show active items
defaults write com.apple.dock static-only -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove apps from dock
defaults write com.apple.dock persistent-apps -array


###############################################################################
# HOT CORNERS
###############################################################################
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner
defaults write com.apple.dock wvous-bl-corner -int 11
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom left screen corner
defaults write com.apple.dock wvous-br-corner -int 12
defaults write com.apple.dock wvous-br-modifier -int 0


###############################################################################
# SAFARI
###############################################################################

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hide Safari’s sidebar in Top Sites
# defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true


###############################################################################
# MESSAGES
###############################################################################

# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false


# Turn off Spotlight keyboard shortcut
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Add :AppleSymbolicHotKeys:64:enabled bool false"


##############
# TODO
##############
# Software Updates > Install macOS updates
# Software Updates > Install application updates from the App Store


/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

###############################################################################
# Kill affected applications
###############################################################################
[
	'Activity Monitor'
	'Address Book'
	'Calendar'
	'cfprefsd'
	'Contacts'
	'Dock'
	'Finder'
	'iCal'
	'Messages'
	'Safari'
	'SystemUIServer'
	'Terminal'
] | each {
	killall $in
}

osascript -e 'tell application "System Preferences" to quit'
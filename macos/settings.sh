#!/usr/bin/env bash

# Exit on error
set -e

echo 'Configuring your mac. Hang tight.'
osascript -e 'tell application "System Preferences" to quit'

# === General UI/UX ===

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Hide remaining battery time; show percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "NO"

# Disable dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Disable startup noise
sudo nvram SystemAudioVolume=%01

# Mojave renders fonts that are too thin, use regular pre-mojave style
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

# Scrollbars visible when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Always use expanded save dialog
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable rubber-band scrolling
defaults write -g NSScrollViewRubberbanding -int 0

# Maximize windows on double clicking them
defaults write -g AppleActionOnDoubleClick 'Maximize'

# === Trackpad, mouse, keyboard, Bluetooth accessories, and input ===

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable multitouch swipes
defaults write -g AppleEnableSwipeNavigateWithScrolls -int 0

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 6
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# === Screen ===

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# === Finder ===

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

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

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show Library folder
chflags nohidden ~/Library

# === Dock, Dashboard, and hot corners ===

# Set the icon size of Dock items to 56 pixels
defaults write com.apple.dock tilesize -int 56

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don't animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# === Safari ===

# Privacy: don't send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari's home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# === Mail ===

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# === Terminal ===

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# === Time Machine ===

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# === Activity Monitor ===

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# === Menu bar ===

# Make status icons smaller
defaults write -globalDomain NSStatusItemSelectionPadding -int 12
defaults write -globalDomain NSStatusItemSpacing -int 12

# Install dockutil
brew install dockutil

########################
#                      #
# Applications Cleanup #
#                      #
########################
#
# Garage Band
#
sudo rm -rf /Applications/GarageBand.app
#
# iMovie
#
sudo rm -rf /Applications/iMovie.app
#
# Keynote
#
sudo rm -rf /Applications/Keynote.app
dockutil --remove 'Keynote' --allhomes
#
# Numbers
#
sudo rm -rf /Applications/Numbers.app
dockutil --remove 'Numbers' --allhomes
#
# Pages
#
sudo rm -rf /Applications/Pages.app
dockutil --remove 'Pages' --allhomes

################
#              #
# Dock Cleanup #
#              #
################
#
# App Store
#
dockutil --remove 'App Store' --allhomes
#
# Calendar
#
dockutil --remove 'Calendar' --allhomes
#
# Contacts
#
dockutil --remove 'Contacts' --allhomes
#
# Facetime
#
dockutil --remove 'FaceTime' --allhomes
#
# Launchpad
#
dockutil --remove 'Launchpad' --allhomes
#
# Mail
#
dockutil --remove 'Mail' --allhomes
#
# Maps
#
dockutil --remove 'Maps' --allhomes
#
# Messages
#
dockutil --remove 'Messages' --allhomes
#
# Music
#
dockutil --remove 'Music' --allhomes
#
# News
#
dockutil --remove 'News' --allhomes
#
# Notes
#
dockutil --remove 'Notes' --allhomes
#
# Photos
#
dockutil --remove 'Photos' --allhomes
#
# Podcasts
#
dockutil --remove 'Podcasts' --allhomes
#
# Reminders
#
dockutil --remove 'Reminders' --allhomes
#
# Safari
#
dockutil --remove 'Safari' --allhomes
#
# System Preferences
#
dockutil --remove 'System Preferences' --allhomes
#
# TV
#
dockutil --remove 'TV' --allhomes

echo "macOS settings updated. Note that some of these changes require a logout/restart to take effect."
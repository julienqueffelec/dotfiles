#!/bin/bash

# Exit on error
set -e

# Function to install Homebrew
install_homebrew() {
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew is already installed."
  fi
}

# Function to install a Homebrew package
brew_install() {
  if brew list "$1" &>/dev/null; then
    echo "$1 is already installed."
  else
    brew install "$1" && echo "$1 is installed."
  fi
}

# Function to install a Homebrew cask
cask_install() {
  if brew list --cask "$1" &>/dev/null; then
    echo "$1 is already installed."
  else
    brew install --cask "$1" && echo "$1 is installed."
  fi
}

# Install Homebrew
install_homebrew

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install Homebrew packages
echo "Installing Homebrew packages..."
brew_install zsh
brew_install git
brew_install node
cask_install watchman
brew_install yarn
brew_install nvm
brew_install dockutil

# Install casks
echo "Installing casks..."
cask_install google-chrome
cask_install visual-studio-code
cask_install docker
cask_install cocoapods
cask_install fastlane
cask_install iterm2
cask_install alfred
cask_install figma
cask_install spotify
cask_install imageoptim
cask_install monitorcontrol
cask_install slack
cask_install discord
cask_install the-unarchiver
cask_install cleanshot
cask_install aldente
cask_install android-studio
cask_install stats
cask_install contexts
cask_install expo-orbit
cask_install transmission
cask_install iina
cask_install zsh
cask_install zsh-syntax-highlighting
cask_install zsh-autosuggestions
cask_install z

# Development tools
cask_install adoptopenjdk

# Install Xcode command line tools
if xcode-select -p &>/dev/null; then
  echo "Xcode command line tools are already installed."
else
  echo "Installing Xcode command line tools..."
  xcode-select --install
fi

# Install eas-cli
echo "Installing eas-cli..."
npm install -g eas-cli


# Clean up
echo "Cleaning up..."
brew cleanup

echo "Homebrew and cask installations complete!"
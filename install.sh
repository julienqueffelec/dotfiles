#!/bin/bash

   # Set script directory
   SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

   # Run macOS settings
   echo "Configuring macOS settings..."
   source "$SCRIPT_DIR/macos/settings.sh"

   # Install Homebrew and applications
   echo "Installing Homebrew and applications..."
   source "$SCRIPT_DIR/apps/cask.sh"

   # Set up dotfiles
   echo "Setting up dotfiles..."
   ln -sf "$SCRIPT_DIR/macos/.aliases" ~/.aliases
   ln -sf "$SCRIPT_DIR/macos/.gitconfig" ~/.gitconfig
   ln -sf "$SCRIPT_DIR/macos/.zshrc" ~/.zshrc

   # Install VS Code extensions
   echo "Installing VS Code extensions..."
   source "$SCRIPT_DIR/vscode/extensions.sh"

   echo "Installation complete! Please restart your computer for all changes to take effect."
   
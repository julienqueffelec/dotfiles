#!/bin/sh


## install brew
if ! type "brew" >/dev/null; then
  echo_space
  echo_title_install "homebrew"
  sudo -v
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

# Upgrade any already-installed formulae.
brew upgrade

## install zsh
if [[ $(which zsh) == "/bin/zsh" ]]; then
  echo_space
  echo_title_install "zsh"
  brewinstall zsh
  echo "${HOMEBREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells
  chsh -s ${HOMEBREW_PREFIX}/bin/zsh
fi


# Browsers
echo "Installing Browsers..."
brew install --cask google-chrome
brew install --cask node
brew install --cask yarn
brew install --cask git

# Development
echo "Installing Development..."
brew install --cask visual-studio-code
brew install --cask docker

# Productivity
echo "Installing Productivity..."
brew install --cask alfred
brew install --cask contexts

# Communication
echo "Installing Communication..."
brew install --cask slack
brew install --cask discord

# Terminal
echo "Installing Terminal..."
brew install --cask iterm2

# Media
echo "Installing Media..."
brew install --cask spotify
brew install --cask transmission
brew install --cask iina

# Tools
echo "Installing Tools..."
brew install --cask adoptopenjdk
brew install --cask cleanshot
brew install --cask android-studio
brew install --cask istat-menus
brew install --cask minisim
brew install --cask yt-dlp

xcode-select --install
sudo softwareupdate --agree-to-license


# VSCode Extensions
echo_title "Installing VSCode Extensions..."
code --install-extension be5invis.vscode-icontheme-nomo-dark
code --install-extension dbaeumer.vscode-eslint
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension geddski.macros
code --install-extension michelemelluso.gitignore
code --install-extension mikestead.dotenv
code --install-extension mrmlnc.vscode-duplicate
code --install-extension naumovs.color-highlight
code --install-extension patbenatar.advanced-new-file
code --install-extension pmndrs.pmndrs
code --install-extension ryuta46.multi-command
code --install-extension sdras.night-owl
code --install-extension sherloach.solarized-osaka
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-french
code --install-extension supermaven.supermaven
code --install-extension usernamehw.errorlens
code --install-extension vadimcn.vscode-lldb
code --install-extension vincaslt.highlight-matching-tag
code --install-extension vscode-icons-team.vscode-icons
code --install-extension whizkydee.material-palenight-theme
code --install-extension yoavbls.pretty-ts-errors

echo_title "Cleaning brew cask..."
brew cleanup

# Check if Homebrew is installed
if type brew &>/dev/null; then
  export PATH="/opt/homebrew/bin:$PATH"
else
  echo "Homebrew is not installed. Some features may not work correctly."
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="gozilla"

# Plugins
plugins=(
  git
  z
  node
  vscode
  zsh-syntax-highlighting
  zsh-autosuggestions
  you-should-use
)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Maestro
export PATH=$PATH:$HOME/.maestro/bin

# Aliases
alias ll='ls -l'
alias ......='cd ../../../../..;'
alias .....='cd ../../../..;'
alias ....='cd ../../..;'
alias ...='cd ../..;'
alias ..='cd ..;'
alias vim="nvim"
alias v='nvim'
alias c='code .'
alias pn=pnpm
alias cl=clear
alias d="cd ~/Documents"
alias g="git"
alias gst="git status"
alias gco="git checkout"
alias gcb="git checkout -b"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gl="git log --oneline --decorate --graph"

# list npm or yarn global packages
alias global-packages="yarn global list; npm list --global --depth 0"

# android adb
alias a:devices="adb devices"
alias a:reverse="adb reverse tcp:8081 tcp:8081; adb reverse tcp:8097 tcp:8097"

# iOS
alias i:simulator="xcrun simctl list devices"

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_"
}

function update_global_packages() {
  echo "Updating global npm packages..."
  npm update -g
  echo "Updating global Yarn packages..."
  yarn global upgrade
}

function update_all() {
  echo "Updating Homebrew..."
  brew update && brew upgrade && brew cleanup
  echo "Updating npm..."
  npm update -g
  echo "Updating Yarn..."
  yarn global upgrade
  echo "Updating Oh My Zsh..."
  omz update
}

# Ruby
eval "$(rbenv init - zsh)"
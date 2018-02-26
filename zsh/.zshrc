# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/klayton.faria/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="spaceship"
#ZSH_THEME="hyperzsh"
ZSH_THEME=""



# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z adb colorize)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Git
alias gitlog='git log --graph --full-history --all --color --date=short --pretty=format:"%Cred%x09%h %Creset%ad%Cblue%d %Creset %s %C(bold)(%an)%Creset"'
alias fakesym='function _fake() { watchman-make --make "cp -fR `pwd`/" -p "**/*.js" "**/*.scss" "**/*.java" -t $1; };_fake'

rmd () {
  pandoc $1 | lynx -stdin
}

pushOffers() {
    cd /opt/loggi/driver-app/android/scripts
    for file in $(ls -1 /opt/loggi/driver-app/android/mocks/offer | sed -e 's/\..*$//'); do
        python send-push.py $file
    done
}

inFiles() {
    for file in $1; do
        echo "\033[0;32m \n\n • $file \e[0m" && $2 $file;
    done
}

reactNativeCSS() {
    for file in $(set +x) $1**/*.scss $(set -x); do
        echo "\033[0;32m \n\n • $file \e[0m";
        web-builder --reactNativeCSS $file;
    done
}

screenshot() {
    adb shell screencap -p /sdcard/$1.png && adb pull /sdcard/$1.png
}


export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

export PATH=/opt/loggi/ops/ansible/bin:$PATH
# H highlight output
. ~/h.sh

# Android tools path
export ANDROID_HOME=/Users/klayton.faria/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

alias sendpush='python /opt/loggi/driver-app/android/scripts/send-push.py'

alias lsoffers='ll /opt/loggi/driver-app/android/mocks/offer'

#THEME SETTINGS
#source "/Users/klayton.faria/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
# DOCKER
#SPACESHIP_DOCKER_SHOW=false
#DIR
#SPACESHIP_DIR_TRUNC=1
#GIT
#SPACESHIP_GIT_BRANCH_PREFIX=``

autoload -U promptinit; promptinit
prompt pure
export PATH="/usr/local/opt/sqlite/bin:$PATH"

alias imgls=~/.iterm2/imgls;
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

REACT_EDITOR=code-insiders

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

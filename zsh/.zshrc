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



# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z adb colorize)

source $ZSH/oh-my-zsh.sh

#### User configuration

# Git
alias gitlog='git log --graph --full-history --all --color --date=short --pretty=format:"%Cred%x09%h %Creset%ad%Cblue%d %Creset %s %C(bold)(%an)%Creset"'
alias fakesym='function _fake() { watchman-make --make "cp -fR `pwd`/" -p "**/*.js" "**/*.scss" "**/*.java" -t $1; };_fake'

# Read markdown
rmd () {
  pandoc $1 | lynx -stdin
}

# Loggi send push to Android
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

# Loggi build react-native 
reactNativeCSS() {
    for file in $(set +x) $1**/*.scss $(set -x); do
        echo "\033[0;32m \n\n • $file \e[0m";
        web-builder --reactNativeCSS $file;
    done
}

# Take a screenshot of Android
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

REACT_EDITOR="code-insiders"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ZPlug - Setup
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
bindkey '^P' fuzzy-search-and-edit
# ZPlug - Plugins list

zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh
zplug "mafredri/zsh-async"
zplug "seletskiy/zsh-fuzzy-search-and-edit"


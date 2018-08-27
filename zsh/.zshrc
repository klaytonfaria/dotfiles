# Path to your oh-my-zsh installation.
export ZSH=/Users/klayton.faria/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="hyperzsh"
#ZSH_THEME=""

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z adb colorize)

source $ZSH/oh-my-zsh.sh

#### User configuration

# Aliases
alias gitlog='git log --graph --full-history --all --color --date=short --pretty=format:"%Cred%x09%h %Creset%ad%Cblue%d %Creset %s %C(bold)(%an)%Creset"'
alias imgls=~/.iterm2/imgls;

# Utils
## Take a screenshot of Android
screenshot() {
    adb shell screencap -p /sdcard/$1.png && adb pull /sdcard/$1.png
}

## H highlight output
. ~/h.sh

# Exports
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export REACT_EDITOR="code-insiders"

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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

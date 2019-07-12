# Path to your oh-my-zsh installation.
export ZSH=/Users/klaytonfaria/.oh-my-zsh

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
alias fuzzy="fzf --ansi --border --reverse --preview-window 'right:75%' --preview 'bat --color=always --theme OneHalfDark {}'"

# Utils
## Take a screenshot of Android
screenshot() {
    adb shell screencap -p /sdcard/$1.png && adb pull /sdcard/$1.png
}

# glogs - git commit browser
browseGitLog() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --header "Press CTRL-S to toggle sort" \
      --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                 xargs -I % sh -c 'git show --color=always % | head -$LINES'" \
      --bind "enter:execute:echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
              xargs -I % sh -c 'vim fugitive://\$(git rev-parse --show-toplevel)/.git//% < /dev/tty'"
}

## H highlight output
#. ~/h.sh

# Exports
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export REACT_EDITOR="code-insiders"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ZPlug - Setup
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# ZPlug - Plugins list
zplug "jhawthorn/fzy", as:command, rename-to:fzy, hook-build:"make && sudo make install"
zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh
zplug "mafredri/zsh-async"
zplug "seletskiy/zsh-fuzzy-search-and-edit"
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

#bindkey '^P' fuzzy-search-and-edit

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set theme prompt
autoload -U promptinit; promptinit
#prompt spaceship
prompt pure

# Settings
export BAT_STYLE="full"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Location of .zshrc
if [[ "$(uname)" == "Darwin" ]]; then
    DIR="$(cd "$(dirname "$(greadlink -f "${(%):-%N}")")" && pwd)"
else;
    DIR="$(cd "$(dirname "$(readlink -f "${(%):-%N}")")" && pwd)"
fi


ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rm="rm -i"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(python svn)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/share/doc/git/contrib/workdir:$PATH
export PATH=$DIR/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

alias mp="mplayer"
alias ack="ack-grep"
alias gg='git grep'
alias ag='ag --pager=less'

# Share history across shells
setopt inc_append_history
setopt share_history
setopt HIST_FIND_NO_DUPS

# Don't allow group write
umask 022

# vi mode
#bindkey -v

# rehash autocomplete index on autocomplete
zstyle ":completion:*:commands" rehash 1

# Do case-insensitive completion without the .,_ behavior
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'

alias mru="vim -c \"MRU\""

# Go to the root of a source repo
cdr() {
    cwd=$PWD
    while [[ ( ! -d "$PWD/.git" && ! -d "$PWD/.svn" ) && "$PWD" != "/" ]]; do
        cd ..
    done
    if [[ $PWD == "/" ]]; then
        print "Not within a git or svn repo?"
        cd "$cwd"
    fi
}

if [[ $TILIX_ID ]]; then
    source /etc/profile.d/vte.sh
fi

source $HOME/.zshrc.local


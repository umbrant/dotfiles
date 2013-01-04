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
plugins=(git mvn python ssh-agent svn)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/local/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/sbin:/usr/sbin:/usr/local/sbin:/usr/share/doc/git/contrib/workdir

alias mp="mplayer"
alias ack="ack-grep"

# Share history across shells
setopt inc_append_history
setopt share_history

# Don't allow group write
umask 022

# vi mode
#bindkey -v

# rehash autocomplete index on autocomplete
zstyle ":completion:*:commands" rehash 1

# Run keychain
keychain -q $HOME/.ssh/id_rsa
source ~/.keychain/$HOST-sh

source $HOME/.zshrc.local

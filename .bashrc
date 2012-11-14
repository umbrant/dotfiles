#!/bin/bash -x

# This file is sourced by all *interactive* bash shells on startup.  This
# file *should generate no output* or it will break the scp and rcp commands.

# First off, source the global bashrc file
source /etc/bash.bashrc

# Add keychain also
source ~/.keychain/`hostname`-sh > /dev/null

# Add root and local dirs to PATH
PATH=~/local/bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin:~/local/lejos_nxj/bin
#NXJ_HOME=~/local/lejos_nxj

export LIBXCB_ALLOW_SLOPPY_LOCK=true
export TERM="xterm-256color"

export EC2_PRIVATE_KEY=$HOME/aws-creds/awang.jellyfish.key.pem
export EC2_CERT=$HOME/aws-creds/awang.jellyfish.cert.pem

# Set unicode font
LANG="en_US.utf8"

# Bash history options
export HISTIGNORE=ignoredups	# Don't remember duplicate lines
export HISTIGNORE="&:[ ]*:exit" # ignore trash lines
export HISTCONTROL=ignoreboth # ignore more dups
export HISTSIZE=1000000		# Number of lines to remember
export HISTFILESIZE=1000000000		

# colors for ls, etc.
#eval `dircolors -b /etc/DIR_COLORS`
alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -lhtrF"
alias rm="rm -i"
alias mp="mplayer"
alias ack="ack-grep"

alias lc="cl"
function cl() {
    if [ $# = 0 ]; then
        cd && ls
    else
        cd "$*" && ls
    fi
}

# Change the prompt
if [ ${UID:-0} -ne 0 ] ; then
    PS1="\[\033[G\]\[\e[0;36m\]\u\[\e[1;30m\]::\[\e[0;34m\]\h\[\e[1;34m\] \W \[\e[1;34m\]\$ \[\e[0;0m\]"
fi

# Change the window title of X terminals 
case $TERM in
	xterm*|rxvt|rxvt-unicode|Eterm|eterm|aterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}::${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

##uncomment the following to activate bash-completion:
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
shopt -s cdspell
shopt -s dirspell
shopt -s checkwinsize

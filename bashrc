# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# System wide functions and aliases
# Environment stuff goes in /etc/profile

# By default, we want this to get set.
umask 002

# are we an interactive shell?
if [ "$PS1" ]; then
    case $TERM in
	xterm*)
		if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
			PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
		else
	    	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
		fi
		;;
	screen)
		if [ -e /etc/sysconfig/bash-prompt-screen ]; then
			PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
		else
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\033\\"'
		fi
		;;
	*)
		[ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
	    ;;
    esac
    # Turn on checkwinsize
    shopt -s checkwinsize
    # set prompt
	PS1="[\u@\h \W]\\$ "
fi

if ! shopt -q login_shell ; then # We're not a login shell
	# Need to redefine pathmunge, it get's undefined at the end of /etc/profile
    pathmunge () {
		if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
			if [ "$2" = "after" ] ; then
				PATH=$PATH:$1
			else
				PATH=$1:$PATH
			fi
		fi
	}

	if [ -d /etc/profile.d/ ]; then
		for i in /etc/profile.d/*.sh; do
			if [ -r "$i" ]; then
				. $i
			fi
		unset i
		done
	fi
	unset pathmunge
fi

# system path augmentation
test -f /afs/bx.psu.edu/service/etc/env.sh && . /afs/bx.psu.edu/service/etc/env.sh

# make afs friendlier-ish
if [ -d /afs/bx.psu.edu/service/etc/bash.d/ ]; then
	for file in /afs/bx.psu.edu/service/etc/bash.d/*.bashrc; do
	. $file
	done
fi

alias ls='ls --color'
LS_COLORS='di=38;5;27:fi=0:ln=38;5;51:or=48;5;232:mi=0:ex=35:*.fa=91:*.gz=90:*.sam=91:*.bam=38;5;15:*.tar=32'
export LS_COLORS
alias la='ls -al'


#!/bin/bash

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# restore last saved path
if [ -f ~/.last_dir ]; then
    cd `cat ~/.last_dir`
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Add an "alert" alias for long running commands.  Use like so:
#	sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [[ -f /usr/share/bash-completion/bash_completion ]]; then
		# shellcheck source=/dev/null
		. /usr/share/bash-completion/bash_completion
	elif [[ -f /etc/bash_completion ]]; then
		# shellcheck source=/dev/null
		. /etc/bash_completion
	fi
fi
for file in /etc/bash_completion.d/* ; do
	# shellcheck source=/dev/null
	source "$file"
done

if [[ -f "${HOME}/.bash_profile" ]]; then
	# shellcheck source=/dev/null
	source "${HOME}/.bash_profile"
fi

sleep 0.2
clear

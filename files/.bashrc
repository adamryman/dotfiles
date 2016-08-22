# Source settings {{{ -----------------------------------------------------
source $HOME/.config/dotfiles/enabled.sh
# }}}
# Bin Path {{{ -----------------------------------------------------------
# Use binaries in $HOME/bin over all other binaries
if [ -d "$HOME/bin" ]; then 
    PATH=$HOME/bin:$PATH
fi
# }}}
# History {{{ -----------------------------------------------------------

# Append to the history file, don't overwrite it
# The history file is normally in memory until shell closes
shopt -s histappend

# Sets history to be 100,000 lines
# unlimited would be optimal, but incompatibility
# 100,000 unique lines is a lot too

# See $ man bash
# \HISTFILESIZE<CR>
# \HISTSIZE<CR>n
HISTFILESIZE=100000
HISTSIZE=100000

# Avoid duplicates
# Erase all previous entries of a command before adding
export HISTCONTROL=ignoredups:erasedups

## Bash up arrow search completion
## http://askubuntu.com/questions/59846/bash-history-search-partial-up-arrow
## arrow up search through history
bind '"\e[A":history-search-backward'
## arrow down
bind '"\e[B":history-search-forward'

# NOTE: See .inputrc for "Tab" completiton
# and 'j' and 'k' completion in vi mode
# }}} 
# Completions {{{ -----------------------------------------------------------
# If the appropriate bash_completion file exists, then source it!
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi
# }}}
# PS1 {{{ -----------------------------------------------------------
# Defining colors for prompt
# Leland Batey's
bold='\e[1;39m'
orange='\e[38;5;208m'
red='\e[0;31m'
green='\e[0;32m'
bright_green='\e[1;32m'
yellow='\e[1;33m'
blue='\e[1;34m'
cyan='\e[0;36m'
purple='\e[0;35m'
reset='\e[0m'

# My Colors
# to list possible colors
function all_colors {
	for C in {0..255}; do  tput setab $C;  echo -n "$C "; done
	echo
}

# color = "\e[38;5;XXXm
# where XXX is the color code
# http://misc.flogisoft.com/bash/tip_colors_and_formatting
#light_red='\e[38;5;161m'
#light_blue='\e[38;5;81m'
light_green='\e[38;5;118m'
#light_orange='\e[38;5;202m'

# Functions in bash don't seem to really "return" anything. The only way to get
# a message out of them is to have them print data, then to capture that data
# via command substitution. That is what we do here.

# Bash/shell escaping is wierd. I am going to just write down a few things I have learned
# http://wiki.bash-hackers.org/syntax/pe

# http://wiki.bash-hackers.org/scripting/style

# The most important things I have learned.
# Always call functions and programs via $() when they are part of another command
# Always get vars via "${FOO}" WITH QUOTES

function get_git_top_path {
	top_path=$(git rev-parse --show-toplevel 2> /dev/null) || return
	echo $top_path
}

function git_top {
	echo $(get_git_top_path)
}

function get_repo_path {
	repopath=$(git rev-parse --show-toplevel 2> /dev/null)
	echo $repopath
}

function get_repo_name {
	repo=$(basename $(get_repo_path) 2> /dev/null) || return
	echo "("$repo")"
}

function get_git_branch {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo ""
	echo "("${ref#refs/heads/}")"
}

user="\[$cyan\]\u\[$reset\]"
host="\[$purple\]\h\[$reset\]"
#path="\[$green\]\w\[$reset\]"
path="\[$light_green\]\W\[$reset\] \[$green\]\w\[$reset\]"
cur_branch="\[$bright_green\]\$(get_git_branch)\[$reset\]"
cur_repo="\[$red\]\$(get_repo_name)\[$reset\]"
line_join="\[$yellow\]@\[$reset\]"

export PS1="$user$line_join$host\n$path $cur_branch $cur_repo\n$ "
# }}} 
# Functions {{{ -----------------------------------------------------------

# This function allows to to compare two files using git's diff config
# These files do not need to be in git repos
# You can pipe this into anything and have the output be nice
function diffc {
	git --no-pager diff --color=always --no-index "${1}" "${2}"
}

# search google with w3m
function google {
        IFS="+"
        export query="${@}"
        w3m http://google.com/search?q="${query}"
}

# swap a program in with the current terminal in i3
function swap {
	echo "${@}"
	swap_command="${@}"
	"${swap_command}" & disown; sleep 0.6; exit
}
# }}} 
# Colors {{{ -----------------------------------------------------------

alias ls="ls --color=auto --group-directories-first"
export TERM="xterm-color"

# }}}
# Misc {{{ -----------------------------------------------------------

# bash vim mode
set -o vi

# ssh keychain
# Note, this only adds the ssh key 'id_rsa',
# I need a solution for multiple keys that may differ on different machines
if which keychain > /dev/null; then
	eval `keychain --quiet --eval --agents ssh id_rsa`
fi

# This loads nvm the node version manager
export NVM_DIR="/home/adamryman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# hub is a git wrapper that gives nice github commands
if which hub > /dev/null; then
	alias git=hub
fi

# }}} 
# Aliases {{{ -----------------------------------------------------------
# some more ls aliases
alias l='ls -1'
alias la='ls -la'

# Less with color and cancling if it will not scroll the terminal
alias lesss='less -XFR'

# Tree into less with color
alias treee='tree -C | less -XRF'

# make and pipe both stdout and stderr to less with color
alias makel='make 2>&1 | less -XFR'

# agl passes ag's output to less with color
alias agg='ag --pager="less -XFR"'

alias cppwd='pwd | tr "\n" " "  | xsel -i -b'

alias note="vim $(date +%s).md"

alias clean='make clean'

# Local Alias definitions.
if [ -f ~/.config/dotfiles/bash_aliases.sh ]; then
    . ~/.config/dotfiles/bash_aliases.sh
fi
# }}} 
# Path {{{ -----------------------------------------------------------

export projects=$HOME/projects

# GOOOOOOOO
export GOPATH=$projects/go
export GOCODE=$GOPATH/src

# Add go bins to path
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# }}} 
# Fold on opening for organization
# vim:foldmethod=marker:foldlevel=0

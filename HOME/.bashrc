# Source settings {{{ -----------------------------------------------------
source $HOME/.config/dotfiles/enabled.sh
# }}}
# Bin Path {{{ -----------------------------------------------------------
# Use binaries in $HOME/bin over all other binaries
if [ -d "$HOME/bin" ]; then
	# Use scripts too. See $HOME/dotfiles/scripts/update-scipts.sh
	if [ -d "$HOME/bin/scripts" ]; then
		PATH=$HOME/bin/scripts:$PATH
	fi
    PATH=$HOME/bin:$PATH
fi
# }}}
# Exports {{{ -----------------------------------------------------------
export projects=$HOME/projects

# Golang
export GOPATH=$projects/go
export GOCODE=$GOPATH/src

export EDITOR="vim"

# Add go bins to path
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin
# }}}
# History {{{ -----------------------------------------------------------

# Set history length in bash
# See $ man bash
# \HISTFILESIZE<CR>
# \HISTSIZE<CR>n
HISTSIZE=9999999
HISTFILESIZE=9999999

# Avoid duplicates
export HISTCONTROL=erasedups
#export HISTTIMEFORMAT="%s "
export PROMPT_COMMAND="history -a"
if which go_history >/dev/null; then
	export PROMPT_COMMAND="history -a;go_history -r"
fi

# cmdhist
# If set, bash attempts to save all lines of a multiple-line command
# in the same history entry. This allows easy re-editing of multi-line
# commands.
shopt -s cmdhist

# histappend
# If set, the history list is appended to the file named by the value of the
# HISTFILE variable when the shell exits, rather than overwriting the file.
shopt -s histappend
shopt -s lithist

# Debug history
echo "$(echo -n ".bash_history"; cat ~/.bash_history | wc; echo -n ".bash_history|uniq"; cat ~/.bash_history | sort | uniq | wc; echo -n "go_history"; go_history | wc; echo -n "go_history|uniq"; go_history | sort | uniq | wc)" | column -t


# histreedit
# If set, and readline is being used, a user is given the opportunity to
# re-edit a failed history substitution.
#shopt -s histreedit

# See $HOME/.inputrc for more history options

# TODO: Move to .inputrc
## Bash up arrow search completion
## http://askubuntu.com/questions/59846/bash-history-search-partial-up-arrow
## arrow up search through history
bind '"\e[A":history-search-backward'
## arrow down
bind '"\e[B":history-search-forward'

# NOTE: See $HOME/.inputrc for "Tab" completiton
# and 'j' and 'k' completion in vi mode
# }}}
# Completions {{{ -----------------------------------------------------------
# If the appropriate bash_completion file exists, then source it!
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# globstar: If set, the pattern ** used in a pathname expansion context will match all files  and  zero  or  more
# directories  and subdirectories.  If the pattern is followed by a /, only directories and subdirectories match.
shopt -s globstar

# source external
if [ ! -r ~/.git-completion.bash ]; then
	echo "downloading .git-completion.bash"
	curl -s 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash' > ~/.git-completion.bash
fi
source ~/.git-completion.bash
if [ ! -r ~/.aws-completion.bash ]; then
	echo "downloading .aws-completion.bash"
	curl -s 'https://raw.githubusercontent.com/aws/aws-cli/master/bin/aws_completer' > ~/.aws-completion.bash
fi
complete -c '~/.aws-completion.bash' aws

if [ ! -r ~/.docker-compose-completion.bash ]; then
	curl -sl "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose" > ~/.docker-compose-completion.bash
fi
source ~/.docker-compose-completion.bash

# }}}
# Colors {{{ -----------------------------------------------------------

# Applications that check the TERM var will see 256 color support
export TERM="xterm-256color"
# case "$TERM" in
    # xterm-color) color_prompt=yes;;
# esac

# This gives colors to tree and ls
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

alias ls="ls --color=auto --group-directories-first"


# to list possible colors
function all_colors {
	for C in {0..255}; do  tput setab $C;  echo -n "$C "; done
	echo
}

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

blame() {
	ag -l $1 | \
		while read file; do
			echo $file
			ag $1 --numbers $file | sed 's|:.*||' | while read line;
				do git blame -L $line,$line $file;
			done;
			echo
		done
}
# }}}
# More Functions {{{ -----------------------------------------------------------

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

# cd to the top dir of a git project
function cdgit {
	repopath=$(git rev-parse --show-toplevel 2> /dev/null)
	cd $repopath
}

# go to the go package
function cdgo {
	dir=$(go list -e -f={{.Dir}} "$1")
	cd $dir
	if [[ $dir == $HOME ]]; then
		cd $GOPATH/src;
	fi
}

function gitnow {
	GIT_COMMITTER_DATE="`date`" git commit --amend --date "`date`";
}
# }}}
# Aliases {{{ -----------------------------------------------------------

# clipboard
alias vv='xclip -o -sel clip'

# clear for tmux without removing scrollback
alias clear="printf '\033[2J\033[H'"

# some more ls aliases
alias l='ls -1'
alias la='ls -la'
# Prints permissions in octal number format
# 664 -rw-rw-r-- 1 adamryman adamryman 6529 Oct 13 16:41 .bashrc
alias lch="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/) \
             *2^(8-i));if(k)printf(\"%0o \",k);print}'"
alias lach="la -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/) \
             *2^(8-i));if(k)printf(\"%0o \",k);print}'"

# Less with color and cancling if it will not scroll the terminal
alias lesss='less -RXF'

# Tree into less with color
alias treee='tree -C | less -XRF'

# make and pipe both stdout and stderr to less with color
alias makel='make 2>&1 | less -XFR'

# agl passes ag's output to less with color
alias agg='ag --pager="less -XFR"'

alias cppwd='pwd | tr "\n" " "  | xsel -i -b'

alias note="vim $(date +%s).md"

alias clean='make clean'

# Gooooo
# q.Q ->  https://github.com/y0ssar1an/q
alias qq=". $GOPATH/src/github.com/y0ssar1an/q/q.sh"
alias rmqq="rm /tmp/q"

alias battlestation="xrandr --output HDMI-1 --mode 2560x1440 --pos 0x0 --rotate normal --output eDP-1 --primary --mode 1920x1080 --pos 2560x360 --rotate normal"

# something about putting aliases in xargs
p () {
	echo "$1" | tr ':' ' ' | xargs clput
}

# something about putting aliases in xargs
x () {
	# if alias
	alias $1 2>/dev/null 1>/dev/null && \
		alias $1 2>/dev/null | cut -d "'" -f 2 \
	|| type $1 | tail -n +4 | head -n -1
}

# python
alias vnv="source $HOME/bin/venv3/bin/activate"


# Local Alias definitions.
if [ -f ~/.config/dotfiles/bash_aliases.sh ]; then
    . ~/.config/dotfiles/bash_aliases.sh
fi

# format json in clipboard
alias fmtj='xclip -o -sel clip | jq . | sponge | xclip -i -sel clip'
# format sql in the clipboard
alias fmtsql='sqlformat --reindent --keywords upper  <(xclip -o -sel clip) | sponge | xclip -i -sel clip'

# web server
alias httpserver='python -m SimpleHTTPServer'

alias f='vim'
alias j='cd'

alias snip="(set -x; xclip -o -sel clip; xclip -o -sel clip | lab snip -g create)"

alias db="HOME=$HOME/.dropbox-data/ dropbox"

# }}}
# Path {{{ -----------------------------------------------------------

# pyenv
if test -x $HOME/.pyenv/bin/pyenv > /dev/null; then
	export PATH=$PATH:$HOME/.pyenv/bin

	# pyenv from @zaquestion
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

# add pip bins to path
export PATH=$PATH:$HOME/.local/bin

# add screenlayouts
export PATH=$PATH:$HOME/.screenlayout

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# }}}
# Local - after {{{ -----------------------------------------------------------
if [[ ! -f $HOME/.config/dotfiles/bash_after.sh ]]; then
	touch $HOME/.config/dotfiles/bash_after.sh;
fi
source $HOME/.config/dotfiles/bash_after.sh
# }}}
# In flight {{{---------------------------------------------------------------

#red_wrong='\e[38;5;196m'
#dollar="`if [ \$? == 0 ]; then echo 'true'; else echo 'poo'; fi`"

#function last_command_status {
	#LASTEXIT="$?"
	##echo "\$"
	#if [ "$LASTEXIT" == "0" ]; then
		##echo "$red_wrong\$$reset"
		#echo "true"
	#else
		##echo "\$"
		#echo "false"
	#fi
#}
# }}}
# Misc {{{ -----------------------------------------------------------

# bash vim mode
set -o vi


# This loads nvm the node version manager
export NVM_DIR="/home/adamryman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# hub is a git wrapper that gives nice github commands
if which hub > /dev/null; then
	alias git=hub
fi

# set keyboard repeat rate and delay
xset r rate 250 100

# ssh keychain
# Note, this only adds the ssh key 'id_rsa',
# I need a solution for multiple keys that may differ on different machines
if which keychain > /dev/null; then
	eval `keychain --quiet --eval --agents ssh id_rsa` || true
fi

# }}}
gophersay You can do anything
# Fold on opening for organization
# vim:foldmethod=marker:foldlevel=0

complete -C /home/adamr/bin/terraform terraform

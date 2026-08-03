# Source settings {{{ -----------------------------------------------------
source $HOME/.config/dotfiles/enabled.sh
# }}}
# Clipboard {{{ -----------------------------------------------------
#if [ "$DOTFILES_X" = "1" ]; then
#	if which autocutsel > /dev/null; then
#		autocutsel & autocutsel -s PRIMARY &
#	fi
#fi
# }}}
# bashrc for nonlogin {{{ -----------------------------------------------------
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#        . "$HOME/.bashrc"
#    fi
#    if [ -f "$HOME/.local/bin/bashmarks.sh" ]; then
#        . "$HOME/.local/bin/bashmarks.sh"
#    fi
#fi
## }}}


# Fold on opening for organization
# vim:foldmethod=marker:foldlevel=0
if [ -d "$HOME/bin" ] ; then
	for dir in $(ls -d $HOME/bin/*/); do
		PATH="$dir:$PATH";
	done
    PATH="$HOME/bin:$PATH"
fi

# for tmux loading bashrc only on an interactive shell
# https://unix.stackexchange.com/a/541352
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

source "$HOME/.cargo/env"

# Added by LM Studio CLI tool (lms)
if [ -d "/home/adamryman/.lmstudio/bin" ]; then
    export PATH="$PATH:/home/adamryman/.lmstudio/bin"
fi

if [ -f "/home/adamryman/.local/share/bob/env/env.sh" ]; then
    . "/home/adamryman/.local/share/bob/env/env.sh"
fi

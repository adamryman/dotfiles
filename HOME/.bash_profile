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
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
    if [ -f "$HOME/.local/bin/bashmarks.sh" ]; then
        . "$HOME/.local/bin/bashmarks.sh"
    fi
fi
# }}}


# Fold on opening for organization
# vim:foldmethod=marker:foldlevel=0

# Source settings {{{ -----------------------------------------------------
source $HOME/.config/dotfiles/enabled.sh
# }}}
# Clipboard {{{ -----------------------------------------------------
if [ "$DOTFILES_X" = "1" ]
	autocutsel & autocutsel -s PRIMARY &
fi
# }}}

# Fold on opening for organization
# vim:foldmethod=marker:foldlevel=0

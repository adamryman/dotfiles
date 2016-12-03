# Source settings {{{ -----------------------------------------------------
source $HOME/.config/dotfiles/enabled.sh
# }}}
# Clipboard {{{ -----------------------------------------------------
if [ "$DOTFILES_X" = "1" ]; then
	if which autocutsel > /dev/null; then
		autocutsel & autocutsel -s PRIMARY &
	fi
fi
# }}}

# Fold on opening for organization
# vim:foldmethod=marker:foldlevel=0

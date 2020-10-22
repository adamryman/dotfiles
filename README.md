# dotfiles

My dotfiles.

Thanks [@zaquestion](https://github.com/zaquestion/dotfiles) for all the good starting points.

Have learned tips and tricks from [@lelandbatey](https://github.com/lelandbatey/dotfiles) as well.

## Install
```
curl https://raw.githubusercontent.com/adamryman/dotfiles/master/pipe_to_shell.sh | sh
```

### Install scripts after install
```
$HOME/dotfiles/scripts/update-scripts.sh
```

### TODO
- [ ] Figure out a way to keep different env dotfiles all in master and not conflict
	- [ ] High DPI
		- [ ] .Xresources
	- [ ] Windows
		- [ ] tmux copy/paste
		- [ ] vim copy/paste
		- [ ] bash_after.sh env variables?

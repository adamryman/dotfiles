# human information

```
// Show how much space files and directories (plus all children) take
du -sh * | sort -hr
```

### Cool emojis / kaomoji
```
// gopher!
\ʕ◔ϖ◔ʔ/

// shrug
 ¯\_(ツ)_/¯

```

# Linux

## Suspend

http://askubuntu.com/questions/1792/how-can-i-suspend-hibernate-from-command-line

```
systemctl suspend
```

## fonts on linux

`sudo fc-cache -f -v`
`fc-list`

Check out `etc/fonts/fonts.conf` for all the info.

## tmux
```
tmux list-clients -F "#{client_activity} #{pane_current_path}" | sort -r | awk '{ print $2 }'
```

## i3 

If you exec things that send key input they need to be on a release
```
# sends a null byte
bindsym --release Mod1+Shift+b exec "xdotool key ctrl+shift+at
```



# Golang

### Gofonts

If you download the fonts at: `git clone https://go.googlesource.com/image`
then the fonts will be in `image/font/gofont/ttfs` and the names will be
`Go-Mono.ttf Go-Bold.ttf etc...` BUT the actual names of the fonts do not have
dashes in them when you add them to things.
=======
## Github

Add `w=1` to a github diff url query and get the diff without showing whitespace diffs

## vim

Get spelling suggestions with `i_Ctrl-X_Crtl_K`

## Removing symlinks dirs

```
# this works
rm foo
# versus
rm foo/
```


# human information

```
// Show how much space files and directories (plus all children) take
du -dh1 2>/dev/null | sort -hr
```

### Cool emojis / kaomoji
``` // gopher!  \ʕ◔ϖ◔ʔ/

// shrug
 ¯\_(ツ)_/¯

```

# Linux

## Add swap after install - easy
https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04

```
sudo fallocate -l 16G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

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
## netstat

```
netstat -tulpn
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

=======

## vim

Get spelling suggestions with `i_Ctrl-X_Crtl_K`

# git

Update commit date and author date

```
GIT_COMMITTER_DATE="`date`" && git commit --amend --date "$GIT_COMMITTER_DATE" --no-edit
```

## Make a shared git repository
```
git config core.sharedRepository group # or whatever other sharing option
```
- fix the setgid bit
```
find . -type d | xargs chmod g+s
```
- repair the permissions
```
chmod -R g+rw repo/
```

## wut weird vim scripting

Basically use vim in a pipeline, but bad

Maybe this will help http://blog.robertelder.org/use-vim-inside-a-unix-pipe-like-sed-or-awk/

```
FOOBAR=$(mktemp -d) rm ${FOOBAR}/tmp && godoc github.com/adamryman/kit/dbconn | vim -V0 -c "normal 4ddGI    " -c "saveas ${FOOBAR}/tmp"   -c "wq!" --headless - 2>1 > /dev/null; cat ${FOOBAR}/tmp
```

## Colors???


for directory / link / executable colors

https://www.howtogeek.com/307899/how-to-change-the-colors-of-directories-and-files-in-the-ls-command/

```
echo $LS_COLORS
```
```
dircolors
```

.Xresources?
building `st` vs `xterm`?




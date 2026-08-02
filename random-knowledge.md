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


## list all directories in current directory
```
ls -d "./*/"
```

## redirect subshells as files


```
cat <(echo 'a') <(echo 'c')

a
c
```


## jq with env vars

```
ENVVAR="foo"; echo '{ "hello": "world" }' | jq --arg hello $ENVVAR '.hello |= $hello'

{
  "hello": "foo"
}
```


## jq input with lines that are not json still printing

```
cat <(echo '
notjson
"json"
{"json": "object"}
brolen

{"foo": "bar"}') | tee /dev/tty | jq -R 'fromjson?'
```


```
cat <(echo '
notjson
"json"
{"json": "object"}
brolen

{"foo": "bar"}') |  | jq -R 'fromjson?'
```

## run another command with json as arg with env var

```
DT='2021-11-04-22'
aws lambda invoke --log-type Tail --function-name foo_bar --payload  "$(jq -n -r --arg dt "$DT" ' .dt |= $dt ')" - | jq -r .LogResult | base64 -d
```


## git branches with dates last modified

```
2023-02-02 15:47:18 -0800 5 days ago      aryman/nomad-backup-2
2023-02-02 16:07:21 -0800 5 days ago      aryman/2023-02-01-guards
2023-02-07 09:37:40 -0800 62 minutes ago          aryman/2023-flag_config_updates
2023-02-07 10:34:10 -0800 5 minutes ago   aryman/nomad-backup-1
2023-02-07 18:31:22 +0000 8 minutes ago   documentation8
```

## use seq to page through an api

```
seq 4 | xargs -I {} curl -s --header "PRIVATE-TOKEN: $GITLAB_ACCESS_TOKEN" "https://gitlab.com/api/v4/projects/123/jobs?scope[]=failed&per_page=100&page={}" | jq '.[] | select(.name == "qa_s-s0") | .id' | xargs -I {} curl -s --header "PRIVATE-TOKEN: $GITLAB_ACCESS_TOKEN" "https://gitlab.com/api/v4/projects/123/jobs/{}/trace" | grep FAIL: | sed 's|(.*)||' | sort | uniq -c | sort -h -r 
```


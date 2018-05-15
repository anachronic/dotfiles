# dotfiles

Good ol' dotfiles.

## Symlinks

### Folders

* .zsh
* All directories in .config to their names

### Files

* .tmux.conf
* .zshrc
* .zshenv
* .bashrc (legacy)

## Installs

* ruby and rubygems
* tmux

## OS

These dotfiles should work pretty well with Arch Linux provided you install some
deps (I might be missing some): `zathura, nodejs, npm, rxvt-unicode,
urxvt-perls, zsh, ranger, neovim, feh`.

Keyboard layout is US with altgr-intl option.

## WM

`i3wm` with `i3-gaps`. Bar on top is `polybar`, network is ran by
`NetworkManager`.

## Launcher

I considered [rofi](https://github.com/DaveDavenport/rofi) at first and it
worked great. In fact I still have it bound in my i3 config. I've recently
discovered [albert](https://albertlauncher.github.io/), which has many plugins
and most of all, solves my search problem, so i'll be using that instead.

## Neovim

I'm using neovim this time. More on this later

## Ranger

Ranger should work pretty well with `neovim`, `zathura` and `feh`. It requires
`zsh` to be installed if you use the `S` key.

## Music

`spotify`(AUR) with `playerctl`.

## Mail auth and related

We'll be handling key stuff with `gnupg` and `PAM` with this
[very nice package](https://github.com/cruegge/pam-gnupg).

```
$ aurin pam-gnupg-git  # aurin is alias for favorite AUR manager
$ echo YOURPASSWORD > ~/.mailpass  # set your mail password
$ gnupg -r YOURKEYS@E.MAIL --encrypt ~/.mailpass  # encrypt it
$ shred -u ~/.mailpass  # get rid of it
```

Then edit `/etc/pam.d/lightdm` and add:
```
auth     optional  pam_gnupg.so
session  optional  pam_gnupg.so
```
At the end of the file. This only if you're using `lightdm`.

Then for your screen lock (mine in `/etc/pam.d/i3lock`):
```
auth     optional  pam_gnupg.so
```

For ubiquitous availability, create `~/.gnupg/gpg-agent.conf` if it doesn't
exist and add the line (again, if it doesn't exist)

```
allow-preset-passphrase
max-cache-ttl 34560000
```

The `max-cache-ttl` value is for one year, which pretty much means your key
should be cached for the entirety of your session.

Finally, tell which keys you want `pam-gnupg` to cache by creating the file
`~/.pam-gnupg` and adding the keygrip.

Look the keygrip by running the following:
```
gpg -K --with-keygrip
```

As far as I know, it suffices to take the one with the `[E]` flag.


## External drives

External drives are automounted with
[udiskie](https://github.com/coldfix/udiskie), files can then be browsed with
[ranger](https://github.com/ranger/ranger) in `/run/media/$USER`.

```
$ pacman -S udiskie
```

Then it's enough to add an entry to the `i3/config` file like so:
```
exec --no-startup-id udiskie --smart-tray
```

The `--smart-tray` option will make it not show on the tray if there's nothing
plugged.

We can then browse `/run/media/` for mounted drives and use the tray application
to eject them.

## MIME

By default, regular `i3` doesn't add anything to the `xdg-mime` database. This
makes it so that if you open, say, a directory, from within `chromium` or with
`albert`, They don't open with the right application. To set all the
applications we can run:

```
$ xdg-mime default ranger.desktop inode/directory
$ xdg-mime default org.pwmt.zathura.desktop application/pdf
$ xdg-mime default transmission-remote-magnet.desktop x-scheme-handler/magnet
```

Note that processes that have already picked up the database won't notice these
changes. You might need to restart them. Most crucial example here is Albert.

### A word on magnet links

Magnet is a little bit complicated on torrents because we're running a daemon on
the background which handles all magnet links (`transmission-daemon` provided by
the `transmission-cli` package). We need to create a desktop file which can
redirect magnet links to `transmission-remote` in order to add magnet links. For
this to work we only require that `~/dotfiles/bin/` is in the path and symbolic
or hard links to the `.config` and `.local` folders are created. It works very
well when `transmission-daemon` is already running, but behavior might be
unexpected when that's not running.

## Git caching

Caching is a bit of a pain in the ass when it comes to ssh keys. This
is what I expect to happen with this:

1. I want to have my private ssh key encrypted on disk
2. I want to *only* enter my password one time
3. Value should remain cached for at least 2 hours.

There are two scenarios where I want this to happen:

1. zsh
2. Magit

The setup described below allows me to share cached ssh keys between
those two.

### For `zsh`

There are instructions in the Arch Wiki for this
[here](https://wiki.archlinux.org/index.php/SSH_keys#SSH_agents), but
they are a little convoluted, so here's how to do it.

First, spawn **one** and only one `ssh-agent` when the WM/DE is
started. The following is in my `.profile`:

``` shell
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi
```

Next we need to tell `ssh-agent` that we want to cache our password,
but this is tricky. I don't want to unlock my password at the start of
the session. Instead, I'd like it to be cached from the moment I enter
it for the first time onwards. This can be achieved by adding the
following line to `~/.ssh/config`:

``` shell
AddKeysToAgent yes
```

That would be it for shell. Still need a way to figure out the time
caching, but this solves my most urgent problem for now.

### For `magit`

Oh boy, was this one hard to tackle.

All we ever need is `exec-path-from-shell` package and to get the
variables set by the ssh onto the shell into emacs. That's done via
these lines:

``` emacs-lisp
(exec-path-from-shell-copy-env "SSH_AGENT_PID")
(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")
```

This works **as long as the `ssh-agent` process was started by a
parent of the current emacs process**. In my case, that would be `i3`,
which executed albert, which is how I usually open emacs.

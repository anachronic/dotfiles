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
```

Note that processes that have already picked up the database won't notice these
changes. You might need to restart them. Most crucial example here is Albert.

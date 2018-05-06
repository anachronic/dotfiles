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

Ranger should work pretty well with `neovim`, `zathura` and `feh`.

## Music

`spotify`(AUR) with `playerctl`.

## Mail auth and related

We'll be handling key stuff with `gnupg` and `PAM`. There is a 
[very nice package](https://github.com/cruegge/pam-gnupg) that ties these two
funcionalities together, allowing us to use pam with gnupg and assume the
passwords are known when user is logged in. We can also kill the `gpg-agent`
when screen is locked. Works flawlessly with the instructions.

## External drives

External drives are automounted with
[udiskie](https://github.com/coldfix/udiskie), files can then be browsed with
[ranger](https://github.com/ranger/ranger) in `/run/media/$USER`.

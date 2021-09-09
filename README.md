# dotfiles

Ok, yet another dotfiles repo. Here's the deal

- I use mostly neovim for **actually editing code**
- Terminal is kitty, because it has undercurl. Period
- I use extensively: python stuff, node stuff and soon ruby stuff
- I have a Linux machine at home. This repo serves as dotfiles for all my
machines, that means it installs both Linux and macOS dotfiles
- Installer script is *mostly* updated.
- There are still legacy packages lying around (like fish). Well, maybe not
legacy, just not that used, I guess, I still use fish when I need a private
session as `fish --private` is WAY better than what `zsh` has to offer

## What's still missing to automate

- Brewfile/pacman autoinstall
- Installation of external tools like dwm/dmenu
- Installer script should be started after having ruby/stow in the system
- Extra tools setup: nvm needs to install stuff globally, so do rbenv and pipx.

There's still a lot more to do here, but I'm fairly confident that this is
**better** than what I had before explaining everything.

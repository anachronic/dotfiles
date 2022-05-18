# dotfiles

![neovim pipeline](https://github.com/anachronic/dotfiles/actions/workflows/neovim.yml/badge.svg)

Ok, yet another dotfiles repo. Here's the deal

- I use mostly neovim for **actually editing code**
- This repo requires neovim >= 0.7.x
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

## Notes without a place

### Neovim

I've been using modules for neovim plugins. It makes the checkout process much
better. But it has some **very** annoying caveats:

- Deleting a plugin
- Trying out new plugins
- Updating plugins

> For deleting a plugin: `./rmplugin <plugin_name>` ([source](https://stackoverflow.com/a/36593218))

> For trying out: `./addplugin <git url>` (self-made)

> For update: `git submodule foreach "git pull origin main || git pull origin master"`

That should do it

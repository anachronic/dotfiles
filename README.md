# dotfiles

![neovim pipeline](https://github.com/anachronic/dotfiles/actions/workflows/neovim.yml/badge.svg) ![neovim pipeline](https://github.com/anachronic/dotfiles/actions/workflows/shell.yaml/badge.svg)

Ok, yet another dotfiles repo. Here's the deal

- I use mostly neovim for **actually editing code**
- This repo requires neovim >= 0.8
- Terminal is shaky right now: st in Linux, Alacritty in macOS (being reconsidered)
- I use extensively: python, yaml, node and lua
- I have a Linux machine at home. This repo serves as dotfiles for all my
machines, that means it installs both Linux and macOS dotfiles
- Installer script is *mostly* updated.

## What's still missing to automate

- Brewfile/pacman autoinstall
- Installer script should be started after having stow in the system
- Extra devtools: `npm i -g`, `pipx install` and so on and so forth

## A short note about this repository

This repository has a very ad-hoc workflow to me and it's based on a couple of
shell scripts that install the stuff I use. If you're cloning please be aware

Also, I do frequent force pushes with no same and no intention of apologizing
at all.

## Notes without a place

### Neovim submodules

A tiny reminder of submodules and neovim in this repo:

> For deleting a plugin: `./rmplugin <plugin_name>` ([source](https://stackoverflow.com/a/36593218))

> For trying out: `./addplugin <git url>` (self-made)

> For update: `git submodule foreach "git pull origin main || git pull origin master"`. Or update them separately

### Choosing an icon for bar/tmux/whatever

I'm just using [this MaterialDesign
font](https://github.com/Templarian/MaterialDesign-Font). There's a link inside
the repository that has a page where glyphs can be searched and copied. It's
also on my starred repos

### Replacing default apps

Install [perl-file-mimeinfo](https://wiki.archlinux.org/title/default_applications#perl-file-mimeinfo)

```sh
# pacman -S perl-file-mimeinfo
```

- check a type if needed `mimetype <file>`
- change default app (and choose): `mimeopen -d <file>`

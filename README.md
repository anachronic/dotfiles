# dotfiles

Here be dragons

- neovim
- efm langserver
- tmux
- zsh
- fish (being used occasionally)
- emacs (Not being used atm)
- A bunch of legacy stuff that needs to be deleted
- [ ] kitty

## Setup

- Install zsh and `chsh` it
- Install neovim 0.5 (could need LuaJIT)
- Install efm-langserver
- Install pipx
- `pipx install flake8 virtualenvwrapper jedi-language-server`
- `npm i -g typescript-language-server typescript tree-sitter neovim eslint_d serve`
- rbenv? (Not quite sure about this one)
- `gem install solagraph`
- Go to `flake8`'s venv and install `flake8-efm`
- Install kitty (honestly in Linux anything is fine, but MacOS needs kitty)
- Install sauce code pro nerd font (can't remember atm what i did for this)
- Make symbolic links

## Roadmap

- Create a brewfile or whatever to automate OS tools installation
- Set up configs for both Linux and MacOS (currently being mostly adapted for mac)
- Use a dotfile organization tool
- Document what the hell I do when I set up a new machine
- Maybe do some CI?

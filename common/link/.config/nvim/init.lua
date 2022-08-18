local utils = require('ach.util')
local plug = utils.plug

plug('popup.nvim') -- Common dependency
plug('plenary.nvim') -- Common dependency

plug('nvim-lspconfig') -- LSP
plug('lspsaga.nvim') -- UI Improvements for LSP, not using it much though
plug('null-ls.nvim') -- Instead of efm

plug('nvim-cmp') -- general completion
plug('cmp-nvim-lsp') -- LSP for cmp
plug('cmp-path') -- path for cmp

plug('neogit') -- finally some magic around git
plug('vim-fugitive') -- still quite useful despite a little dated
plug('gitsigns.nvim') -- git gutter signs

plug('nvim-tree.lua') -- Great NERDTree replacement
plug('nvim-web-devicons') -- Required for tree to work, kind of a hassle

plug('fzf-lua') -- Way better than telescope. Requires skim
plug('nvim-fzf') -- low level fzf for neovim
plug('terminus') -- focus report

plug('pinnacle') -- better highlighting?
plug('lualine.nvim') -- great statusline
plug('catppuccin-theme') -- The new kid on the block

plug('vim-eunuch') -- frequently use :Delete and :Rename
plug('vim-abolish') -- coerce casing
plug('vim-repeat') -- dot repetitions
plug('vim-surround') -- ysiw and cs'. I use this a lot
plug('vim-unimpaired') -- Haven't been using qf a lot lately. TODO: check if should be removed
plug('vim-speeddating') -- Seems useful but haven't used it
plug('vim-signature') -- Marks, haven't been using it but I should
plug('vim-sneak') -- TODO: Gonna try sneak-{f,F,t,T}. Remove?

plug('Comment.nvim') -- Best comments out there. Don't even wanna try anything else
plug('editorconfig-vim') -- Using this at work
plug('tabular') -- :Tab for alignment. Works surprisingly well. also dep for markdown
plug('loupe') -- Better search. I find this plugin beautiful
plug('nvim-autopairs') -- back 2 basics i guess
plug('nvim-snippy') -- Lua snippets, finally
plug('emmet-vim') -- Emmet
plug('zen-mode.nvim') -- zen-mode. Previously goyo

--plug('orgmode.nvim') -- Try orgmode?

plug('vim-textobj-user') -- custom textobjects
plug('vim-textobj-entire') -- "entire" textobject. Like yae would copy the entire file
plug('vim-textobj-rubyblock') -- a ruby block. Been doing rails a lot lately
plug('vim-sort-motion') -- sorting mostly because of gemfiles

plug('vim-styled-components') -- Styled components syntax
plug('vim-gitignore') -- gitignore syntax. Forked because original has a bunch of snippets

plug('nvim-treesitter') -- General syntax parsing
plug('nvim-treesitter-endwise') -- endwise based on treesitter syntax

vim.o.termguicolors = true -- its 2022, cmon
vim.o.number = true -- show line numbers
vim.o.relativenumber = true -- relative numbers
vim.o.scrolloff = 3 -- a little room for zt and zb
vim.o.clipboard = 'unnamedplus' -- Use global clipboard, I don't mind
vim.o.hidden = true -- allow hiding buffers with unsaved changes
vim.o.mouse = 'a' -- use the mouse
vim.o.joinspaces = false -- don't join spaces with J
vim.o.shortmess = 'filmnrxoOtTAIcF' -- noswapfile, nosplash, mostly defaults
vim.o.splitright = true
vim.o.splitbelow = true
vim.wo.cursorline = true -- highlight cursor line
vim.o.backspace = 'indent,eol,start' -- allow unrestricted backspacing
vim.wo.foldlevel = 99 -- don't let folding get in the way
vim.o.completeopt = 'menuone,noselect' -- nvim-cmp requires completeopt to be set to these
vim.wo.signcolumn = 'yes:1' -- only 1 space for signs
vim.g.vimsyn_embed = 'lPr' -- support embed python lua and ruby
vim.o.whichwrap = 'b,h,l,s,<,>,[,],~' -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
vim.o.showmode = false -- Don't show "INSERT" below. It's in the statusline
vim.o.inccommand = 'split' -- Preview replacements in a split!
vim.o.foldmethod = 'syntax' -- treesitter needs expr folding, but should be like syntax
vim.opt.list = true -- show whitespace

vim.opt.listchars = { -- Fails if using vim.o, I think vim.opt is better overall
    nbsp = '⦸', -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
    extends = '»', -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
    precedes = '«', -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
    tab = '▷⋯', -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
    trail = '•', -- BULLET (U+2022, UTF-8: E2 80 A2)
}
vim.opt.fillchars = {
    diff = '∙', -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
    eob = ' ', -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
    fold = '·', -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    vert = '┃', -- BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
}

-- use spaces and indent to 4 by default
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Persistent undo. Assume it's installed no prob
if vim.fn.exists('$SUDO_USER') == 1 then
    vim.o.undofile = false
else
    vim.o.undodir = vim.fn.expand('~/.config/nvim/tmp/undo')
    vim.o.undofile = true
end

-- keep swap files out of the way
if vim.fn.exists('$SUDO_USER') == 1 then
    vim.o.swapfile = false
else
    vim.o.directory = vim.fn.expand('~/.config/nvim/tmp/swap//')
end

-- MAPPINGS
vim.g.mapleader = ' ' -- leader is space

-- configs
require('ach.lualine')
require('ach.fzf')
require('ach.autopairs')
require('ach.gitsigns')
require('ach.colors')
require('ach.emmet')
require('ach.orgmode')
require('nvim-web-devicons').setup({})
require('ach.nvimtree')
require('ach.completion')
require('ach.treesitter')
require('ach.distraction-free')
require('ach.comments')
require('ach.bindings')
require('ach.sneak')
require('ach.lspconfig')

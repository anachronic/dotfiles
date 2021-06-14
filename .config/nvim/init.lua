-- stop dispatch from creating mappings
vim.g.dispatch_no_maps = 1

vim.fn['plug#begin'](vim.fn.expand('~/.config/nvim/plugged'))
vim.cmd([[Plug 'neovim/nvim-lspconfig']])
vim.cmd([[Plug 'hrsh7th/nvim-compe']])
vim.cmd([[Plug 'TimUntersberger/neogit']]);                 -- finally some magic around git
vim.cmd([[Plug 'tpope/vim-fugitive']]);                     -- still quite useful despite a little dated

vim.cmd([[Plug 'scrooloose/nerdtree']])

vim.cmd([[Plug 'nvim-lua/popup.nvim']])
vim.cmd([[Plug 'nvim-lua/plenary.nvim']])
vim.cmd([[Plug 'nvim-telescope/telescope.nvim']])
vim.cmd([[Plug 'wincent/terminus']]);                       -- focus report

vim.cmd([[Plug 'hoob3rt/lualine.nvim']])
vim.cmd([[Plug 'junegunn/seoul256.vim']])

vim.cmd([[Plug 'tpope/vim-eunuch']])
vim.cmd([[Plug 'tpope/vim-abolish']])                      -- coerce casing
vim.cmd([[Plug 'tpope/vim-repeat']])
vim.cmd([[Plug 'tpope/vim-surround']])
vim.cmd([[Plug 'tpope/vim-unimpaired']])
vim.cmd([[Plug 'tpope/vim-dispatch']])
vim.cmd([[Plug 'tpope/vim-speeddating']])
vim.cmd([[Plug 'kshenoy/vim-signature']])
vim.cmd([[Plug 'justinmk/vim-sneak']])

vim.cmd([[Plug 'tomtom/tcomment_vim']])
vim.cmd([[Plug 'editorconfig/editorconfig-vim']])
vim.cmd([[Plug 'godlygeek/tabular']]);                      -- alignment
vim.cmd([[Plug 'wincent/loupe']])
vim.cmd([[Plug 'mtth/scratch.vim']])
vim.cmd([[Plug 'windwp/nvim-autopairs']])

vim.cmd([[Plug 'HerringtonDarkholme/yats.vim']])           -- typescript
vim.cmd([[Plug 'cespare/vim-toml']])
vim.cmd([[Plug 'posva/vim-vue']])
vim.cmd([[Plug 'pangloss/vim-javascript']])
vim.cmd([[Plug 'maxmellon/vim-jsx-pretty']]);               -- jsx
vim.cmd([[Plug 'styled-components/vim-styled-components']])
vim.cmd([[Plug 'jparise/vim-graphql']])
vim.cmd([[Plug 'cakebaker/scss-syntax.vim']])
vim.cmd([[Plug 'anachronic/vim-gitignore']])
vim.cmd([[Plug 'plasticboy/vim-markdown']])

vim.fn['plug#end']()

vim.o.termguicolors = true                -- its 2021, cmon
vim.wo.number = true                      -- show line numbers
vim.wo.relativenumber = true              -- relative numbers
vim.o.scrolloff = 3                       -- a little room for zt and zb
vim.o.clipboard= "unnamedplus"            -- Use global clipboard, I don't mind
vim.o.hidden = true                       -- allow hiding buffers with unsaved changes
vim.o.mouse = 'a'                         -- use the mouse
vim.o.joinspaces = false                  -- don't join spaces with J
vim.o.shortmess = vim.o.shortmess .. 'AI' -- No swapfile messages, no splash screen
vim.o.splitright = true
vim.o.splitbelow = true
vim.wo.cursorline = true                  -- highlight cursor line
vim.o.backspace = 'indent,eol,start'      -- allow unrestricted backspacing
vim.wo.foldmethod = 'syntax'              -- always try syntax folding
vim.wo.foldlevel = 99                     -- don't let folding get in the way
vim.o.completeopt = 'menuone,noselect'    -- vim compe requires completeopt to be set to these
vim.wo.signcolumn = 'number'              -- display errors in number column
vim.g.vimsyn_embed = 'lPr'                -- support embed python lua and ruby
vim.o.whichwrap = 'b,h,l,s,<,>,[,],~'     -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries


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

-- configs
require('ach.lualine')
-- require('ach.lsp')
require'nvim-autopairs'.setup()

-- MAPPINGS
local utils = require('ach.util')
local map = utils.map
vim.g.mapleader = " " -- leader is space

-- colors
vim.g.seoul256_background = 233
vim.cmd('colo seoul256')

-- Regular vim stuff
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>o', ':o<CR>')
map('n', '<leader>k', ':bd<CR>')
map('n', '<leader>;', ':')
map('n', '<leader>c', '*Ncgn')

-- Window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- swap 0 and ^
map('n', '0', '^')
map('n', '^', '0')

-- quickfix
map('n', '<Down>', '<cmd>cnext<CR>')
map('n', '<Up>', '<cmd>cprevious<CR>')

-- j k and Y
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('n', 'Y', 'y$')

-- NERDTree
map('n', '<A-1>', '<cmd>NERDTreeToggle<CR>')
map('n', '<leader>j', '<cmd>NERDTreeFind<CR>')

-- command
map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')

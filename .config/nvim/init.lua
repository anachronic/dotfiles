vim.cmd 'packadd paq-nvim'

require 'paq-nvim' {
    'savq/paq-nvim';

    'neovim/nvim-lspconfig';
    'hrsh7th/nvim-compe';
    'TimUntersberger/neogit';                  -- finally some magic around git
    'tpope/vim-fugitive';                      -- still quite useful despite a little dated

    'scrooloose/nerdtree';

    'nvim-lua/popup.nvim';
    'nvim-lua/plenary.nvim';
    'nvim-telescope/telescope.nvim';
    'wincent/terminus';                        -- focus report

    'hoob3rt/lualine.nvim';
    'junegunn/seoul256.vim';

    'tpope/vim-eunuch';
    'tpope/vim-abolish';                       -- coerce casing
    'tpope/vim-repeat';
    'tpope/vim-surround';
    'tpope/vim-unimpaired';
    'tpope/vim-dispatch';
    'tpope/vim-speeddating';
    'kshenoy/vim-signature';
    'justinmk/vim-sneak';

    'tomtom/tcomment_vim';
    'editorconfig/editorconfig-vim';
    'godlygeek/tabular';                       -- alignment
    'wincent/loupe';
    'mtth/scratch.vim';
    'windwp/nvim-autopairs';

    'HerringtonDarkholme/yats.vim';            -- typescript
    'cespare/vim-toml';
    'posva/vim-vue';
    'pangloss/vim-javascript';
    'maxmellon/vim-jsx-pretty';                -- jsx
    'styled-components/vim-styled-components';
    'jparise/vim-graphql';
    'cakebaker/scss-syntax.vim';
    'anachronic/vim-gitignore';
    'plasticboy/vim-markdown';
}

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

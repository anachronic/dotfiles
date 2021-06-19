-- stop dispatch from creating mappings
vim.g.dispatch_no_maps = 1
vim.g.nvim_tree_show_icons = {
    git = 0,
    files = 1,
    folders = 1
}

vim.fn['plug#begin'](vim.fn.expand('~/.config/nvim/plugged'))
vim.cmd([[Plug 'neovim/nvim-lspconfig']])                   -- LSP
vim.cmd([[Plug 'glepnir/lspsaga.nvim']])                    -- UI Improvements for LSP, not using it much though
vim.cmd([[Plug 'hrsh7th/nvim-compe']])                      -- fast as hell completion
vim.cmd([[Plug 'TimUntersberger/neogit']]);                 -- finally some magic around git
vim.cmd([[Plug 'tpope/vim-fugitive']]);                     -- still quite useful despite a little dated
vim.cmd([[Plug 'lewis6991/gitsigns.nvim']]);                -- git gutter signs

                                                            -- vim.cmd([[Plug 'scrooloose/nerdtree']])
vim.cmd([[Plug 'kyazdani42/nvim-tree.lua']])                -- Great NERDTree replacement
vim.cmd([[Plug 'kyazdani42/nvim-web-devicons']])            -- Required for tree to work, kind of a hassle

vim.cmd([[Plug 'nvim-lua/popup.nvim']])                     -- Telescope dep
vim.cmd([[Plug 'nvim-lua/plenary.nvim']])                   -- Telescope dep
vim.cmd([[Plug 'nvim-telescope/telescope.nvim']])           -- Live grep, find files, buffers, etc. Unusable without fzy algorithm
vim.cmd([[Plug 'wincent/terminus']]);                       -- focus report

vim.cmd([[Plug 'hoob3rt/lualine.nvim']])                    -- great statusline
vim.cmd([[Plug 'junegunn/seoul256.vim']])                   -- Not currently being used. TODO: remove?
vim.cmd([[Plug 'bluz71/vim-nightfly-guicolors']])           -- Current color scheme, works for me

vim.cmd([[Plug 'tpope/vim-eunuch']])                        -- frequently use :Delete and :Rename
vim.cmd([[Plug 'tpope/vim-abolish']])                       -- coerce casing
vim.cmd([[Plug 'tpope/vim-repeat']])                        -- dot repetitions
vim.cmd([[Plug 'tpope/vim-surround']])                      -- ysiw and cs'. I use this a lot
vim.cmd([[Plug 'tpope/vim-unimpaired']])                    -- Haven't been using qf a lot lately. TODO: check if should be removed
vim.cmd([[Plug 'tpope/vim-dispatch']])                      -- Also haven't been using it. TODO: maybe remove?
vim.cmd([[Plug 'tpope/vim-speeddating']])                   -- Seems useful but haven't used it
vim.cmd([[Plug 'kshenoy/vim-signature']])                   -- Marks, haven't been using it but I should
vim.cmd([[Plug 'justinmk/vim-sneak']])                      -- TODO: Maybe replace with ggandor/lightspeed.nvim

vim.cmd([[Plug 'tomtom/tcomment_vim']])                     -- Best comments out there. Don't even wanna try anything else
vim.cmd([[Plug 'editorconfig/editorconfig-vim']])           -- Using this at work
vim.cmd([[Plug 'godlygeek/tabular']]);                      -- :Tab for alignment. Works surprisingly well. also dep for markdown
vim.cmd([[Plug 'wincent/loupe']])                           -- Better search. I find this plugin beautiful
vim.cmd([[Plug 'mtth/scratch.vim']])                        -- Scratch buffer via gs. Nice plugin
vim.cmd([[Plug 'windwp/nvim-autopairs']])                   -- This one doesn't really work all that well. TODO: find something better

vim.cmd([[Plug 'HerringtonDarkholme/yats.vim']])            -- I believe this syntax is better
vim.cmd([[Plug 'cespare/vim-toml']])                        -- Been using TOML files for some projects
vim.cmd([[Plug 'posva/vim-vue']])                           -- Vue...
vim.cmd([[Plug 'pangloss/vim-javascript']])                 -- js indentation
vim.cmd([[Plug 'maxmellon/vim-jsx-pretty']]);               -- jsx. React
vim.cmd([[Plug 'styled-components/vim-styled-components']]) -- Styled components syntax
vim.cmd([[Plug 'jparise/vim-graphql']])                     -- Graphql syntax
vim.cmd([[Plug 'cakebaker/scss-syntax.vim']])               -- SCSS. Haven't been using. TODO: remove??
vim.cmd([[Plug 'anachronic/vim-gitignore']])                -- gitignore syntax. Forked because original has a bunch of snippets
vim.cmd([[Plug 'plasticboy/vim-markdown']])                 -- Markdown. This one gives expr folding I believe
vim.cmd([[Plug 'Vimjas/vim-python-pep8-indent']])           -- 21st century python indentation
vim.cmd([[Plug 'tmhedberg/SimpylFold']])                    -- python syntax folding
vim.cmd([[Plug 'vim-python/python-syntax']])                -- Better python syntax highlighting

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

-- MAPPINGS
local utils = require('ach.util')
local map = utils.map
vim.g.mapleader = " " -- leader is space

-- configs
require('ach.lualine')
require('ach.telescope')
require('ach.autopairs')
require('ach.vue')
require('ach.scratch')
require('ach.gitsigns')
require('nvim-web-devicons').setup{}
-- require('ach.snippets.setup')

-- colors
-- vim.g.seoul256_background = 233 -- darkest seoul
-- vim.cmd('colo seoul256')
vim.cmd('silent! colorscheme nightfly')
vim.highlight.create('LspDiagnosticsDefaultError', {ctermbg=0, guifg='#a50c3a'}, false)
vim.highlight.create('LspDiagnosticsDefaultHint', {ctermbg=0, guifg='#536b54'}, false)

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

-- command
map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')

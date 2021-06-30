-- stop dispatch from creating mappings
local utils = require('ach.util')
local map = utils.map
local plug = utils.plug

vim.g.dispatch_no_maps = 1
vim.g.nvim_tree_show_icons = {
    git = 0,
    files = 1,
    folders = 1
}

vim.fn['plug#begin'](vim.fn.expand('~/.config/nvim/plugged'))
plug('neovim/nvim-lspconfig')                   -- LSP
plug('glepnir/lspsaga.nvim')                    -- UI Improvements for LSP, not using it much though
plug('hrsh7th/nvim-compe')                      -- fast as hell completion
plug('TimUntersberger/neogit')                  -- finally some magic around git
plug('tpope/vim-fugitive')                      -- still quite useful despite a little dated
plug('lewis6991/gitsigns.nvim')                 -- git gutter signs

plug('kyazdani42/nvim-tree.lua')                -- Great NERDTree replacement
plug('kyazdani42/nvim-web-devicons')            -- Required for tree to work, kind of a hassle

plug('nvim-lua/popup.nvim')                     -- Telescope dep
plug('nvim-lua/plenary.nvim')                   -- Telescope dep
plug('nvim-telescope/telescope.nvim')           -- Live grep, find files, buffers, etc. Unusable without fzy algorithm
plug('wincent/terminus')                        -- focus report

plug('wincent/pinnacle')                        -- better highlighting?
plug('hoob3rt/lualine.nvim')                    -- great statusline
plug('junegunn/seoul256.vim')                   -- Not currently being used. TODO: remove?
plug('bluz71/vim-nightfly-guicolors')           -- Current color scheme, works for me

plug('tpope/vim-eunuch')                        -- frequently use :Delete and :Rename
plug('tpope/vim-abolish')                       -- coerce casing
plug('tpope/vim-repeat')                        -- dot repetitions
plug('tpope/vim-surround')                      -- ysiw and cs'. I use this a lot
plug('tpope/vim-unimpaired')                    -- Haven't been using qf a lot lately. TODO: check if should be removed
plug('tpope/vim-dispatch')                      -- Also haven't been using it. TODO: maybe remove?
plug('tpope/vim-speeddating')                   -- Seems useful but haven't used it
plug('kshenoy/vim-signature')                   -- Marks, haven't been using it but I should
plug('justinmk/vim-sneak')                      -- TODO: Maybe replace with ggandor/lightspeed.nvim

plug('tomtom/tcomment_vim')                     -- Best comments out there. Don't even wanna try anything else
plug('editorconfig/editorconfig-vim')           -- Using this at work
plug('godlygeek/tabular')                       -- :Tab for alignment. Works surprisingly well. also dep for markdown
plug('wincent/loupe')                           -- Better search. I find this plugin beautiful
plug('mtth/scratch.vim')                        -- Scratch buffer via gs. Nice plugin
plug('windwp/nvim-autopairs')                   -- This one doesn't really work all that well. TODO: find something better
plug('hrsh7th/vim-vsnip')                       -- Annoying JSON snippets that don't depend on python. they're ok
plug('mattn/emmet-vim')                         -- Emmet

-- Treesitter seems to do way better than any other plugin.
vim.cmd([[Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}]])

plug('tpope/vim-rails') -- Rails for vim

-- TODO: Remove the following block
-- plug('HerringtonDarkholme/yats.vim')            -- I believe this syntax is better
-- plug('cespare/vim-toml')                        -- Been using TOML files for some projects
-- plug('posva/vim-vue')                           -- Vue...
-- plug('pangloss/vim-javascript')                 -- js indentation
-- plug('maxmellon/vim-jsx-pretty')                -- jsx. React
-- plug('styled-components/vim-styled-components') -- Styled components syntax
-- plug('jparise/vim-graphql')                     -- Graphql syntax
-- plug('cakebaker/scss-syntax.vim')               -- SCSS. Haven't been using. TODO: remove??
-- plug('anachronic/vim-gitignore')                -- gitignore syntax. Forked because original has a bunch of snippets
-- plug('plasticboy/vim-markdown')                 -- Markdown. This one gives expr folding I believe
-- plug('Vimjas/vim-python-pep8-indent')           -- 21st century python indentation
-- plug('tmhedberg/SimpylFold')                    -- python syntax folding
-- plug('vim-python/python-syntax')                -- Better python syntax highlighting

vim.fn['plug#end']()

vim.o.termguicolors = true             -- its 2021, cmon
vim.o.number = true                    -- show line numbers
vim.o.relativenumber = true            -- relative numbers
vim.o.scrolloff = 3                    -- a little room for zt and zb
vim.o.clipboard= "unnamedplus"         -- Use global clipboard, I don't mind
vim.o.hidden = true                    -- allow hiding buffers with unsaved changes
vim.o.mouse = 'a'                      -- use the mouse
vim.o.joinspaces = false               -- don't join spaces with J
vim.o.shortmess = 'filmnrxoOtTAIcF'    -- noswapfile, nosplash, mostly defaults
vim.o.splitright = true
vim.o.splitbelow = true
vim.wo.cursorline = true               -- highlight cursor line
vim.o.backspace = 'indent,eol,start'   -- allow unrestricted backspacing
vim.wo.foldlevel = 99                  -- don't let folding get in the way
vim.o.completeopt = 'menuone,noselect' -- vim compe requires completeopt to be set to these
vim.wo.signcolumn = 'number'           -- display errors in number column
vim.g.vimsyn_embed = 'lPr'             -- support embed python lua and ruby
vim.o.whichwrap = 'b,h,l,s,<,>,[,],~'  -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
vim.o.showmode = false                 -- Don't show -- INSERT -- below. It's in the statusline

-- Folding with tree sitter
vim.o.foldmethod = 'expr'                            -- treesitter needs expr folding, but should be like syntax
vim.wo.foldexpr='nvim_treesitter#foldexpr()' -- always try syntax folding

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
vim.g.mapleader = " " -- leader is space

-- configs
require('ach.lualine')
require('ach.telescope')
require('ach.autopairs')
require('ach.vue')
require('ach.scratch')
require('ach.gitsigns')
require('ach.treesitter')
require('ach.tab')
require('ach.vsnip')
require('ach.colors')
require('ach.emmet')
require('nvim-web-devicons').setup{}

-- Remap tab for compe/vsnip
map('i', '<Tab>', 'v:lua.tab_complete()', { expr=true })
map('s', '<Tab>', 'v:lua.tab_complete()', { expr=true })
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr=true })
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr=true })


-- Regular vim stuff
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>o', ':only<CR>')
map('n', '<leader>k', ':bdelete<CR>')
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

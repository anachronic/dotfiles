-- The wincent hack for <Tab> folding
-- This requires additional term configuration
vim.keymap.set("n", "<Tab>", "za")
vim.keymap.set("n", "<F6>", "<C-i>")

-- Regular vim stuff
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>o", ":only<CR>")
vim.keymap.set("n", "<leader>k", ":bdelete<CR>")
vim.keymap.set("n", "<leader>;", ":")
vim.keymap.set("n", "<leader>c", "*Ncgn")
vim.keymap.set("n", "<leader>y", ':let @+ = expand("%")<CR>')

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- swap 0 and ^
vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "^", "0")

-- quickfix
vim.keymap.set("n", "<Down>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<Up>", "<cmd>cprevious<CR>")

-- j k and Y
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "Y", "y$")

-- insert mode
vim.keymap.set("i", "<C-e>", "<End>")

-- command
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")

-- get rid of ex mode
vim.keymap.set("n", "Q", "<nop>")

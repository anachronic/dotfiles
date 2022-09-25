-- This file is to create all commands i screw up everytime

local command = vim.api.nvim_create_user_command

command('Wq', 'wq', {})
command('Q', 'quit', {})

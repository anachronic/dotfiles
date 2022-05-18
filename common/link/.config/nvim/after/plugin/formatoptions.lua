-- Stop auto commenting everywhere
-- needs autocmd because neovim builtins explicitly set formatoptions

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.bo.formatoptions = "jqlt"
	end,
})

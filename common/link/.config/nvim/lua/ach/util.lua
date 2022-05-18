local util = {}

function util.plug(package)
	vim.cmd("packadd " .. package)
end

function util.indent(num)
	vim.bo.shiftwidth = num
	vim.bo.tabstop = num
end

function util.ts_folding()
	vim.wo.foldmethod = "expr"
	vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
end

return util

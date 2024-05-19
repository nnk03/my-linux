vim.o.undofile = true
require("neeraj.core")
require("neeraj.lazy")

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true

-- for javascript files alone, setting some properties
vim.cmd([[
  autocmd FileType javascript setlocal shiftwidth=2
  autocmd FileType javascript setlocal softtabstop=2
  autocmd FileType javascript setlocal tabstop=2
  autocmd FileType javascript setlocal noexpandtab
]])

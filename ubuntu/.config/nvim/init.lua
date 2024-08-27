vim.o.undofile = true
require("neeraj.core")
require("neeraj.lazy")

-- for javascript files alone, setting some properties
vim.cmd([[
  autocmd FileType javascript setlocal shiftwidth=2
  autocmd FileType javascript setlocal softtabstop=2
  autocmd FileType javascript setlocal tabstop=2
  autocmd FileType javascript setlocal noexpandtab
]])

-- Automatically build and compile LaTeX files on save
vim.cmd([[
  augroup LaTeXAutoCompile
    autocmd!
    autocmd BufWritePost *.tex :silent !pdflatex %:t
  augroup END
]])

-- to apply clang-format when saving cpp files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.cpp", "*.c", "*.h" },
  command = "silent ! clang-format -i %",
})

-- to apply black formatting when saving python files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.py" },
  command = "silent ! black %",
})

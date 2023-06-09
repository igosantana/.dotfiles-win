-- local autocmd = vim.api.nvim_create_autocmd
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-command"
vim.opt.shellquote = '\\"'
vim.opt.shellxquote = ""
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

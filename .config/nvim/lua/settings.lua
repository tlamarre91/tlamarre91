vim.g.mapleader = " "

vim.opt.formatoptions = "jcql"
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.mouse = "n"
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 25
vim.opt.undofile = true
vim.opt.undolevels = 2000

vim.opt.termguicolors = true
vim.cmd "colorscheme sonokai"

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
})

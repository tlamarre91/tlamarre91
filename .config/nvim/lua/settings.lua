vim.g.mapleader = " "

vim.opt.expandtab = true
vim.opt.formatoptions = "jcql"
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.listchars = "tab:>·,trail:~,extends:>,precedes:<,space:·"
vim.opt.list = true
vim.opt.mouse = "n"
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
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

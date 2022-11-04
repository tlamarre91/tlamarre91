vim.g.mapleader = " "

vim.opt.expandtab = true
vim.opt.formatoptions = "jcql"
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.ignorecase = true
vim.opt.indentkeys = "0{,0},0),0],!^F,o,O,e,=elif,=except,0=end,0=until"
vim.opt.inccommand = "nosplit"
vim.opt.listchars = "tab:>·,trail:~,extends:>,precedes:<,space:·"
vim.opt.list = true
vim.opt.mouse = "n"
vim.opt.number = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 4
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.textwidth = 120
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 25
vim.opt.undofile = true
vim.opt.undolevels = 2000

-- GUI settings
vim.opt.guifont = "Cascadia Mono:h10"
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_cursor_animation_length = 0.05

vim.opt.termguicolors = true
vim.cmd "colorscheme sonokai"

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
})

vim.g.snacks_animate = false
vim.o.hlsearch = false
vim.o.relativenumber = false
vim.o.clipboard = ""
vim.o.wrap = true
vim.o.shiftwidth = 2

-- Avoid slow Python provider startup on mac
-- TODO: consider: If you upgrade Python versions often, a more stable option is:
--
-- vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/neovim/bin/python")
--
-- where neovim is a dedicated pyenv env just for the provider. This avoids breaking Neovim whenever you upgrade Python.
local uname = vim.loop.os_uname()

if uname.sysname == "Darwin" then
  vim.g.python3_host_prog = "/Users/tlamarre/.pyenv/versions/3.12.7/bin/python3"
end

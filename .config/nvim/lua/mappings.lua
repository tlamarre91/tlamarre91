-- LSP mappings are in loadlsp.lua

function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(
	  mode,
		shortcut,
		command,
		{
			noremap = true,
			-- silent = true
		}
	)
end

-- which map does what?
map("n", "<Leader><Leader>", "<CMD>WhichKey '<Leader>'<CR>")
map("n", "<Leader>h", "<CMD>WhichKey ''<CR>")

-- shortcuts
map("i", "jj", "<Esc>")
map("n", "<Leader>q", "<CMD>bdelete<CR>")
-- map("n", "<Leader>q", "<CMD>bn | bdelete #<CR>")
map("n", "<Leader>wq", "<CMD>w<CR><CMD>bd<CR>")
-- map("n", "<Leader>lr", "<CMD>!pdflatex %<CR>")

-- searching
map("n", "<Leader>/", "/\\V")
map("n", "<Leader>?", "?\\V")
map("v", "*", 'y/<C-r>"<CR>')

-- edit/refresh config
map("n", "<Leader>Cr", "<CMD>Reload<CR>") -- reload using nvim-reload plugin
map("n", "<Leader>Ce", "<CMD>edit ~/.config/nvim/init.lua<CR>")

-- toggle settings
map("n", "<Leader>sh", "<CMD>set hlsearch!<CR>")
map("n", "<Leader>sw", "<CMD>set wrap!<CR>")
map("n", "<Leader>sti", "<CMD>TSToggle indent<CR>")
map("n", "<Leader>sth", "<CMD>TSToggle highlight<CR>")

-- scrolling
map("n", "<C-e>", "5<C-e>")
map("n", "<C-y>", "5<C-y>")
map("v", "<C-e>", "5<C-e>")
map("v", "<C-y>", "5<C-y>")

-- switching buffers
map("n", "L", "<CMD>bnext<CR>")
map("n", "H", "<CMD>bprev<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- let rtp = vim.opt.runtimepath._value -- TODO: use this for <Leader>fc

-- telescope
map("n", "<Leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<Leader>fg", "<CMD>Telescope live_grep<CR>")
map("n", "<Leader>fb", "<CMD>Telescope buffers<CR>")
-- map("n", "<Leader>fc", "<CMD>Telescope find_files search_dirs={'~/.config/nvim'}<CR>")
map("n", "<Leader>fc", "<CMD>Telescope find_files search_dirs={'~/.config/nvim'}<CR>")
map("n", "<Leader>fh", "<CMD>Telescope find_files hidden=true<CR>")
map("n", "<Leader>fo", "<CMD>Telescope oldfiles<CR>")

-- other plugins
map("n", "<Leader>u", "<CMD>UndotreeToggle<CR>")
map("n", "<Leader>t", "<CMD>NvimTreeToggle<CR>")
map("n", "<Leader>o", "<CMD>SymbolsOutline<CR>")
map("n", "<Leader>d", "<CMD>TroubleToggle<CR>")
map("n", "<Leader>ss", "<CMD>echo nvim_treesitter#statusline()<CR>")

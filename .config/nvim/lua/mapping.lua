vim.keymap.set('i', 'jj', '<Esc>')

-- toggle settings
vim.keymap.set('n', '<Leader>sh', '<CMD>setlocal hlsearch!<CR>')
vim.keymap.set('n', '<Leader>sw', '<CMD>setlocal wrap!<CR>')

-- switching buffers
vim.keymap.set('n', '<Leader>q', '<CMD>bdelete<CR>')
vim.keymap.set('n', '<Leader>wq', '<CMD>w<CR><CMD>bd<CR>')
vim.keymap.set('n', '<Leader>aq', '<CMD>bufdo bdelete<CR>')
vim.keymap.set('n', 'L', '<CMD>bnext<CR>')
vim.keymap.set('n', 'H', '<CMD>bprev<CR>')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- diagnostics
-- vim.keymap.set('n', '<Leader>d', '<CMD>lua vim.diagnostic.setloclist()<CR>', { desc = 'diag to quickfix' })
vim.keymap.set('n', 'g,', '<CMD>lua vim.diagnostic.goto_prev()<CR>', { desc = 'goto prev diag' })
vim.keymap.set('n', 'g.', '<CMD>lua vim.diagnostic.goto_next()<CR>', { desc = 'goto next diag' })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'find buffers' })
vim.keymap.set('n', '<leader>fc',
  function()
    require('telescope.builtin').find_files({ search_dirs = {'~/AppData/Local/nvim'} })
  end,
  { desc = 'find config' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'find diag' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'find files' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'find live grep' })
vim.keymap.set('n', '<leader>fG',
  function()
    require('telescope.builtin').live_grep({ grep_open_files = true })
  end,
  { desc = 'find live grep' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'find help' })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, { desc = 'find old (recent)' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'find word' })

vim.keymap.set('n', '<C-e>', '5<C-e>')
vim.keymap.set('n', '<C-y>', '5<C-y>')

-- other plugins
vim.keymap.set('n', '<Leader>u', '<CMD>UndotreeToggle<CR>')
vim.keymap.set('n', '<Leader>t', '<CMD>NvimTreeToggle<CR>')
-- vim.keymap.set('n', '<Leader>o', '<CMD>SymbolsOutline<CR>')
-- vim.keymap.set('n', '<Leader>d', '<CMD>TroubleToggle<CR>')


return {
  'ap/vim-buftabline',
  'mbbill/undotree',
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    -- LSP Configuration & Plugins
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'nvim-tree/nvim-web-devicons' },
    },
    opts = {}
  }
}

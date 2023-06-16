-- Install packer
-- local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
-- local is_bootstrap = false
-- if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
--   is_bootstrap = true
--   vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--   vim.cmd [[packadd packer.nvim]]
-- end
--
-- require('packer').startup(function(use)
--   use "ap/vim-buftabline" -- Buffer list
--   use "kyazdani42/nvim-tree.lua" -- File explorer
--   use "mbbill/undotree" -- Navigate undo history
--   use "tpope/vim-surround" -- Manipulate surrounding characters
--   use "folke/which-key.nvim"
--   use "folke/trouble.nvim"
--   use "nvim-tree/nvim-web-devicons" -- icon fonts
--
--   -- Package manager
--   use 'wbthomason/packer.nvim'
--
--   use { -- LSP Configuration & Plugins
--     'neovim/nvim-lspconfig',
--     requires = {
--       -- Automatically install LSPs to stdpath for neovim
--       'williamboman/mason.nvim',
--       'williamboman/mason-lspconfig.nvim',
--
--       -- Useful status updates for LSP
--       'j-hui/fidget.nvim',
--     },
--   }
--
--   use { -- Autocompletion
--     'hrsh7th/nvim-cmp',
--     requires = {
--       'hrsh7th/cmp-nvim-lsp',
--       'L3MON4D3/LuaSnip',
--       'saadparwaiz1/cmp_luasnip',
--       'hrsh7th/cmp-nvim-lsp-signature-help'
--     },
--   }
--
--   use { -- Highlight, edit, and navigate code
--     'nvim-treesitter/nvim-treesitter',
--     run = function()
--       pcall(require('nvim-treesitter.install').update { with_sync = true })
--     end,
--   }
--
--   use { -- Additional text objects via treesitter
--     'nvim-treesitter/nvim-treesitter-textobjects',
--     after = 'nvim-treesitter',
--   }
--
--   -- Git related plugins
--   use 'tpope/vim-fugitive'
--   use 'tpope/vim-rhubarb'
--   use 'lewis6991/gitsigns.nvim'
--
--   -- use 'navarasu/onedark.nvim' -- Theme inspired by Atom
--   use 'sainnhe/sonokai'
--   use 'nvim-lualine/lualine.nvim' -- Fancier statusline
--   use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
--   use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
--   use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
--
--   -- Fuzzy Finder (files, lsp, etc)
--   use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
--
--   -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
--   use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
--
--   -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
--   local has_plugins, plugins = pcall(require, 'custom.plugins')
--   if has_plugins then
--     plugins(use)
--   end
--
--   if is_bootstrap then
--     require('packer').sync()
--   end
-- end)
--
-- -- When we are bootstrapping a configuration, it doesn't
-- -- make sense to execute the rest of the init.lua.
-- --
-- -- You'll need to restart nvim, and then it will work.
-- if is_bootstrap then
--   print '=================================='
--   print '    Plugins are being installed'
--   print '    Wait until Packer completes,'
--   print '       then restart nvim'
--   print '=================================='
--   return
-- end
--
-- -- Automatically source and re-compile packer whenever you save this init.lua
-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   command = 'source <afile> | PackerCompile',
--   group = packer_group,
--   pattern = vim.fn.expand '$MYVIMRC',
-- })

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme sonokai]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.scrolloff = 10

vim.o.tabstop = 4
vim.opt.expandtab = true

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
-- require('gitsigns').setup {
--   signs = {
--     add = { text = '+' },
--     change = { text = '~' },
--     delete = { text = '_' },
--     topdelete = { text = '‾' },
--     changedelete = { text = '~' },
--   },
-- }

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    -- layout_strategy = 'vertical',
    layout_config = { height = 0.99, width = 0.99 },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  -- TODO: don't do this, or do this somewhere else. at the moment, semantic tokens + omnisharp are causing problems
  -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
  if client.name == "omnisharp" then
    client.server_capabilities.semanticTokensProvider = {
      full = vim.empty_dict(),
      legend = {
        tokenModifiers = { "static_symbol" },
        tokenTypes = {
          "comment",
          "excluded_code",
          "identifier",
          "keyword",
          "keyword_control",
          "number",
          "operator",
          "operator_overloaded",
          "preprocessor_keyword",
          "string",
          "whitespace",
          "text",
          "static_symbol",
          "preprocessor_text",
          "punctuation",
          "string_verbatim",
          "string_escape_character",
          "class_name",
          "delegate_name",
          "enum_name",
          "interface_name",
          "module_name",
          "struct_name",
          "type_parameter_name",
          "field_name",
          "enum_member_name",
          "constant_name",
          "local_name",
          "parameter_name",
          "method_name",
          "extension_method_name",
          "property_name",
          "event_name",
          "namespace_name",
          "label_name",
          "xml_doc_comment_attribute_name",
          "xml_doc_comment_attribute_quotes",
          "xml_doc_comment_attribute_value",
          "xml_doc_comment_cdata_section",
          "xml_doc_comment_comment",
          "xml_doc_comment_delimiter",
          "xml_doc_comment_entity_reference",
          "xml_doc_comment_name",
          "xml_doc_comment_processing_instruction",
          "xml_doc_comment_text",
          "xml_literal_attribute_name",
          "xml_literal_attribute_quotes",
          "xml_literal_attribute_value",
          "xml_literal_cdata_section",
          "xml_literal_comment",
          "xml_literal_delimiter",
          "xml_literal_embedded_expression",
          "xml_literal_entity_reference",
          "xml_literal_name",
          "xml_literal_processing_instruction",
          "xml_literal_text",
          "regex_comment",
          "regex_character_class",
          "regex_anchor",
          "regex_quantifier",
          "regex_grouping",
          "regex_alternation",
          "regex_text",
          "regex_self_escaped_character",
          "regex_other_escape",
        },
      },
      range = true,
    }
  end

  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', vim.lsp.buf.rename, 'rename thing')
  nmap('g*', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gD', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>fs', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>fS', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
end

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
-- local servers = { 'clangd', 'rust_analyzer', 'omnisharp', 'pyright', 'tsserver', 'lua_ls', 'svelte', 'tailwindcss' }
local servers = { 'clangd', 'rust_analyzer', 'omnisharp', 'pyright', 'tsserver', 'lua_ls', 'svelte' }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

require("nvim-tree").setup()

-- GUI settings
vim.opt.guifont = "Cascadia Mono:h10"
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_cursor_animation_length = 0.05

require "mapping"

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

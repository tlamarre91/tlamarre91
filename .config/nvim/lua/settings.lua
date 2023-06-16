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

vim.o.timeout = true
vim.o.timeoutlen = 300

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

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
-- local on_attach = function(client, bufnr)
--   -- TODO: don't do this, or do this somewhere else. at the moment, semantic tokens + omnisharp are causing problems
--   -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
--   if client.name == "omnisharp" then
--     client.server_capabilities.semanticTokensProvider = {
--       full = vim.empty_dict(),
--       legend = {
--         tokenModifiers = { "static_symbol" },
--         tokenTypes = {
--           "comment",
--           "excluded_code",
--           "identifier",
--           "keyword",
--           "keyword_control",
--           "number",
--           "operator",
--           "operator_overloaded",
--           "preprocessor_keyword",
--           "string",
--           "whitespace",
--           "text",
--           "static_symbol",
--           "preprocessor_text",
--           "punctuation",
--           "string_verbatim",
--           "string_escape_character",
--           "class_name",
--           "delegate_name",
--           "enum_name",
--           "interface_name",
--           "module_name",
--           "struct_name",
--           "type_parameter_name",
--           "field_name",
--           "enum_member_name",
--           "constant_name",
--           "local_name",
--           "parameter_name",
--           "method_name",
--           "extension_method_name",
--           "property_name",
--           "event_name",
--           "namespace_name",
--           "label_name",
--           "xml_doc_comment_attribute_name",
--           "xml_doc_comment_attribute_quotes",
--           "xml_doc_comment_attribute_value",
--           "xml_doc_comment_cdata_section",
--           "xml_doc_comment_comment",
--           "xml_doc_comment_delimiter",
--           "xml_doc_comment_entity_reference",
--           "xml_doc_comment_name",
--           "xml_doc_comment_processing_instruction",
--           "xml_doc_comment_text",
--           "xml_literal_attribute_name",
--           "xml_literal_attribute_quotes",
--           "xml_literal_attribute_value",
--           "xml_literal_cdata_section",
--           "xml_literal_comment",
--           "xml_literal_delimiter",
--           "xml_literal_embedded_expression",
--           "xml_literal_entity_reference",
--           "xml_literal_name",
--           "xml_literal_processing_instruction",
--           "xml_literal_text",
--           "regex_comment",
--           "regex_character_class",
--           "regex_anchor",
--           "regex_quantifier",
--           "regex_grouping",
--           "regex_alternation",
--           "regex_text",
--           "regex_self_escaped_character",
--           "regex_other_escape",
--         },
--       },
--       range = true,
--     }
--   end
--
--   -- NOTE: Remember that lua is a real programming language, and as such it is possible
--   -- to define small helper and utility functions so you don't have to repeat yourself
--   -- many times.
--   --
--   -- In this case, we create a function that lets us more easily define mappings specific
--   -- for LSP related items. It sets the mode, buffer and description for us each time.
--   local nmap = function(keys, func, desc)
--     if desc then
--       desc = 'LSP: ' .. desc
--     end
--
--     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--   end
--
--   nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--   nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--
--   nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
--   nmap('gr', vim.lsp.buf.rename, 'rename thing')
--   nmap('g*', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--   nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
--   nmap('gD', vim.lsp.buf.type_definition, 'Type [D]efinition')
--   nmap('<leader>fs', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--   nmap('<leader>fS', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
--   -- See `:help K` for why this keymap
--   nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--   -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--
--   -- Lesser used LSP functionality
--   -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--   nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--   nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--   nmap('<leader>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, '[W]orkspace [L]ist Folders')
--
--   -- Create a command `:Format` local to the LSP buffer
--   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--     if vim.lsp.buf.format then
--       vim.lsp.buf.format()
--     elseif vim.lsp.buf.formatting then
--       vim.lsp.buf.formatting()
--     end
--   end, { desc = 'Format current buffer with LSP' })
-- end

-- Setup mason so it can manage external tooling
-- require('mason').setup()
--
-- -- Enable the following language servers
-- -- Feel free to add/remove any LSPs that you want here. They will automatically be installed
-- -- local servers = { 'clangd', 'rust_analyzer', 'omnisharp', 'pyright', 'tsserver', 'lua_ls', 'svelte', 'tailwindcss' }
-- local servers = { 'clangd', 'rust_analyzer', 'omnisharp', 'pyright', 'tsserver', 'lua_ls', 'svelte' }
--
-- -- Ensure the servers above are installed
-- require('mason-lspconfig').setup {
--   ensure_installed = servers,
-- }
--
-- -- nvim-cmp supports additional completion capabilities
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
-- for _, lsp in ipairs(servers) do
--   require('lspconfig')[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

-- Turn on lsp status information
-- require('fidget').setup()

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

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

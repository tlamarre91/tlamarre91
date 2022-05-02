require("packer").startup(function()
  use "wbthomason/packer.nvim" -- Plugin manager
  use "L3MON4D3/LuaSnip" -- Snippets
  use "famiu/nvim-reload" -- Add commands to reload config
  use "hrsh7th/nvim-cmp" -- Autocompletion plugin
  use "hrsh7th/cmp-buffer" -- nvim-cmp source
  use "kyazdani42/nvim-tree.lua" -- File explorer
  use "liuchengxu/vim-which-key" -- Which keys do what
  use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
  use "ap/vim-buftabline" -- Buffer list
  use "hoob3rt/lualine.nvim" -- Status line
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
  use "janko/vim-test" -- Run tests
  use "lambdalisue/suda.vim" -- Write as root
  -- use "liuchengxu/vista.vim" -- Code outline
  use "mbbill/undotree" -- Navigate undo history
	use "nacro90/numb.nvim" -- Peek when navigating by line number
  use "neovim/nvim-lspconfig"
  use "numToStr/Comment.nvim" -- Manage comments
  use "nvim-lua/plenary.nvim" -- Library for other plugins
  use "nvim-lua/popup.nvim" -- Library for other plugins
  use "nvim-telescope/telescope.nvim" -- Finder
  use "nvim-treesitter/nvim-treesitter" -- Do things with ASTs
  use "karb94/neoscroll.nvim" -- Smooth scrolling
  use "ray-x/lsp_signature.nvim" -- Show function signatures
  use "sainnhe/sonokai" -- Colorscheme
  use "simrat39/symbols-outline.nvim" -- Code outline
  use "tpope/vim-surround" -- Manipulate surrounding characters

	use {
		"folke/trouble.nvim", -- Diagnostics
		requires = "kyazdani42/nvim-web-devicons",
		config = function() 
			require("trouble").setup({
				mode = "document_diagnostics"
			})
		end
	}

  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
end)

require("Comment").setup()

require("lualine").setup({
  options = {
    theme = "gruvbox",
    section_separators = {"", ""},
    component_separators = {"", ""},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {"mode", upper = false} },
    lualine_b = { {"branch", icon = ""} },
    lualine_c = { {"filename", file_status = true, path = 1} },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location"  },
  },
  inactive_sections = {
    lualine_a = { },
    lualine_b = { },
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = { },
    lualine_z = { }
  },
  -- extensions = { "fzf" }
})

require("nvim-treesitter.configs").setup({
  -- ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = false,
    -- disable = { "typescript" }
  }
})
-- jinja2 treesitter grammar:
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.jinja2 = {
  install_info = {
    url = "https://github.com/dbt-labs/tree-sitter-jinja2", -- local path or git repo
    files = {"src/parser.c"},
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "zu", -- if filetype does not match the parser name
}
local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.html = "jinja2" -- the someft filetype will use the python parser and queries.

local telescope = require("telescope")
telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "assets/*",
      "node_modules/*",
      -- "lib/*",
      "xcf/*",
      "package-lock.json"
    }
  },
  pickers = {
    live_grep = {
      file_ignore_patterns = {
        "assets/*",
        "node_modules/*",
        -- "lib/*",
        "xcf/*",
        "package-lock.json"
      }
    }
  }
})
-- telescope.load_extension("fzf");

require("nvim-tree").setup()

local luasnip = require("luasnip")

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    -- ["<CR>"] = cmp.mapping.confirm {
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true,
    -- },
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" }
  },
})

require("lsp_signature").setup({
	-- bind = true
})
require("numb").setup()
-- require("neoscroll").setup({
--     performance_mode = false,
--     stop_eof = false
-- })

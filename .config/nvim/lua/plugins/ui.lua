return {
  {
    "sainnhe/sonokai",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("sonokai")
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    opts = {},
  },

  {
    "akinsho/bufferline.nvim",
    dependencies = { "echasnovski/mini.icons" },
    keys = {
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = {
      options = {
	diagnostics = "nvim_lsp",
	always_show_bufferline = false,
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      delay = 500,
    },
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
      { "<leader>xl", "<cmd>Trouble lsp toggle<cr>", desc = "LSP Definitions / References" },
    },
    opts = {},
  },
}

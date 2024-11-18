return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "python",
        "typescript",
        "javascript",
        "java",
        "tsx",
        "go",
      },
    },
  },

  { "nvchad/showkeys", lazy = true },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },
  --
  {
    "nvim-neotest/nvim-nio",
  },

  {
    "rcarriga/nvim-dap-ui",
    dofile(vim.g.base46_cache .. "dap"),
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "configs.dap-ui"
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "configs.dap-python"
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "configs.dap-java"
    end,
  },
  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dap-go").setup()
      local dap, dapui = require "dap", require "dapui"

      require("dapui").setup()
      require("dap-go").setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = false,
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.icons",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },

    config = function()
      local telescope = require "telescope"
      local nvchad_telescope = require "nvchad.configs.telescope"

      telescope.setup(vim.tbl_deep_extend("force", nvchad_telescope or {}, {
        defaults = {
          file_ignore_patterns = {
            "%.git/",
            "__pycache__/",
            "%.pyc",
            "lazy%-lock.json",
          },
        },
      }))
    end,
  },
}

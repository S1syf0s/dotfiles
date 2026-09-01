-- lua/config/plugins/lsp.lua
return {
  -- Mason: LSP serverien asentaja
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-lspconfig: automaattinen asennus + enable
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "rust_analyzer",
          "clangd",
          "html",
          "cssls",
          "emmet_ls",
          "jsonls",
          "eslint",
        },
        automatic_enable = true,
      })
    end,
  },

  -- Varsinainen LSPConfig
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local map = vim.keymap.set

      map("n", "gd", vim.lsp.buf.definition)
      map("n", "K", vim.lsp.buf.hover)

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
      })


      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = {"clangd", "--header-insertion=never"},
      })


    end,
  },
}

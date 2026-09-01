-- lua/config/plugins/completion.lua
return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "*",
    lazy = false,
    config = function()
      require("blink.cmp").setup({
        keymap = {
          preset = "default",

          ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
          ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
          ["<CR>"] = { "accept", "fallback" },
        },

        appearance = {
          nerd_font_variant = "mono",
        },

        completion = {
          documentation = {
            auto_show = true,
          },
        },

        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },

        cmdline = { enabled = false },
      })
    end,
  },
}

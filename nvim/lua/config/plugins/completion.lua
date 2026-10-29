return {}

-- lua/config/plugins/completion.lua

--[[

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
          ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
          ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
          ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
          ["<CR>"] = { "accept", "fallback" },
        },

        appearance = {
          nerd_font_variant = "mono",
        },

        completion = {
           
            menu = {
                auto_show = false,
            },

            trigger = {
               show_on_insert = false,
               show_on_trigger_character = false,
            },
            documentation = {
                auto_show = false,
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
]]

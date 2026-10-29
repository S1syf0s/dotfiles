-- return { 
--     "catppuccin/nvim",
--     name = "catppuccin",
-- 
--     priority = 1000,
-- 
--     config = function()
--       require("catppuccin").setup({
--         flavour = "mocha",
-- 
--         integrations = {
--           telescope = true,
--         },
--       })
-- 
--       vim.cmd.colorscheme("catppuccin")
-- 
--       vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     end,
--   },
-- }

return {
  "blazkowolf/gruber-darker.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("gruber-darker")
  end,
}

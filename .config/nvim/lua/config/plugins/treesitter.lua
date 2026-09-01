return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "c",
        "cpp",
        "rust",
        "bash",
        "json",
        "html",
        "css",
        "markdown",
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        if vim.bo.buftype ~= "" or vim.bo.filetype == "" then
          return
        end
        pcall(vim.treesitter.start)
      end,
    })
  end,
}

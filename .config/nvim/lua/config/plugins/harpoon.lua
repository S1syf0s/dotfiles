return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      local list = harpoon:list()

      local function harpoon_bar()
        local s = ""

        for i, item in ipairs(list.items) do
          local name = vim.fn.fnamemodify(item.value, ":t")
          s = s .. " " .. i .. ":" .. name
        end

        return s
      end

      _G.harpoon_bar = harpoon_bar
      vim.o.winbar = "%{%v:lua.harpoon_bar()%}"

      vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
        callback = function()
          if vim.bo.filetype ~= "TelescopePrompt" then
            vim.wo.winbar = "%{%v:lua.harpoon_bar()%}"
          end
        end,
      })

      vim.keymap.set("n", "<leader>a", function()
        list:add()
      end)

      vim.keymap.set("n", "<leader>hd", function()
        list:remove()
      end)

      vim.keymap.set("n", "<leader>hda", function()
        list:clear()
      end)

      for i = 1, 5 do
        vim.keymap.set("n", "<C-" .. i .. ">", function()
          list:select(i)
        end)
      end
    end,
  },
}

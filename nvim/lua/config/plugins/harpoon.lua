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
      local item = list.config.create_list_item(list.config)

      for i = 1, list:length() do
        if list.config.equals(list.items[i], item) then
          table.remove(list.items, i)
          list._length = list._length - 1
          break
        end
      end

      vim.cmd("redrawstatus!")
    end, { desc = "Harpoon: poista nykyinen tiedosto" })
      
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

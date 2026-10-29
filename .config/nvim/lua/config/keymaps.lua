local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>u", vim.cmd.UndotreeToggle)
map("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<leader>tt", function()
    local cwd = vim.fn.getcwd()
    vim.fn.jobstart({ "alacritty", "--working-directory", cwd }, {
        detach = true,
    })
end, { desc = "Open Alacritty in current directory" })


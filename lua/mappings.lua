require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-q>", ":q<CR>")

map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "terminal close term in terminal mode" })

-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open "default"
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

map('n', '<leader>mh', '<cmd>lua require("minty.huefy").open()<CR>', { noremap = true, silent = true })
map('n', '<leader>oh', '<cmd>lua require("minty.shades").open()<CR>', { noremap = true, silent = true })

vim.api.nvim_create_user_command("OpenShowkeys", function()
  require("showkeys").toggle()
end, {})

map("n", "<C-k>", ":OpenShowkeys<CR>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

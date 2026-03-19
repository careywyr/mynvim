-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Option+O 打开文件搜索（终端兼容）
map("n", "<M-o>", function() Snacks.picker.files() end, { desc = "Open File" })
map("i", "<M-o>", function() Snacks.picker.files() end, { desc = "Open File" })

-- Option+P 搜索文件
map("n", "<M-p>", function() Snacks.picker.files() end, { desc = "Find Files" })
map("i", "<M-p>", function() Snacks.picker.files() end, { desc = "Find Files" })

-- Option+F 全局搜索
map("n", "<M-f>", function() Snacks.picker.grep() end, { desc = "Global Search" })
map("i", "<M-f>", function() Snacks.picker.grep() end, { desc = "Global Search" })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 1. 缩放设置

-- 增加缩放 (Ctrl + +)
vim.keymap.set("n", "<C-=>", function()
  local current = vim.g.neovide_scale_factor or 1.0
  vim.g.neovide_scale_factor = current + 0.1
end)

-- 减小缩放 (Ctrl + -)
vim.keymap.set("n", "<C-->", function()
  local current = vim.g.neovide_scale_factor or 1.0
  vim.g.neovide_scale_factor = current - 0.1
end)

-- 重置缩放 (Ctrl + 0)
vim.keymap.set("n", "<C-0>", function()
  vim.g.neovide_scale_factor = 1.0
end)

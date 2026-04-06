-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.spell = false
-- 默认开启自动换行
vim.opt.wrap = true

-- 开启“软换行”优化：不会在单词中间断开
vim.opt.linebreak = true

-- 换行后的缩进与上一行对齐，看起来更整齐
vim.opt.breakindent = true

vim.opt.guifont = { "JetBrainsMono Nerd Font", "h14" }

if vim.g.neovide then
  -- 1. 设置透明度 (0.0 到 1.0 之间，建议 0.8 左右)
  -- 注意：这会让你看到窗口背后的壁纸
  vim.g.neovide_opacity = 0.8

  -- 2. 开启 macOS 的毛玻璃模糊效果（非常关键，否则背景太乱看不清字）
  vim.g.neovide_window_blurred = true

  -- 3. 配合透明度，建议把悬浮窗也设为透明（可选）
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
end

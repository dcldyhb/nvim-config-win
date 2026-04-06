-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- 1. 基础文字编辑设置
vim.opt.spell = false -- 关闭拼写检查
vim.opt.wrap = true -- 开启自动换行
vim.opt.linebreak = true -- 不在单词中间断行
vim.opt.breakindent = true -- 折行后保持缩进对齐
vim.opt.startofline = true -- 跳转行时，光标自动跳到该行第一个非空格字符

-- 2. 字体设置 (支持所有 GUI 客户端)
vim.o.guifont = "JetBrainsMono Nerd Font:h14"

-- 3. 智能启动逻辑 (仅在无参数时进入配置模式，并修复 LSP 类型警告)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- 获取启动参数列表
    local args = vim.fn.argv()

    -- 情况 A：直接启动（没有参数，例如只输入 nvim 或点击 Neovide 图标）
    -- 此时我们认为你是想修改配置
    if #args == 0 then
      -- 跳转到配置目录
      vim.api.nvim_set_current_dir(vim.fn.stdpath("config"))
      -- 自动打开配置目录的侧边栏
      if Snacks and Snacks.explorer then
        Snacks.explorer.open()
      end
    end

    -- 情况 B：如果带了参数 (如 nvim . 或 nvim file.txt)，我们什么都不做
    -- 这样就不会触发之前的 Dashboard 叠加 Bug 和路径跳转问题
  end,
})

-- 4. Neovide 专属视觉配置
if vim.g.neovide then
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  -- 解决部分系统下 Neovide 启动路径不一致的问题
  vim.g.neovide_input_use_logo = true -- 允许使用 Command 键
end

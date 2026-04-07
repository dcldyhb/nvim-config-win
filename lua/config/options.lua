-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- 1. 基础文字编辑配置
vim.opt.spell = false -- 关闭拼写检查
vim.opt.wrap = true -- 开启自动换行
vim.opt.linebreak = true -- 不在单词中间断行
vim.opt.breakindent = true -- 折行后保持缩进对齐
vim.opt.startofline = true -- 跳转行时，光标自动跳到该行第一个非空格字符

-- 2. 字体配置 (支持所有 GUI 客户端)
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
  vim.g.neovide_scale_factor = 0.8
  vim.g.neovide_opacity = 1.0
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  -- 解决部分系统下 Neovide 启动路径不一致的问题
  vim.g.neovide_input_use_logo = true -- 允许使用 Command 键
end

-- 5. 基础交互配置
vim.opt.clipboard = "unnamedplus" -- 使用系统剪贴板，允许使用 y 复制的内容直接粘贴到外部软件中，外部复制的内容也可以直接粘贴到 Neovim 中

vim.opt.completeopt = { "menu", "menuone", "noselect" } -- 补全菜单设置，显示补全菜单但不自动选择任何项

vim.opt.mouse = "a" -- 允许使用鼠标

-- 6. 缩进与制表符配置，主要是将 tab 键设置为 4 个空格
vim.opt.tabstop = 4 -- 一个 Tab 键等于 4 个空格
vim.opt.shiftwidth = 4 -- 自动缩进时使用 4 个空格
vim.opt.softtabstop = 4 -- 在插入模式下，Tab 键和 Backspace 键的行为像 4 个空格
vim.opt.expandtab = true -- 将 Tab 键转换为空格

-- 7. 用户界面配置
vim.opt.number = true -- 显示行号
vim.opt.relativenumber = true -- 显示相对行号
vim.opt.cursorline = true -- 高亮当前行
vim.opt.splitbelow = true -- 水平分屏时，新的窗口在下方
vim.opt.splitright = true -- 垂直分屏时，新的窗口在右侧

-- 8. 搜索配置
vim.opt.incsearch = true -- 搜索时高亮匹配项

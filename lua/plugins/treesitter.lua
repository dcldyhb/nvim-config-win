return {
  -- 1. TreeSitter 核心配置
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "lua",
        "markdown",
        "markdown_inline",
        "latex",
        "python",
        "vimdoc",
      })
    end,
  },

  -- 2. 开启“粘性标题”插件 (Treesitter Context)
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "LazyFile", -- 只有在打开文件时才加载，节省内存
    opts = {
      mode = "cursor", -- 粘性范围跟随光标
      max_lines = 3, -- 【关键】最多显示 3 行标题，防止公式太长占满屏幕
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 1, -- 即使标题有多行，也只显示第一行
      trim_scope = "outer",
    },
    keys = {
      -- 增加一个跳转到当前标题的快捷键：按 [c 即可跳回所属章节
      {
        "[c",
        function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end,
        desc = "跳转到所属标题/上下文",
      },
    },
  },
}

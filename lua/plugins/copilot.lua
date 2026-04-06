return {
  -- 1. Copilot 核心插件
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false }, -- 关闭自带悬浮窗，改用补全列表显示
      panel = { enabled = false },
      filetypes = {
        markdown = true, -- 确保你的物理笔记生效
        help = false,
        gitcommit = false,
      },
    },
  },

  -- 2. 让 Copilot 出现在 blink.cmp 的补全列表里
  {
    "saghen/blink.cmp",
    dependencies = { "giuxtaposition/blink-cmp-copilot" },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100, -- 让 Copilot 的建议排在前面
            async = true,
          },
        },
      },
    },
  },
}

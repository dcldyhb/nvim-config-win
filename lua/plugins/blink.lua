return {
  "saghen/blink.cmp",
  opts = {
    -- 1. 干净的补全源
    sources = {
      default = { "lsp", "path", "snippets" },
    },

    -- 2. 核心按键映射
    keymap = {
      preset = "none",

      -- Tab 逻辑：不再 select_next，而是直接 accept（确认）
      -- 如果菜单开启：确认当前选中的（通常是第一个）并关闭菜单
      -- 如果在 snippet 坑位：跳到下一个坑位
      ["<Tab>"] = { "accept", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      -- 翻页/选择逻辑：交给 Ctrl + j/k
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },

      -- 回车键：始终保持换行功能
      ["<CR>"] = { "fallback" },

      ["<C-e>"] = { "hide", "fallback" },
    },

    -- 3. 补全行为定制
    completion = {
      list = {
        selection = {
          -- 关闭 preselect，使得需要手动进入代码补全状态，优化在代码片段中的输入体验
          preselect = false,
          -- 开启自动插入，增强视觉反馈
          auto_insert = true,
        },
      },
      menu = { draw = { treesitter = { "lsp" } } },
      documentation = { auto_show = true },
    },

    signature = { enabled = true },
  },
}

return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false, -- 启动时立即生效
    opts = {
      -- 这一部分定义了哪些界面元素需要变透明
      extra_groups = {
        "NormalFloat", -- 悬浮窗口
        "NvimTreeNormal", -- 如果你用侧边栏
        "NeoTreeNormal",
        "MasonNormal",
        "LazyNormal",
      },
      exclude_groups = {}, -- 你不想变透明的组可以放这里
    },
  },
}

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- 强制主题透明
      styles = {
        sidebars = "transparent", -- 侧边栏透明
        floats = "transparent", -- 悬浮窗透明
      },
    },
  },
}

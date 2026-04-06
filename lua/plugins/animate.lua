return {
  {
    -- 重点修改这一行，换成新的名字
    "nvim-mini/mini.animate",
    opts = function()
      local animate = require("mini.animate")
      return {
        cursor = {
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 200, unit = "total" }),
        },
      }
    end,
  },
}

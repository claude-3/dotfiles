return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  version = "*",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        style_preset = bufferline.style_preset.minimal,
        mode = "tabs",
        -- themable = true, -- allows highlight overriden
        separator_style = "thin", -- slant / slope / thick / thin
      },
    })
  end,
}

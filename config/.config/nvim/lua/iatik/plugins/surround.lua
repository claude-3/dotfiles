return {
  "kylechui/nvim-surround",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  -- NOTE: User for stability; omit to use `main` branch for the latest features
  version = "*",
  config = true, -- デフォルトで遅延読み込みになる
}

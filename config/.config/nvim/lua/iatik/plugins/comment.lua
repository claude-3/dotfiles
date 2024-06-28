return {
  "numToStr/Comment.nvim",
  event = {
    "BufReadPre", -- バッファが読み込まれる前
    "BufNewFile" -- 新しいファイルが作成される時
  },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring", -- コンテキストに基づいたコメントスタイルを提供するプラグイン
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- tsx, jsx, svelte, htmlファイルのコメント処理を適切に行うために
      -- ts_context_commentstringプラグインのフックを使用
      -- このフックにより、ファイルタイプやコンテキストに応じたコメントスタイルが適用される
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}

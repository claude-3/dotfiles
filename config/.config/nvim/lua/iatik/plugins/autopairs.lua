return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- import nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- configure autopairs
    autopairs.setup({
      check_ts = true, -- Treesitterを有効にする

      -- 特定の言語の特定のTreesitterノード内ではペアを追加しない設定
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javascript template_string treesitter nodes
      },
    })

    -- nvim-autopairsの補完機能をインポート
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- nvim-cmpプラグインをインポート
    local cmp = require("cmp")

    -- 補完が確定したときにnvim-autopairsの補完機能を実行
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}

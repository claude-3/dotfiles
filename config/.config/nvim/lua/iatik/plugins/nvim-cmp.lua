return {
  "hrsh7th/nvim-cmp", -- オートコンプリートエンジン
  event = "InsertEnter", -- Insertモードに入ったときに読み込む
  dependencies = {
    "hrsh7th/cmp-buffer", -- 現在のバッファ内のテキストをオートコンプリートの候補にする
    "hrsh7th/cmp-path", -- ファイルシステムのパスをオートコンプリートの候補にする
    -- TODO: もしあれば、css、prettierrc、eslintrcの入力補助をもっと強力にしたい
    {
      "L3MON4D3/LuaSnip", -- スニペットエンジン
      -- follow latest release
      -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- LuaSnip用のオートコンプリートソース
    "rafamadriz/friendly-snippets", -- よく使われるスニペットのコレクション
    "onsails/lspkind.nvim", -- オートコンプリートメニューにVS Code風のアイコンを表示
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- VS Codeスタイルのスニペットを読み込む (friendly-snippets など)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      -- コンプリートオプションを設定
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },

      -- スニペット展開のための設定
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- キーマッピングの設定
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous
        ["<C-j>"] = cmp.mapping.select_next_item(), -- previous
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- ドキュメントを4行上にスクロール
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- ドキュメントを4行下にスクロール
        -- ["<C-space>"] = cmp.mapping.complete(), -- show completion suggestions
        -- ["<leader>c"] = cmp.mapping.complete(), -- オートコンプリート候補を表示
        ["<C-e>"] = cmp.mapping.abort(), -- オートコンプリートを中止
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- 現在の候補を確定（選択はしない）
      }),

      -- オートコンプリートのソースを設定
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- スニペット
        { name = "buffer" }, -- 現在のバッファ内のテキスト
        { name = "path" }, -- ファイルシステムのパス
      }),

      -- lspkind を使ってオートコンプリートメニューにアイコンを表示
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}

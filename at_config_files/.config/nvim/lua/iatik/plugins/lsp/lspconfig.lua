return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- コード補完機能を提供するプラグイン
    { "antosha417/nvim-lsp-file-operations", config = true }, -- ファイル操作をサポートするプラグイン
    -- { "folke/neodev.nvim", opts = {} }, -- Development of neodev.nvim is now EOL
    { "folke/lazydev.nvim", ft = "lua", opts = {} }, -- neodev.nvim suggest this plugin
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        -- opts.desc = "Go to declaration"
        -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "T", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- ***** ここから: mason-lspconfigのv2.0以降のBrakingChangesによる変更 (2025-06-03) *****

    -- mason-lspconfigのセットアップは、基本的にはこれでOK。
    -- デフォルトのcapabilitiesを渡す
    -- mason_lspconfig.setup({
    -- デフォルトのLSP設定をここで定義できる
    -- 例えば、すべてのLSPサーバーに共通の設定を適用したい場合など
    -- ensure_installed = { "lua_ls", "jsonls", ... }, -- masonで自動インストールしたいLSPサーバーがあればここに記述
    -- auto_install = true, -- デフォルトでtrueなので不要だが、明示的に指定することも可能
    --
    -- 以下はmason-lspconfigのドキュメントの例からの引用ですが、
    -- ほとんどの場合、デフォルトで十分です。
    -- handlers = {
    --   -- デフォルトのハンドラは自動的に設定されるため、明示的に記述する必要はほぼありません。
    --   -- function(server_name)
    --   --   lspconfig[server_name].setup({
    --   --     capabilities = capabilities,
    --   --   })
    --   -- end,
    -- },
    -- })

    -- 特定のLSPサーバーにカスタマイズされた設定を適用する
    -- ここでは、以前の `setup_handlers` 内に記述していた個別の設定をそのまま移行します。
    -- これらの設定は、mason-lspconfigのデフォルト設定を上書き（または追加）します。

    -- configure graphql language server
    lspconfig["graphql"].setup({
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    -- configure emmet language server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "svelte",
      },
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
            disable = { "missing-fields" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    -- ***** ここまで: mason-lspconfigのv2.0以降のBrakingChangesによる変更 (2025-06-03) *****
  end,
}

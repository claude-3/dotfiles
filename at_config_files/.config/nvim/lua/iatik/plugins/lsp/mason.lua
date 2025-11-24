return {
  {
    -- 各lspサーバーをインストールする機能
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        -- "tsserver", -- javascript, typescript
        -- "vtsls", -- javascript, typescript
        "ts_ls",
        "biome", -- js/ts linter & formatter
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "prismals", -- prisma
        "pyright", -- python
        "intelephense", -- php
        -- "graphql",
        "dockerls",
        "jsonls",
        -- "eslint",
        -- "astro",
      },
    },
    dependencies = {
      {
        -- UIで使うアイコンを設定
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier", -- prettier formatter
        -- "eslint_d", -- js/ts linter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "php-cs-fixer", -- php formatter
        "pylint", -- python linter
        "phpstan", -- php linter
      },
    },
    dependencies = {
      "mason-org/mason.nvim",
    },
  },
}

return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- import mason-tool-installer
    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- "tsserver", -- javascript, typescript
        "vtsls", -- javascript, typescript
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "prismals", -- prisma
        "pyright", -- python
        "intelephense", -- php
        "graphql",
        "dockerls",
        "jsonls",
        "biome", -- js/ts linter & formatter
        -- "eslint",
        -- "astro",
      },
      automatic_enable = true,
    })

    mason_tool_installer.setup({
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
    })
  end,
}

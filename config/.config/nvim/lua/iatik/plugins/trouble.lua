return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  opts = {},
  cmd ="Trouble",
  keys = {
    -- Trouble API : `Trouble [mode] [action] [options]`
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "診断結果 Diagnostics (Trouble)",
    },
    {
      "<leader>xw",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "カレントバッファの診断結果 Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "シンボルを表示 Symbols (Trouble)",
    },
    {
      "<leader>xd",
      "<cmd>Trouble lsp_document_symbols toggle<cr>",
      desc = "ドキュメントを表示 Document (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp_definitions toggle<cr>",
      -- "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSPの定義や参照情報 LSPDefinitions/references",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xq",
      "<cmd>Trouble quickfix toggle<cr>",
      -- "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
    {
      "<leader>xt",
      "<cmd>Trouble todo toggle filter={tag = {TODO,FIX,FIXME}}<cr>",
      -- "<cmd>Trouble qflist toggle<cr>",
      desc = "TODO",
    },
    -- ---------------------------------------------------
    -- {
    --   "<leader>xx",
    --   "<cmd>TroubleToggle<CR>",
    --   desc = "Open/close trouble list",
    -- },
    -- {
    --   "<leader>xw",
    --   "<cmd>TroubleToggle workspace_diagnostics<CR>",
    --   desc = "Open trouble workspace diagnostics",
    -- },
    -- {
    --   "<leader>xd",
    --   "<cmd>TroubleToggle document_diagnostics<CR>",
    --   desc = "Open trouble document diagnostics",
    -- },
    -- {
    --   "<leader>xq",
    --   "<cmd>TroubleToggle quickfix<CR>",
    --   desc = "Open trouble quickfix list",
    -- },
    -- {
    --   "<leader>xl",
    --   "<cmd>TroubleToggle loclist<CR>",
    --   desc = "Open trouble location list",
    -- },
    -- {
    --   "<leader>xt",
    --   "<cmd>TodoTrouble<CR>",
    --   desc = "Open todos in trouble",
    -- },
  },
}

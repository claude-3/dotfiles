-- ■ lazy.nvim(プラグインマネージャー)を自動的にインストールし、Neovimの設定に組み込むための記述

-- ▼ lazy.nvimをインストールする場所を指定
-- 変数lazypathに、lazy.nvimプラグインのインストール先ディレクトリを代入
-- Neovimのデータディレクトリのパスと、/lazy/lazy.nvimを文字列として繋いでパスを完成させる
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- ▼ lazypathで指定したパスがすでに存在するかどうかでlazy.nvimがインストールされてるかを確認
-- 結果がfalseなら、vim.fn.system()を実行
if not vim.loop.fs_stat(lazypath) then
  -- Luaスクリプトからシェルコマンドを呼び出せる関数を実行
  vim.fn.system({
    -- gitでlazy.nvimをクローンする
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- ▼ Neovimがプラグインの読み込み時にlazy.nvimを最優先で探すようにする
-- Neovimの runtimepath の先頭に lazypath を追加する
vim.opt.rtp:prepend(lazypath)

-- ▼ lazy.nvim を読み込み、指定したファイル/モジュールを使って設定を行うようにする
require("lazy").setup({ { import = "iatik.plugins" }, { import = "iatik.plugins.lsp" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

#!/bin/bash

set -e  # エラーが発生した時点でスクリプトを終了

echo "Xcodeをインストールします..."
xcode-select --install || true  # インストール済みの場合のエラーを無視

# Rosetta install
echo "Rosettaをインストールします..."
sudo softwareupdate --install-rosetta --agree-to-license

# シンボリックリンクの作成
echo "zsh関連のシンボリックリンクを作成します..."
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zimrc ~/.zimrc

#------------------------------------------
# homebrew(arm64)
#------------------------------------------
echo "homebrewをインストールします..."
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrewは既にインストールされています。"
fi

echo "brew doctorを実行します..."
brew doctor

echo "brew updateを実行します..."
brew update --verbose

echo "brew upgradeを実行します..."
brew upgrade --verbose

echo ".Brewfileで管理しているアプリケーションをインストールします..."
brew bundle --file ~/dotfiles/.Brewfile --verbose

echo "brew cleanupを実行します..."
brew cleanup --verbose

echo "セットアップが完了しました。新しい設定を適用するには、ターミナルを再起動してください。"

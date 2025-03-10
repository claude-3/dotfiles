#!/bin/bash

# 非表示ファイルを表示する
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finderのステータスバーを表示する
# defaults write com.apple.finder ShowStatusBar -bool true

# Finderのパスバーを表示する
defaults write com.apple.finder ShowPathbar -bool true

# Finderの拡張子を常に表示する
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finderを再起動して設定を反映させる
killall Finder

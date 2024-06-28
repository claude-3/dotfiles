#!/bin/sh

#関数の読み込み
# dotfilesのディレクトリ
dotfiles_root=$(cd $(dirname $0)/.. && pwd)
#. ${dotfiles_root}/_common.sh
. ~/dotfiles/_common.sh

# シンボリックリンクを作成
cd ${dotfiles_root}/dotfiles
for linklist in "linklist.txt"; do
  [ ! -r "${linklist}" ] && continue

    __remove_linklist_comment "$linklist" | while read target link; do
    # ~ や環境変数を展開
    target=$(eval echo "${PWD}/${target}")
    link=$(eval echo "${link}")
    # シンボリックリンクを作成
    __mkdir $(dirname ${link})
    __ln ${target} ${link}
  done
done
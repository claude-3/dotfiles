#!/bin/sh

#関数の読み込み
dotfiles_root=$(cd $(dirname $0)/.. && pwd)
#. ${dotfiles_root}/_common.sh
. ~/dotfiles/_common.sh

# シンボリックリンクを削除
cd ${dotfils_root}/dotfiles
for linklist in "linklist.txt"; do
 [ ! -r "${linklist}" ] && continue
  
  __remove_linklist_comment "$linklist" | while read target link; do
    # ~ や環境変数を展開
    link=$(eval echo "${link}")
    # シンボリックリンクを作成
    __unlink ${link}
  done
done

# ======= Zinitのセット ========
# Zinit という Zsh プラグイン管理ツールの設定
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Zinit ディレクトリが存在するか確認し、存在しない場合はリポジトリをクローン
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"  # 親ディレクトリが存在しない場合は作成
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Zinit を読み込み
source "${ZINIT_HOME}/zinit.zsh"


# ======= PATHの追加 ========
# Homebrew (brewでインストールしたものはまとめてここからPATHに登録される)
eval "$(/opt/homebrew/bin/brew shellenv)"
# PostgreSQLのバージョン指定？
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# Mise
eval "$(mise activate zsh)"


# ======== Zsh プラグイン ========
# Zsh シンタックスハイライトプラグインをインストールして読み込み
zinit light zsh-users/zsh-syntax-highlighting

# Zsh コンプリーションプラグインをインストールして読み込み
zinit light zsh-users/zsh-completions

# Zsh オートサジェスチョンプラグインをインストールして読み込み
zinit light zsh-users/zsh-autosuggestions

# Fzf-tab プラグインをインストールして読み込み（タブ補完の強化）
zinit light Aloxaf/fzf-tab


# ======== Zsh プラグイン（続き） ========
# 様々なプラグインを Zinit スニペットで読み込み
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

if [[ "$OSTYPE" == linux* ]]; then
  zinit snippet OMZP::archlinux
fi


# ======== コンプリーションの設定 ========
# Zsh コンプリーションを初期化
autoload -U compinit && compinit

# ======== キー割り当て ========
# Ctrl+f でオートサジェスチョンを確定
bindkey '^f' autosuggest-accept

# Ctrl+p で履歴を逆検索
bindkey '^p' history-search-backward

# ======== 履歴の設定 ========
# 履歴の最大数を 5000 に設定
HISTSIZE=5000

# 履歴ファイルの場所を指定
HISTFILE=~/.zsh_history

# 保存する履歴の数を設定
SAVEHIST=$HISTSIZE

# 重複した履歴を削除
HISTDUP=erase

# 履歴を共有し、スペースで区切られたコマンドを1つのエントリとして扱う
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_find_no_dups

# ======== コンプリーションのスタイル設定 ========
# コンプリーションのスタイルを設定（色やメニュー表示など）
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle 'fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle 'fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ======== エイリアス ========
# ls コマンドに色付け
# alias ls='ls --color'
alias ls='eza -al'

# clear コマンドのエイリアス
alias c='clear'


# ======== Shell intergrations ========
# Fzf のシェル統合を読み込み
eval "$(fzf --zsh)"

# Zoxide のシェル統合を読み込み（cd の履歴管理）
eval "$(zoxide init --cmd cd zsh)"

# thefuck
eval $(thefuck --alias)

# eslint_d
export ESLINT_USE_FLAT_CONFIG=true


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



# Starship prompt (ファイルの最後に記述)
eval "$(starship init zsh)"

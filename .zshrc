# ======= Zinitのセット ========
# Zinit(Zsh プラグイン管理ツール)の設定
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Zinit ディレクトリが存在するか確認し、存在しない場合はリポジトリをクローン
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"  # 親ディレクトリが存在しない場合は作成
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Zinit の読み込み
source "${ZINIT_HOME}/zinit.zsh"


# ======= PATHの追加 ========
# Homebrew (brewでインストールしたものはまとめてここからPATHに登録される)
eval "$(/opt/homebrew/bin/brew shellenv)"
# PostgreSQLのバージョン指定？
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# Mise (Node.jsなどのバージョン管理ツール)
eval "$(mise activate zsh)"


# ======== Zsh プラグインの読み込み ========
# Zsh シンタックスハイライトプラグイン
zinit light zsh-users/zsh-syntax-highlighting

# Zsh コンプリーションプラグイン
zinit light zsh-users/zsh-completions

# Zsh オートサジェスチョンプラグイン
zinit light zsh-users/zsh-autosuggestions

# Fzf-tab(タブ補完の強化)プラグイン
zinit light Aloxaf/fzf-tab


# ======== Zsh プラグインの読み込み（Oh My Zshのプラグイン利用） ========
# 様々なプラグインを Zinit スニペットで読み込み
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found
# zinit snippet OMZP::sudo

# Linuxで使う
if [[ "$OSTYPE" == linux* ]]; then
  zinit snippet OMZP::archlinux
fi


# ======== コンプリーションの設定 ========
# Zshの補完機能を有効化
autoload -U compinit && compinit


# ======== キー割り当て ========
# Ctrl+f でオートサジェスチョンを確定
bindkey '^f' autosuggest-accept

# Ctrl+p で履歴を逆検索
bindkey '^p' history-search-backward


# ======== 履歴の設定 ========
# メモリに保存する履歴の最大数をに設定
HISTSIZE=5000

# 履歴ファイルの場所を指定
HISTFILE=~/.zsh_history

# 履歴ファイルに保存する履歴の数を履歴の最大数と同じに設定
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
alias ls='eza --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias ll='eza -al --icons --group-directories-first'
alias l='eza -al --icons --group-directories-first'
# nvim
alias v='nvim'
# zshrcを編集する
alias vz='nvim ~/.zshrc'
# fzf
alias vf='nvim $(fzf)'
alias vfp='fzf --preview "bat --style=numbers --color=always {}" | xargs -n 1 nvim'
# diff
df() {
  nvim -d "$(fzf --prompt="File-1: ")" "$(fzf --prompt="File-2: ")"
}
# zellij
alias zj='zellij'

# clear コマンドのエイリアス
alias c='clear'

# ======== ghq管理下のリポジトリに移動 ========
# 環境変数で管理ディレクトリを設定
export GHQ_ROOT=~/dev
# リポジトリ移動用のコマンドを用意
cdr() {
  local repodir=$(ghq list | fzf -1 +m) && cd $(ghq root)/$repodir
}


# ======== Shell intergrations ========
# Fzf のシェル統合を読み込み
eval "$(fzf --zsh)"

# Zoxide のシェル統合を読み込み（cd の履歴管理）
eval "$(zoxide init --cmd cd zsh)"

# thefuck
eval $(thefuck --alias)

# eslint_d
export ESLINT_USE_FLAT_CONFIG=true

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# ======== その他 ========
# デフォルトエディタの設定
export EDITOR=nvim


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


# Starship prompt (プロンプトのカスタマイズ)
# ファイルの最後に記述する
eval "$(starship init zsh)"

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/tkfm/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git osx bundler brew)

source $ZSH/oh-my-zsh.sh

# User configuration
alias vi="nvim"
alias vim="nvim"

PROMPT="%B%F{cyan}❯%f%b "

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# tmuxを自動起動する
# 初期に用意されているセッション
# "prefix -> (" or "prefix -> )" でセッション切り替え
TMUX_INITIAL_SESSIONS=(
"config"
"works"
"personal"
)

# 初期セッションが存在していなかったらバックグラウンドで作る
for tmux_session in ${TMUX_INITIAL_SESSIONS[@]}
do
  if ! $(tmux has-session -t ${tmux_session} 2> /dev/null)
  then
    tmux new-session -d -s ${tmux_session}
  fi
done

# tmux が起動中でなければ attach する
if [ -z "$TMUX" ]
then
  tmux attach-session -t "${TMUX_INITIAL_SESSIONS[0]}"
else
fi

TMUX_INITIAL_SESSIONS=(
"default"
)

if ! $(tmux has-session -t ${tmux_session} 2> /dev/null)
then
  tmux new-session -d -s ${tmux_session}
fi


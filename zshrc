HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
CASE_SENSITIVE="true"

setopt AUTO_CD

PROMPT='%F{green}%n@%m:%~$ %f'

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestion>
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-hig>


. "$HOME/.local/bin/env"

function y() {
    local tmp="$(mktemp -t 'yazi-cwd.XXXXXX')"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD>
        cd -- "$cwd"
        zle reset-prompt
    fi
    rm -f -- "$tmp"
}

alias la='ls -a'
alias ls='ls --color=auto'
alias clera='clear'
alias t='tmux'
alias ..='cd ..'
alias ...='cd ../..'

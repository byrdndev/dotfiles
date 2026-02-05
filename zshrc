PROMPT='%F{green}%n@%m:%~$ %f'

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions>
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-high>

. "$HOME/.local/bin/env"

function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$>
                cd -- "$cwd"
                zle reset-prompt
        fi
        rm -f -- "$tmp"
}

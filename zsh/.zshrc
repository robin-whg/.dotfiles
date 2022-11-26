export PATH="$HOME/.local/bin:$PATH"

export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox

alias vi="nvim"
alias tm="tmux"
alias lg="lazygit"
alias ld="docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v ~/.config/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker"

function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# History
HISTFILE=~/.cache/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Prompt
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%{$fg[blue]%}%n@%m %{$fg[cyan]%}%~ %{$fg[red]%} ${vcs_info_msg_0_}%{$fg[blue]%}$ '

# General
setopt autocd extendedglob
unsetopt beep

# Tab Complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)                #Include hidden files.

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Plugins
if [ ! -d "$HOME/.config/zsh/plugins/antigen" ]; then
   git clone https://github.com/zsh-users/antigen.git $HOME/.config/zsh/plugins/antigen
fi

source $HOME/.config/zsh/plugins/antigen/antigen.zsh

antigen bundle jeffreytse/zsh-vi-mode

antigen bundle zsh-users/zsh-autosuggestions

antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle lukechilds/zsh-nvm

antigen apply

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

bindkey '^ ' autosuggest-accept

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
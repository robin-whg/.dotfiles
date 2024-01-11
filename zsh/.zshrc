# export TERM=wezterm
export TERM='xterm-256color'
export EDITOR=nvim
export VISUAL="$EDITOR"
export BROWSER=firefox
export NVM_LAZY_LOAD=true

alias ll="ls -l"
alias la="ls -la"
alias bat="batcat"
alias vim="nvim"
alias py="python3"
alias copy="xsel -ib"
alias tma="tmux new-session -A -s"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "jeffreytse/zsh-vi-mode"
plug "lukechilds/zsh-nvm"

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

bindkey '^ ' autosuggest-accept

# zap-prompt
autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git 

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst


zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"

PROMPT="%{$fg[cyan]%}%n@%m%  %(?:%{$fg[green]%}➜ :%{$fg[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ "

# pnpm
export PNPM_HOME="/home/robin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# auto start tmux
if [ -z "$TMUX" ]
then
    tmux new-session -A -s "general"
fi

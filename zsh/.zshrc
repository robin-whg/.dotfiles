if ! command -v wezterm &> /dev/null
then
  export TERM='xterm-256color'
else
  export TERM=wezterm
fi

export EDITOR=nvim
export VISUAL="$EDITOR"
export BROWSER=firefox
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim' 'nvim' 'npx' 'pnpx')

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

plug "zap-zsh/supercharge"

plug "jeffreytse/zsh-vi-mode"
ZVM_TERM='xterm-256color'
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# Fix cursor style when using tmux-resurrect
# ZVM_INIT_MODE=sourcing

plug "zsh-users/zsh-autosuggestions"
bindkey '^ ' autosuggest-accept

plug "zsh-users/zsh-syntax-highlighting"

plug "lukechilds/zsh-nvm"

# prompt
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

source "/etc/profile.d/rvm.sh"

# export PATH="$PATH:%HOME/.rvm/bin"

export PATH="$PATH:/opt/nvim-linux64/bin"

# auto start tmux
# if [ -z "$TMUX" ]
# then
    # tmux new-session -A -s "0"
# fi

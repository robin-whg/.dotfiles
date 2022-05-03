export EDITOR=nvim
export VISUAL=nvim
export BROWSER=brave

alias vi="nvim"
alias tm="tmux"

# Auto start Tmux
if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

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
PROMPT='%{$fg_bold[green]%}%n@%m %{$fg[cyan]%}%~ %{$fg[red]%}${vcs_info_msg_0_}%{$reset_color%}$ '

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
if [ ! -d "$HOME/.config/zsh/antigen" ]; then
   git clone https://github.com/zsh-users/antigen.git $HOME/.config/zsh/antigen
fi

source $HOME/.config/zsh/antigen/antigen.zsh

antigen bundle jeffreytse/zsh-vi-mode

antigen bundle zsh-users/zsh-autosuggestions

antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle lukechilds/zsh-nvm

antigen apply

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

bindkey '^ ' autosuggest-accept
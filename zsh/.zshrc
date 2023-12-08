# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "jeffreytse/zsh-vi-mode"
plug "lukechilds/zsh-nvm"

# Load and initialise completion system
autoload -Uz compinit
compinit

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

bindkey '^ ' autosuggest-accept

alias ll= "ls -l"
alias la= "ls -la"

export EDITOR=nvim
export VISUAL="$EDITOR"
export BROWSER=firefox

# pnpm
export PNPM_HOME="/home/robin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

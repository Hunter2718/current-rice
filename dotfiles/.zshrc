# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Init zinit
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"
source "${ZINIT_HOME}/bin/zinit.zsh"

# Set options
setopt autocd             # cd without typing cd
setopt correct            # autocorrect commands
setopt histignoredups     # no duplicate history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Prompt
zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search

# Aliases
alias ls='ls --color=auto -al'
alias ..='z ..'
alias ...='z ../..'
alias vi='nvim'
alias vim='nvim'
alias cd='z'
alias system-maintainance='~/SystemMaintainance.sh'

# zsh-autosuggestions config (optional highlight color)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# Path fix
export PATH="$HOME/.local/bin:$PATH"
alias screenshot='grim -g "$(slurp)" ~/Pictures/screenshot_$(date +%F-%T).png'

# Init zoxide
eval "$(zoxide init zsh)"

# Start fastfetch
fastfetch --logo arch3

export PATH="$HOME/.cargo/bin:$PATH"

export LC_TIME=en_DK.UTF-8

# ~/.zshrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Syntax highlighting colors
ZSH_HIGHLIGHT_STYLES[command]='fg=#89CFF0'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#89CFF0'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#89CFF0'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # loads nvm
# Enable bash completion compatibility before sourcing bash completion scripts
autoload -Uz bashcompinit 2>/dev/null
bashcompinit 2>/dev/null
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Environment variables & paths

NVIM_DIR="$HOME/.config/nvim"
PROJECT_DIR="$HOME/Projects"
CBP_PROJECT_DIR="$HOME/Projects/Consumers-Best-Project"

export PATH="$HOME/.local/bin:$PATH"

nvimconfig() {
  cd "$NVIM_DIR" && nvim init.lua
}

zshconfig() {
  nvim ~/.zshrc
}

tmuxconfig() {
  nvim ~/.tmux.conf
}

p10kconfig() {
  nvim ~/.p10k.zsh
}

b() {
  # --- Color Variables ---
  local TITLE="\e[1;38;5;219m"   # Bold Pastel Pink
  local HEAD="\e[1;38;5;117m"    # Bold Pastel Blue
  local CMD="\e[38;5;150m"       # Pastel Green
  local SEP="\e[90m"             # Dark Grey for separators
  local RST="\e[0m"              # Reset to default terminal color

  # --- Menu ---
  echo -e "${TITLE}AVAILABLE COMMANDS:${RST}\n"

  echo -e "${HEAD}// CONFIG FILES //${RST}"
  echo -e "${CMD}nvimconfig${RST}   - Open init.lua"
  echo -e "${CMD}zshconfig${RST}    - Open .zshrc"
  echo -e "${CMD}tmuxconfig${RST}   - Open .tmux.conf"
  echo -e "${CMD}p10kconfig${RST}   - Open .p10k.zsh"

  echo -e "${SEP}────────────────────────────────────────────────────────────${RST}"
  
  echo -e "${HEAD}// CHANGE DIRECTORY //${RST}"
  echo -e "${CMD}cdprojects${RST}   - Go to projects directory"
  echo -e "${CMD}cdcbp${RST}        - Go to Consumer's Best Project Repo"

  echo -e "${SEP}────────────────────────────────────────────────────────────${RST}"
  
  echo -e "${HEAD}// RELOAD //${RST}"
  echo -e "${CMD}zshreload${RST}    - Refresh .zshrc"
  echo -e "${CMD}tmuxreload${RST}   - Refresh .tmux.conf"
}

# Aliases
alias cdprojects='cd "$PROJECT_DIR"'
alias cdcbp='cd "$CBP_PROJECT_DIR"'
alias zshreload='source ~/.zshrc'
alias tmuxreload='tmux source-file ~/.tmux.conf'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

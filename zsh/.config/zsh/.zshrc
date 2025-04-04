# starship
export STARSHIP_CONFIG=~/.config/zsh/.starship.toml
eval "$(starship init zsh)"
# plugin manager
export ADOTDIR=~/.local/share/zsh-antigen/packages
export ANTIGEN_AUTO_CONFIG=false
export ANTIGEN_CHECK_FILES=(~/.config/zsh/.zshrc)
source ~/.local/share/zsh-antigen/antigen.zsh
# plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# loads NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias g="git"

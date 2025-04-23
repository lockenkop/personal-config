
if [[ ! -e ~/.config/zsh-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
fi
if [[ ! -e ~/.config/zsh-autosuggestions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ~/zsh-autosuggestions
fi
if [[ ! -e ~/.config/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit
compinit

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh

bindkey "^[[1;5C" 	forward-word
bindkey "^[[1;5D" 	backward-word
bindkey "^H" 		backward-kill-word
bindkey "5~" 		kill-word
bindkey "^[[3~" 	delete-char
bindkey "^[[H" 		beginning-of-line
bindkey "^[[F" 		end-of-line


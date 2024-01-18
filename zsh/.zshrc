# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"

export LIBVA_DRIVER_NAME=nvidia
export TERMINAL=alacrity
export EDITOR=vim
export editor=vim


autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ctrl + left/right
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# ctrl + backspace
bindkey '^H' backward-kill-word
# home, end, delete
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

source ~/powerlevel10k/powerlevel10k.zsh-theme

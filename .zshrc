# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# load aliasrc if it exists
[ -f "${ZDOTDIR}/aliasrc" ] && source "${ZDOTDIR}/aliasrc"

#load optionrc if it exists
[ -f "${ZDOTDIR}/optionrc" ] && source "${ZDOTDIR}/optionrc"

[ -f "${ZDOTDIR}/pluginrc" ] && source "${ZDOTDIR}/pluginrc"

# echo "hello from zsh" 
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# source ${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ${ZDOTDIR}/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# source ${ZDOTDIR}/plugins/f-sy-h/F-Sy-H.plugin.zsh

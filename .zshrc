# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# zmodload zsh/terminfo
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down
# bindkey '^[[A' history-substring-search-up
# bindkey '^[OA' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# bindkey '^[OB' history-substring-search-down
# bindkey -e
# bindkey '^[[1;9C' forward-word
# bindkey '^[[1;9D' backward-word

# load aliasrc if it exists
[ -f "${ZDOTDIR}/aliasrc" ] && source "${ZDOTDIR}/aliasrc"

# #load optionrc if it exists
# [ -f "${ZDOTDIR}/optionrc" ] && source "${ZDOTDIR}/optionrc"

[ -f "${ZDOTDIR}/pluginrc" ] && source "${ZDOTDIR}/pluginrc"

# echo "hello from zsh" 
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

# source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ${ZDOTDIR}/.p10k.zsh ]] || source ${ZDOTDIR}/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

source ${ZDOTDIR}/select-exe-cmd.zsh
source ${ZDOTDIR}/git-cmds/gcko.zsh
source ${ZDOTDIR}/git-cmds/gckonew.zsh
source ${ZDOTDIR}/git-cmds/gpull.zsh
source ${ZDOTDIR}/git-cmds/gpush.zsh
source ${ZDOTDIR}/git-cmds/gpushforce.zsh
source D:/QN.Expenditure/scripts/qnapiclientgenerate.zsh
source D:/QN.Expenditure/scripts/qndbinit.zsh
source D:/QN.Expenditure/scripts/qndbremove.zsh
source D:/QN.Expenditure/scripts/qndbupdate.zsh
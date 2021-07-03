#
# ~/.bashrc
#

# If not running interactively, don't do anything
export secret_key='&a4hw)&_q3f43b9l_4_$x1(x3rhh$apl@wfbpypggn1g!1!&1$'
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
neofetch

# Personal Aliases
alias files="nautilus"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

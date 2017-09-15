# Disable system bell
if [ -n "$DISPLAY" ]; then
  xset b off
fi

# Add colors to shell
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'

# Aliases
alias ll='ls -al'
alias rm='rm -i'
alias h='history'
alias r='source ~/.bashrc'

# Helpful aliases
alias mountvm='sudo mkdir -p /shares ; sudo mount -t vmhgfs .host:/ /shares'
alias shrink='rm -f ~/.xsession-errors* ; sudo apt-get autoremove ; sudo apt-get clean ; sudo vmware-toolbox-cmd disk shrink /'
alias upd='sudo apt-get update ; sudo apt-get upgrade'


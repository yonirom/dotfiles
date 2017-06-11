export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:$PATH
export LC_CTYPE="en_US.UTF-8"
alias ls='ls -G'
alias vi='vim'
#PS1="\e[1;36m\h\e[33m \w \$\e[0m "

# User specific aliases and functions
source ~/.git-prompt.sh


# Set Git shell prompt variables
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

export PS1='\u@\h:\w\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[00m\] \$ '
source ~/.bashrc.prompt

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

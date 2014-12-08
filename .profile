export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:$PATH
export LC_CTYPE="en_US.UTF-8"
alias ls='ls -G'
alias vi='mvim'

#PS1="\e[1;36m\h\e[33m \w \$\e[0m "

# Set Git shell prompt variables
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

source ~/.git-prompt.sh
source ~/.git-completion.sh
source ~/.bashrc.prompt

### Added by rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

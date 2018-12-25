export LC_CTYPE="en_US.UTF-8"
alias ls='ls -G'
alias vi='vim'

if [ -f ~/.ssh-find-agent.sh ]; then
    . ~/.ssh-find-agent.sh
fi

 ssh-find-agent -a || eval $(ssh-agent) > /dev/null

# User specific aliases and functions
if [ -f ~/.git-prompt.sh ]; then
    . ~/.git_prompt.sh
fi


# Set Git shell prompt variables
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
export PS1='\u@\h:\w\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[00m\] \$ '

# if we have a more elaborate prompt, use it
if [ -f ~/.bashrc.prompt ]; then
    . ~/.bashrc.prompt
fi

# did a simple task logger
function did() {
  if [ "$*" == "" ]; then
   (echo; echo $(date)) >> ~/did.txt
   vi +'normal Go- ' ~/did.txt
  else
   (echo; echo $(date); echo -n "- "; echo "$*") >> ~/did.txt
  fi
 }
 export -f did
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# save history after each command
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

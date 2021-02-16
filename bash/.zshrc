export LC_CTYPE="en_US.UTF-8"
alias ls='ls -G'
alias vi='vim'

if [ -f ~/.ssh-find-agent.sh ]; then
    . ~/.ssh-find-agent.sh
fi

ssh-find-agent -a || eval $(ssh-agent) > /dev/null

zstyle ':completion:*:*:git:*' script /usr/local/share/zsh/site-functions/git-completion.bash

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git
PROMPT='%(?.%F{green}√.%F{red}✖%?)%f %F{240}%T %n@%m $vcs_info_msg_0_ %F{yellow}%~%f%# '

export LC_CTYPE="en_US.UTF-8"
export FPATH=/opt/homebrew/share/zsh/site-functions/:$FPATH

SECRETS_FILE=${HOME}/.secrets.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

if [ -f ${SECRETS_FILE} ]; then
  source  ${SECRETS_FILE}
fi

setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/meep/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:*' formats ' (%F{red}%b%f)' # git(main)
setopt prompt_subst

PS1='%n@%m$vcs_info_msg_0_ %F{yellow}%~%f%# '

alias ls='ls -G'
alias vi='vim'

export PATH=/opt/homebrew/opt/python@3.9/libexec/bin/:/opt/homebrew/bin:$PATH

source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

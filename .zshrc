export ZSH=/Users/vi/.oh-my-zsh
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
export PATH="/usr/local/bin:/bin:/sbin:/usr/bin:/usr/local/sbin:$PATH"
if [ -d "/usr/local/lib" ]; then
  PATH="/usr/local/lib:$PATH"
fi
export PATH="/usr/local/Cellar/python/3.7.0/bin:$PATH"
export PATH="/Users/vi/anaconda3/bin:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export EDITOR='subl -w'

if [ -f ~/.dir_colors ]; then  
  eval `dircolors ~/.dir_colors`
fi  
if [ -t 1 ]; then
  cd ~
fi 
if [ "$TMUX" = "" ]; then tmux; fi

# Exercism completion
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi
bindkey -v

# Python Virtual Environments
export WORKON_HOME=$HOME/.virtualenvs             	# Environments stored here
#source /usr/local/bin/virtualenvwrapper.sh

# keep at bottom
source $ZSH/oh-my-zsh.sh
alias python='python3.6'
alias pip='pip3'
alias ga='git add .'
alias gc='git commit'
alias commit='git add . && git commit'
alias gp='git push'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias firefox-profile-config='/Applications/Firefox.app/Contents/MacOS/firefox-bin -P'
alias firefox-profile='cd Library/Application\ Support/Firefox/Profiles'
alias sshd='ssh -D 8080'
alias mvim='mvim -v'
alias mapit='python mapit.py'
alias update='sudo softwareupdate --install --all'

# bug with python3.7 support for system vim
alias vim='/usr/local/Cellar/macvim/8.1-151/MacVim.app/Contents/MacOS/Vim'

#================================================================================================
#	                                   Plugins
#================================================================================================
plugins=(
  git 
  vi-mode
  zsh-dircolors-solarized
  colorize
  bundler
)

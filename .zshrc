export ZSH=/Users/vi/.oh-my-zsh
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
#if [ -d "$HOME/Library/Python/3.6/bin" ]; then
 # PATH="$HOME/Library/Python/3.6/bin:$PATH"
#fi
if [ -d "/usr/local/lib" ]; then
  PATH="/usr/local/lib:$PATH"
fi
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/anaconda3/bin:$PATH
export PATH=/anaconda3/bin:$PATH
path+=('/usr/local/Cellar/python3/3.6.4_2/bin')
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
# added by Anaconda3 5.1.0 installer
export PATH="/anaconda3/bin:$PATH"
# added by Anaconda3 5.1.0 installer
export PATH="/Users/vi/anaconda3/bin:$PATH"
# add powerline command
export POWERLINE_CONFIG_COMMAND="/usr/local/lib/python3.6/site-packages/powerline/commands"
export PATH="/usr/local/lib:$PATH"
export PATH="Users/vi/Library/Python/3.6/bin:$PATH"
# source ~/.fonts/*.sh
# source ~/powerlevel9k/powerlevel9k.zsh-theme
# source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#================================================================================================
#	                                   Variables
#================================================================================================
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
# powerline-daemon -q
# powerline-config tmux setup
# . /usr/local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
# ====================================**POWERLEVEL9K CONFIG**====================================
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"

# tmux settings
ZSH_TMUX_AUTOSTART='true'

POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
# POWERLEVEL9K_ALWAYS_SHOW_USER=false

POWERLEVEL9K_CONTEXT_TEMPLATE=$'\uF109 %m'

DEFAULT_FOREGROUND=006 DEFAULT_BACKGROUND=235
DEFAULT_COLOR=$DEFAULT_FOREGROUND

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context_joined dir newline vcs )
# POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs status time ssh anaconda)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# POWERLEVEL9K_SHORTEN_DELIMITER=""
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="blue"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="$DEFAULT_BACKGROUND"

POWERLEVEL9K_DIR_HOME_BACKGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_DIR_HOME_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="$DEFAULT_BACKGROUND"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="$DEFAULT_FOREGROUND"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="$DEFAULT_BACKGROUND"
#================================================================================================

# Python Virtual Environments
export WORKON_HOME=$HOME/.virtualenvs             	# Environments stored here
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.6      # Make Python3 the default
#source /usr/local/bin/virtualenvwrapper.sh

# keep at bottom
source $ZSH/oh-my-zsh.sh
alias python='python3.6'
alias pip='pip3'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias profile-config='/Applications/Firefox.app/Contents/MacOS/firefox-bin -P'
alias profile='cd Library/Application\ Support/Firefox/Profiles'
alias sshd='ssh -D 8080'

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

path+=(~/.local/lib/python3.6/)		#to add path to wsl paths
PATH=$HOME/.local/bin:$PATH 		#for powerline to work
# =============================================================================
#                                   Variables
# =============================================================================
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


export ZSH=/home/vi/.oh-my-zsh
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
 
bindkey -v

powerline-daemon -q
. ~/.local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
# ===========================**POWERLEVEL9K CONFIG**===========================
POWERLEVEL9K_MODE='awesome-fontconfig'
ZSH_THEME="powerlevel9k/powerlevel9k"

# tmux settings
ZSH_TMUX_AUTOSTART='true'

POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_ALWAYS_SHOW_USER=false

POWERLEVEL9K_CONTEXT_TEMPLATE=$'\uF109 %m'

DEFAULT_FOREGROUND=006 DEFAULT_BACKGROUND=235
DEFAULT_COLOR=$DEFAULT_FOREGROUND

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context_joined dir newline vcs)
# POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs status time ssh)
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
# =============================================================================

# Python Virtual Environments
export WORKON_HOME=$HOME/.virtualenvs             	# Environments stored here
export PROJECT_HOME=/mnt/c/Users/mio84/Code             # Path to your Python projects
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.6      # Make Python3 the default
source /usr/local/bin/virtualenvwrapper.sh

# keep at bottom
source $ZSH/oh-my-zsh.sh
alias python='python3.6'
alias pip='pip3'
# =============================================================================
#                                   Plugins
# =============================================================================
plugins=(
  git 
  vi-mode
  zsh-dircolors-solarized
)

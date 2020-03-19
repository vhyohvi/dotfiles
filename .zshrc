export LC_ALL=en_US.UTF-8
export ZSH=/Users/vi/.oh-my-zsh
# export TERM=screen-256color
export GOPATH="$HOME"
path=(
    $path
		$GOPATH/bin
		/bin
		/sbin
		/usr/bin
		/usr/local/opt/ruby/bin
		/usr/local/bin
		/usr/local/sbin
		~/bin
    ~/.local/bin
		/usr/local/opt/python@2/libexec/bin
		/usr/local/opt/gettext/bin
		/usr/local/mysql/bin
		/Applications/Postgres.app/Contents/Versions/latest/bin
		/usr/local/php5/bin
		~/.cargo/bin
    ~/.gem/ruby/2.0.0/bin
		~/.rvm/gems/ruby-2.6.3/bin
)
if [ -d "/usr/local/lib" ]; then
	path+=/usr/local/lib
fi

if [ -f ~/.dir_colors ]; then  
  eval `dircolors ~/.dir_colors`
fi  
if [ -t 1 ]; then
  cd ~
fi 

# Python Virtual Environments
export WORKON_HOME=$HOME/.virtualenvs             	# Environments stored here
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
export VIRTUALENVWRAPPER_VIRTUALENV="/usr/local/bin/virtualenv"
source /usr/local/bin/virtualenvwrapper.sh
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

ZSH_THEME="mortalscumbag"

# keep at bottom
source $ZSH/oh-my-zsh.sh
alias python='python3'
alias xampp='/usr/bin/clear; ssh -i '/Users/vi/.bitnami/stackman/machines/xampp/ssh/id_rsa' -o StrictHostKeyChecking=no 'root@192.168.64.2''
alias pip='pip3'
alias ga='git add .'
alias gc='git commit'
alias commit='git add . && git commit'
alias gp='git push'
alias gignore='git update-index --assume-unchanged'
alias update='git submodule update --remote'
alias sshd='ssh -D 8080'
alias mvim='mvim -v'
alias update='sudo softwareupdate --install --all'
alias db-setup='docker-compose exec jupiter-web bundle exec rake db:setup'
alias db-migrate='docker-compose exec jupiter-web bundle exec rake db:migrate'
alias db-dump='docker-compose exec fanp-db mysqldump -uroot --databases fanp fanp_test > fanp-db/99-dump.sql'
alias up='docker-compose up'
alias stop='docker-compose rm --stop --force'
alias rm-untagged="docker images --no-trunc | grep '<none>' | awk '{ print $3 }' \
          | xargs docker rmi"
alias clean="docker ps --filter status=dead --filter status=exited -aq \
          | xargs docker rm -v"
alias zeals='cd ~/Dev/Zeals'
alias test='docker-compose exec saturn-messenger python -m pytest -vv'
alias lint='docker-compose exec saturn-messenger invoke lint'
alias messenger-invoke='docker-compose run --rm saturn-messenger invoke'
alias tree='tree -I "*pycache*" --dirsfirst'
alias stg='kubectl config use-context gke_fanp-stg_asia-northeast1_fanp'
alias prd='kubectl config use-context gke_fanp-prd_asia-northeast1_fanp'
alias sandbox='kubectl config use-context gke_zeals-sandbox_asia-northeast1_tokyo-region-cluster'
# alias sandbox='kubectl config use-context gke_zeals-sandbox_asia-northeast1_debug-fanp'
# alias invoke='docker-compose run --rm saturn-messenger invoke'
alias gget="ghq get"

# for managing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# bug with python3.7 support for system vim
# alias vim='/usr/local/Cellar/macvim/8.1-153/MacVim.app/Contents/MacOS/Vim'
alias dog='cd ~/KDS'
alias dog-back='cd ~/KDS/esports-platform-backend'
alias dog-front='cd ~/KDS/esports-platform-frontend'
alias kds='~/KDS/esports-platform-backend/node_modules/.bin/sequelize'
alias kds-migrate='cd ~/KDS/esports-platform-backend && node_modules/.bin/sequelize db:migrate'
alias check-port='lsof -i -P -n | grep LISTEN'

#================================================================================================
#	                                   Plugins
#================================================================================================
#plugins=(
#  git 
#  vi-mode
#  zsh-dircolors-solarized
#  colorize
#  bundler
#)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/vi/google-cloud-sdk/completion.zsh.inc'; fi
function kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
}

function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey 'gd' peco-src

function peco-git-checkout {
    git branch | peco | xargs git checkout
}
zle -N peco-git-checkout
bindkey '^o' peco-git-checkout

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source $(rvm 2.6.3 do rvm env --path)

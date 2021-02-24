export LC_ALL=en_US.UTF-8
export ZSH=/Users/vi/.oh-my-zsh
# export GOPATH="$HOME/bin"
path=(
	$path
#	$GOPATH/bin
	/usr/local/go/bin
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
	~/.pyenv/bin
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

export GO111MODULE=on

# Python Virtual Environments
# export WORKON_HOME=$HOME/.virtualenvs             	# Environments stored here
# export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
# export VIRTUALENVWRAPPER_VIRTUALENV="/usr/local/bin/virtualenv"
# source /usr/local/bin/virtualenvwrapper.sh
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
alias rm-untagged="docker images --no-trunc | grep '<none>' | awk '{ print $3 }' \
          | xargs docker rmi"
alias clean="docker ps --filter status=dead --filter status=exited -aq \
          | xargs docker rm -v"
alias tree='tree -I "*pycache*" --dirsfirst'
alias stg='kubectl config use-context gke_fanp-stg_asia-northeast1_fanp'
alias prd='kubectl config use-context gke_fanp-prd_asia-northeast1_fanp'
alias dev='kubectl config use-context gke_zeals-sandbox_asia-northeast1_tokyo-region-v1'
alias stg-db='cloud_sql_proxy -dir ~/cloudsql -instances=fanp-stg:asia-northeast1:fanp-stg'
alias dev-db='kubectl port-forward -n database mysql-db-0 33306:3306'
alias gget="ghq get"
alias test=' docker-compose run --rm -e DB_DATABASE=fanp_test saturn python -m pytest -vv'

# for managing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# bug with python3.7 support for system vim
# alias vim='/usr/local/Cellar/macvim/8.1-153/MacVim.app/Contents/MacOS/Vim'
alias check-port='lsof -i -P -n | grep LISTEN'
alias kill-rails='kill -9 $(cat tmp/pids/server.pid)'
alias pb='git fetch --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -D'
alias start-db='pg_ctl -D /usr/local/pgsql/data -l logfile start'

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

function peco-get-pod () {
    local selected_pod=$(kubectl get pods -n fanp -l app=saturn-worker -o name | peco --query "$LBUFFER")
    if [ -n "$selected_pod" ]; then
        BUFFER="kubectl exec -it ${selected_pod} -n fanp -c saturn-line -- sh"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-get-pod
bindkey '^p' peco-get-pod

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
    git branch --sort=-committerdate | peco | xargs git checkout
		zle accept-line
}
zle -N peco-git-checkout
bindkey '^o' peco-git-checkout

function peco-git-delete-branch {
    git branch --sort=-committerdate | peco | xargs git branch -d
		zle accept-line
}
zle -N peco-git-delete-branch
bindkey '^dd' peco-git-delete-branch

source $(rvm 2.6.3 do rvm env --path)
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export DEPLOY_KEY=$(cat ~/.ssh/id_rsa | base64)

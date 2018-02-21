# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# added by Anaconda3 5.1.0 installer
export PATH="/anaconda3/bin:$PATH"

# added by Anaconda3 5.1.0 installer
export PATH="/Users/vi/anaconda3/bin:$PATH"

# add powerline command
export POWERLINE_CONFIG_COMMAND="/Users/vi/Library/Python/3.6/bin"
export PATH="Users/vi/Library/Python/3.6/bin:$PATH"

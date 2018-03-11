# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
# USER_BIN=$HOME/bin

# Fixing npm permissions
## https://docs.npmjs.com/getting-started/fixing-npm-permissions

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# Fixing npm permissions
## https://docs.npmjs.com/getting-started/fixing-npm-permissions
## set PATH so it includes data third party apps bin if it exists
if [ -d "$HOME/nodejs/bin" ] ; then
    PATH="$HOME/nodejs/bin:$PATH"
fi

unset USERNAME

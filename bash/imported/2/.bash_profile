# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
# USER_BIN=$HOME/bin

# Fixing npm permissions
## https://docs.npmjs.com/getting-started/fixing-npm-permissions 

#PATH="$HOME/npm/bin:$PATH"

# unset USERNAME

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$HOME:.local/bin:$PATH"
fi

# set PATH so it includes data third party apps bin if it exists
if [ -d "$HOME/nodejs/bin" ] ; then
    PATH="$HOME/nodejs/bin:$PATH"
fi

# set PATH so it includes data third party apps bin if it exists
if [ -d "/data/apps/bin" ] ; then
    PATH="/data/apps/bin:$PATH"
fi


# set PATH to include Ruby Gems location
if [ -d "$HOME/.gem/ruby/2.3.0/bin" ] ; then
    PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
fi

export PATH

#source /home/icarus/00_etc/bash_completion/wp-completion.bash

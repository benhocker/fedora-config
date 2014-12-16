#!/bin/bash --login
# .bash_profile

# User specific environment and startup programs
eval $(keychain --eval --agents ssh -Q --quiet id_dsa)

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

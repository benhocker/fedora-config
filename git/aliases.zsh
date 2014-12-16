# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias ga='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gch='git checkout'
alias gcb='git checkout -b'
alias gco='git commit'
alias gd='git diff'
alias gdc='git diff --cached'
function gdel() { git push origin :$1; git branch -d $1; }
alias gprune='git remote update --prune'
alias gpush="git push -u origin"
alias gpull="git pull"
alias gs='git status'
alias gt='git tree'
alias gu='git up'

#alias gl='git pull --prune'
#alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
#alias gp='git push origin HEAD'
#alias gc='git commit'
#alias gca='git commit -a'
#alias gco='git checkout'
#alias gcb='git copy-branch-name'
#alias gb='git branch'
#alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.

# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
shell=`echo $SHELL | awk -F'/' '{print $NF}'`
completion="/usr/share/doc/git/contrib/completion/git-completion.${shell}"

if test -f $completion
then
  source $completion
fi

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# Functions
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}
parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn::"$1 "/" $2 ")"}'
}
parse_svn_url() {
  svn info 2>/dev/null | grep -e '^URL*' | sed -e 's#^URL: *\(.*\)#\1#g '
}
parse_svn_repository_root() {
  svn info 2>/dev/null | grep -e '^Repository Root:*' | sed -e 's#^Repository Root: *\(.*\)#\1\/#g '
}

function nato() {
  export NATOALPHA=("alfa" "bravo" "charlie" "delta" "echo" "foxtrot" "golf" "hotel" "india" "juliet" "kilo" "lima" "mike" "november" "oscar" "papa" "quebec" "romeo" "sierra" "tango" "uniform" "victor" "whiskey" "xray" "yankee" "zulu")
	for alpha in ${NATOALPHA[@]}; do
		echo $alpha
	done
}

# Environment vars
export LESS="-erX" 
export HISTCONTROL="erasedups"
export BRANCH=`git branch 2>/dev/null|cut -f2 -d\* -s`
export OS=`facter -p operatingsystem 2> /dev/null`

# Common System Aliases
alias grep="egrep -i"
alias Grep="grep"
alias ns="nslookup"
alias r="sudo su -"
alias scp='/usr/bin/scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no';
function kp() { ps -ef | grep puppet | grep -v grep | awk '{print $2}' | xargs kill -9; }
alias rp='puppet agent -t'
alias pl='puppet-lint *'
alias cdu='du -ms * | sort -n'

# Git aliases
#alias git='hub'
#eval "$(hub alias -s)"
function dot {
  NEXT=$(pwd)
	DATE=$(date)
	echo -e "\033[0;31mCommit to .dotfiles\e[0m"
	cd ~/.dotfiles
	git add *
	git commit -a -m "${DATE}"
	git push
	cd $NEXT
}
alias ga='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gch='git checkout'
alias gca='git commit -a'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gco='git commit'
alias gct='git checkout -t origin/'
alias gd='git diff'
alias gdc='git diff --cached'
function gdel() { git push origin :$1; git branch -d $1; }
alias gfsck='git fsck'
alias ggc='git gc'
alias gl='git pull origin master'
alias gm='git merge'
alias gp='git push origin master'
alias gprune='git remote update --prune'
alias gpush="git push -u origin"
alias gpull="git pull" 
alias gs='git status'
alias gshow='git remote show origin'
alias gsl='git stash list'
alias gso='git remote show origin'
alias gt='git tree'
alias gu='git up'

# Environment vars
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;31'
export CLICOLOR=1

# Bash
alias sb="source ~/.bashrc"
alias b="vim ~/.bashrc"
alias bp="vim ~/.bash_profile"
#alias vim="vim -v"
alias v="vim ~/.vimrc"

# Puppet
function pmt () {
	module=$1
	full_name="phathocker-$module"
	echo "puppet module generate $full_name"
	puppet module generate $full_name
	mv $full_name $module
}

# SSH
SSH_ARGS="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ConnectTimeout=1 -o ConnectionAttempts=1"
function s() {
	SSH_ARGS="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ConnectTimeout=1 -o ConnectionAttempts=1"
	rhost=$1
	rport=$2
	ruser=$3
	bashrc_remote=~/.bashrc
	random_file=/tmp/bashrc-`date +%d%m%g%H%M%S`.$RANDOM
	ssh="/usr/bin/ssh -qX $SSH_ARGS"
	scp="/usr/bin/scp $args"

	[ -z $ruser ] && ruser='root'
	[ -z $rport ] && rport='22'
	if [ -z $rhost ]; then
		echo "No host supplied!"
	else
		scp_command="$scp -P $rport $bashrc_remote $ruser@$rhost:$random_file"
		#echo $scp_command
		$scp_command | grep -v bashrc 2> /dev/null

		ssh_command="$ssh -t $ruser@$rhost -p $rport bash --rcfile $random_file"
		#echo $ssh_command
		$ssh_command 2> /dev/null

		remove_command="$ssh -t $ruser@$rhost -p $rport rm $random_file"
		#echo $remove_command
		$remove_command 2> /dev/null
	fi
}
alias sshpass="/usr/bin/ssh -l root -X ${SSH_ARGS} -o PubkeyAuthentication=no"
alias ssh="/usr/bin/ssh -l root -X ${SSH_ARGS}"
alias vag="ossh -p 2222 vagrant@localhost -i ~/.vagrant.d/insecure_private_key"

# System
alias ps="sudo ps"
alias yum="sudo yum"
alias yum-config-manager="sudo yum-config-manager"
alias tail="sudo tail"
alias netstat="sudo netstat -pantu"

# Ruby aliases
alias gemlist='gem list | egrep -v "^( |$)"'
alias irb='irb --simple-prompt'
alias installruby="proxyon; rvm install $1; proxyoff"
alias r19="rvm use 1.9.3"
alias rubypostreq="gem install rubygems-bundler"
alias r20="rvm use 2.0.0"

if git --version &>/dev/null; then
	#export PS1="\[\033[00;34m\]\$OS \w\n\[\033[01;32m\]\u@\h \[\033[0;31m\]\$(parse_git_branch)\$(parse_svn_branch) \[\033[00;34m\]$\[\033[00m\] "
	export PS1="\[\033[00;34m\]\$OS \w\n\[\033[01;32m\]\u@\h \[\033[0;31m\]\$(parse_git_branch)\$(parse_svn_branch) \[\033[00;34m\]`echo -e '\u2192'`\[\033[00m\] "
else
	#export PS1="\033[00;34m\]\$OS \w\n\[\033[01;32m\]\u@\h \[\033[0;31m\] \[\033[00;34m\]$\[\033[00m\] "
	export PS1="\033[00;34m\]\$OS \w\n\[\033[01;32m\]\u@\h \[\033[0;31m\] \[\033[00;34m\]`echo -e '\u2192'`\[\033[00m\] "
fi

# RHEL Aliases
alias ll="ls -lha"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#!/usr/bin/env bash
#
# Basic theme
#

SCM_THEME_PROMPT_DIRTY=" ${red}X"
SCM_THEME_PROMPT_CLEAN=" ${green}✓"
SCM_THEME_PROMPT_PREFIX=" ${yellow}|${reset_color}${purple}$(scm_char)${reset_color} "
SCM_THEME_PROMPT_SUFFIX="${yellow}| "

RVM_THEME_PROMPT_PREFIX=" #"
RVM_THEME_PROMPT_SUFFIX="# "

function prompt_command() {
  time="${cyan}\T"
  cwd="${bold_blue}\w"
  battery="$(battery_charge)"
  user="${green}\u"
  host="${red}\h"
  ruby="$(ruby_version_prompt)"
  scm="$(scm_prompt_info)"
  end="${white}→${reset_color} "

  PS1="\n${time} ${cwd} ${battery}\n${reset_color}[${user}@${host}${reset_color}]${ruby}${scm}${end}"
}
PROMPT_COMMAND=prompt_command;

function prompt() {
    local return_status=""
    local ruby="${red}$(ruby_version_prompt)${reset_color}"
    local user_host="${green}\h${reset_color}"
    local current_path="\w"
    local n_commands="\!"
    local git_branch="$(git_short_sha)$(scm_prompt_info)"
    local prompt_symbol='λ'
    local open='('
    local close=')'
    local prompt_char=' \$ '

    PS1="\n${n_commands} ${user_host} ${prompt_symbol} ${ruby} ${open}${current_path}${git_branch}${close}${return_status}\n${prompt_char}"
}

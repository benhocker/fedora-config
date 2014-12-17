#!/usr/bin/env bash
#
# Basic theme
#

SCM_THEME_PROMPT_DIRTY=" ${red}X"
SCM_THEME_PROMPT_CLEAN=" ${green}✓"
SCM_THEME_PROMPT_PREFIX=" ${yellow}|${reset_color}"
SCM_THEME_PROMPT_SUFFIX="${yellow}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"
VIRTUALENV_THEME_PROMPT_PREFIX='|'
VIRTUALENV_THEME_PROMPT_SUFFIX='|'

function prompt_command() {
	PS1="${blue}\w\n${green}\u@\h ${purple}$(scm_char)${yellow}$(scm_prompt_info) ${red}→ "
}

PROMPT_COMMAND=prompt_command;

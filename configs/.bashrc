# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[01;36m\]@\[\033[0;35m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

################################################################################
#######################  FANCY BASH PROMPT SCRIPT ##############################
################################################################################

################################################################################
##  FUNCTIONS                                                                 ##
################################################################################

##
##	ARRANGE $PWD AND STORE IT IN $NEW_PWD
##	* The home directory (HOME) is replaced with a ~
##	* The last pwdmaxlen characters of the PWD are displayed
##	* Leading partial directory names are striped off
##		/home/me/stuff -> ~/stuff (if USER=me)
##		/usr/share/big_dir_name -> ../share/big_dir_name (if pwdmaxlen=20)
##
##	Original source: WOLFMAN'S color bash promt
##	https://wiki.chakralinux.org/index.php?title=Color_Bash_Prompt#Wolfman.27s
##
bash_prompt_command() {
	# How many characters of the $PWD should be kept
	local pwdmaxlen=25

	# Indicate that there has been dir truncation
	local trunc_symbol=".."

	# Store local dir
	local dir=${PWD##*/}

	# Which length to use
	pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))

	NEW_PWD=${PWD/#$HOME/\~}

	local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))

	# Generate name
	if [ ${pwdoffset} -gt "0" ]
	then
		NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
		NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
	fi

	# Update git segment of the commmand line
	generate_prompt_sections
	define_separator_formatting
	generate_separators

	PS1="$TITLEBAR\n${PROMT_USER}${SEPARATOR_1}${PROMT_HOST}${SEPARATOR_2}${PROMT_PWD}${SEPARATOR_3}${PROMT_GIT}${SEPARATOR_4}${PROMT_INPUT}"
}


##
##	GENERATE A FORMAT SEQUENCE
##
format_font()
{
	## FIRST ARGUMENT TO RETURN FORMAT STRING
	local output=$1


	case $# in
	2)
		eval $output="'\[\033[0;${2}m\]'"
		;;
	3)
		eval $output="'\[\033[0;${2};${3}m\]'"
		;;
	4)
		eval $output="'\[\033[0;${2};${3};${4}m\]'"
		;;
	*)
		eval $output="'\[\033[0m\]'"
		;;
	esac
}


##
## Get Git branch of current PWD
##
parse_git_branch() {
	git branch 2> /dev/null | grep '^*' | cut -c2-
}

##
## Checks if the current directory is a git repository
## returns: true or false
##
is_pwd_git_dir() {
	local branch="$(parse_git_branch)"
	local str_size=${#branch}

	if [ $str_size -eq 0 ]
	then
		echo false
		return
	else
		echo true
		return
	fi
}


############################################################################
## COLOR CODES                                                            ##
## These can be used in the configuration below                           ##
############################################################################
define_color_codes() {
	## FONT EFFECT
	NONE='0'
	BOLD='1'
	DIM='2'
	UNDERLINE='4'
	BLINK='5'
	INVERT='7'
	HIDDEN='8'

	## COLORS
	DEFAULT='9'
     	BLACK='0'
     	RED='1'
     	GREEN='2'
     	YELLOW='3'
     	BLUE='4'
     	MAGENTA='5'
     	CYAN='6'
     	L_GRAY='7'
     	D_GRAY='60'
     	L_RED='61'
     	L_GREEN='62'
     	L_YELLOW='63'
     	L_BLUE='64'
     	L_MAGENTA='65'
     	L_CYAN='66'
     	WHITE='67'

	## TYPE
	RESET='0'
	EFFECT='0'
	COLOR='30'
     	BG='40'

	## 256 COLOR CODES
	NO_FORMAT="\[\033[0m\]"
	ORANGE_BOLD="\[\033[1;38;5;208m\]"
	TOXIC_GREEN_BOLD="\[\033[1;38;5;118m\]"
	RED_BOLD="\[\033[1;38;5;1m\]"
	CYAN_BOLD="\[\033[1;38;5;87m\]"
	BLACK_BOLD="\[\033[1;38;5;0m\]"
	WHITE_BOLD="\[\033[1;38;5;15m\]"
	GRAY_BOLD="\[\033[1;90m\]"
	BLUE_BOLD="\[\033[1;38;5;74m\]"

	## Symbols/Glyphs
	TRIANGLE=$'\uE0B0'
	GIT_SYMBOL=$'\uE0A0'
	LOCK=$'\uE0A2'
	SLIM_TRIANGLE=$'\uE0B1'
}


############################################################################
## CONFIGURATION                                                          ##
## Choose your color combination here                                     ##
############################################################################	
define_color_combos() {
	FONT_COLOR_1=$WHITE
	BACKGROUND_1=$BLUE
	TEXTEFFECT_1=$BOLD

	FONT_COLOR_2=$WHITE
	BACKGROUND_2=$L_BLUE
	TEXTEFFECT_2=$BOLD

	FONT_COLOR_3=$D_GRAY
        BACKGROUND_3=$WHITE
        TEXTEFFECT_3=$BOLD
             
        FONT_COLOR_4=$L_CYAN
	BACKGROUND_4=$MAGENTA
	TEXTEFFECT_4=$BOLD

	PROMT_FORMAT=$BLUE_BOLD
}


############################################################################
## TEXT FORMATING                                                         ##
## Generate the text formating according to configuration                 ##
############################################################################
define_text_formatting() {
	## CONVERT CODES: add offset
	FC1=$(($FONT_COLOR_1+$COLOR))
	BG1=$(($BACKGROUND_1+$BG))
	FE1=$(($TEXTEFFECT_1+$EFFECT))

	FC2=$(($FONT_COLOR_2+$COLOR))
	BG2=$(($BACKGROUND_2+$BG))
	FE2=$(($TEXTEFFECT_2+$EFFECT))

	FC3=$(($FONT_COLOR_3+$COLOR))
	BG3=$(($BACKGROUND_3+$BG))
	FE3=$(($TEXTEFFECT_3+$EFFECT))

	FC4=$(($FONT_COLOR_4+$COLOR))
	BG4=$(($BACKGROUND_4+$BG))
	FE4=$(($TEXTEFFECT_4+$EFFECT))


	## CALL FORMATING HELPER FUNCTION: effect + font color + BG color
	format_font TEXT_FORMAT_1 $FE1 $FC1 $BG1
	format_font TEXT_FORMAT_2 $FE2 $FC2 $BG2
	format_font TEXT_FORMAT_3 $FC3 $FE3 $BG3
	format_font TEXT_FORMAT_4 $FC4 $FE4 $BG4
}


generate_prompt_sections() {
	# GENERATE PROMT SECTIONS
	PROMT_USER=$"$TEXT_FORMAT_1 \u "
	PROMT_HOST=$"$TEXT_FORMAT_2 \h "
	PROMT_PWD=$"$TEXT_FORMAT_3 \${NEW_PWD} "

	if [[ $(is_pwd_git_dir) == "true" ]]; then
		PROMT_GIT=$"$TEXT_FORMAT_4$GIT_SYMBOL\$(parse_git_branch) "
	else
		PROMT_GIT=$""
	fi

	PROMT_INPUT=$"$PROMT_FORMAT "
}


############################################################################
## SEPARATOR FORMATING                                                    ##
## Generate the separators between sections                               ##
## Uses background colors of the sections                                 ##
############################################################################
define_separator_formatting() {
	## CONVERT CODES
	TSFC1=$(($BACKGROUND_1+$COLOR))
	TSBG1=$(($BACKGROUND_2+$BG))

	TSFC2=$(($BACKGROUND_2+$COLOR))
	TSBG2=$(($BACKGROUND_3+$BG))

	TSFC3=$(($BACKGROUND_3+$COLOR))
	TSBG3_1=$(($DEFAULT+$BG))
	TSBG3_2=$(($BACKGROUND_4+$BG))
	
	TSFC4=$(($BACKGROUND_4+$COLOR))
	TSBG4=$(($DEFAULT+$BG))


	## CALL FORMATING HELPER FUNCTION: effect + font color + BG color
	format_font SEPARATOR_FORMAT_1 $TSFC1 $TSBG1
	format_font SEPARATOR_FORMAT_2 $TSFC2 $TSBG2
	
	if [[ $(is_pwd_git_dir) == "true" ]]; then
		format_font SEPARATOR_FORMAT_3 $TSFC3 $TSBG3_2
	else
		format_font SEPARATOR_FORMAT_3 $TSFC3 $TSBG3_1
	fi

	format_font SEPARATOR_FORMAT_4 $TSFC4 $TSBG4
}


generate_separators() {
	# GENERATE SEPARATORS WITH FANCY TRIANGLE	
	SEPARATOR_1=$SEPARATOR_FORMAT_1$TRIANGLE
	SEPARATOR_2=$SEPARATOR_FORMAT_2$TRIANGLE

	if [[ $(is_pwd_git_dir) == "true" ]];then
		SEPARATOR_3=$SEPARATOR_FORMAT_3$TRIANGLE
		SEPARATOR_4=$SEPARATOR_FORMAT_4$TRIANGLE
	else
		SEPARATOR_3=$SEPARATOR_FORMAT_3$TRIANGLE
		SEPARATOR_4=$SEPARATOR_FORMAT_4
	fi
}


##
## COLORIZE BASH PROMT
##
bash_prompt() {

	define_color_codes
	define_color_combos
	define_text_formatting
	generate_prompt_sections
	define_separator_formatting
	generate_separators


	############################################################################
	## WINDOW TITLE                                                           ##
	## Prevent messed up terminal-window titles                               ##
	############################################################################
	case $TERM in
	xterm*|rxvt*)
		local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
		;;
	*)
		local TITLEBAR=""
		;;
	esac




	############################################################################
	## BASH PROMT                                                             ##
	## Generate promt and remove format from the rest                         ##
	############################################################################
#	PS1="$TITLEBAR\n${PROMT_USER}${SEPARATOR_1}${PROMT_HOST}${SEPARATOR_2}${PROMT_PWD}${SEPARATOR_3}${PROMT_INPUT}"
	PS1="$TITLEBAR\n${PROMT_USER}${SEPARATOR_1}${PROMT_HOST}${SEPARATOR_2}${PROMT_PWD}${SEPARATOR_3}${PROMT_GIT}${SEPARATOR_4}${PROMT_INPUT}"

	## For terminal line coloring, leaving the rest standard
	none="$(tput sgr0)"
	trap 'echo -ne "${none}"' DEBUG
}




################################################################################
##  MAIN                                                                      ##
################################################################################

##	Bash provides an environment variable called PROMPT_COMMAND.
##	The contents of this variable are executed as a regular Bash command
##	just before Bash displays a prompt.
##	We want it to call our own command to truncate PWD and store it in NEW_PWD
PROMPT_COMMAND=bash_prompt_command

##	Call bash_promnt only once, then unset it (not needed any more)
##	It will set $PS1 with colors and relative to $NEW_PWD,
##	which gets updated by $PROMT_COMMAND on behalf of the terminal
bash_prompt
unset bash_prompt


## Default commands to run after bash initialization
## For example, you can run neofetch on each terminal startup
neofetch

### EOF ###

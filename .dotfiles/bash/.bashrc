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
HISTSIZE=100000
HISTFILESIZE=200000

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
#force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

# export PROMPT_COMMAND='history -a'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

if [ "$HOSTNAME" == "flanders" ]; then
    __conda_setup="$('/home/periyasa/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
     if [ $? -eq 0 ]; then
         eval "$__conda_setup"
     else
        if [ -f "/home/periyasa/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/periyasa/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/periyasa/anaconda3/bin:$PATH"
        fi
     fi
else
    __conda_setup="$('/home/user/periyasa/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
         eval "$__conda_setup"
    else
        if [ -f "/home/user/periyasa/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/user/periyasa/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/user/periyasa/anaconda3/bin:$PATH"
        fi
    fi
fi

 unset __conda_setup
# <<< conda initialize <<<

# . /home/periyasa/mbzirc/devel/setup.bash

#ros helper functions:

function rossrc {
	roscd
	cd ../src
}

function init_conda {
  if [ "$#" -ne 1 ]; then
    source ~/anaconda3/bin/activate 
  else
    source ~/anaconda3/bin/activate $1
  fi
}
# bind 'TAB:menu-complete'
# shopt -s autocd
# complete -d cd

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias ...........="cd ../../../../../../../../../.."
alias ............="cd ../../../../../../../../../../.."
alias .............="cd ../../../../../../../../../../../.."


alias sl=ls
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'
alias lr='ls -lrt'

# git name for use on mario
export MARIO_GIT_NAME='Arul'
export MARIO_GIT_EMAIL='finditarul@gmail.com'

build_tex() {
pdflatex -interaction=nonstopmode  $1
bibtex $1
pdflatex -interaction=nonstopmode  $1
pdflatex -interaction=nonstopmode  $1
}
build_xetex() {
xelatex -interaction=nonstopmode -halt-on-error  $1
biber $1
xelatex -interaction=nonstopmode -halt-on-error  $1
xelatex -interaction=nonstopmode -halt-on-error  $1
}



# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
# PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

if [ "$HOSTNAME" == "flanders"  ]; then
    source activate py3.6
elif [ "$HOSTNAME" == "cuda12" ]; then
    source activate tracking
elif [ "$HOSTNAME" == "beast" ]; then
    source activate py3.8
fi

alias ccat='pygmentize -g'
alias rc="ssh periyasa@cuda12"
alias lor="cd /home/periyasa/workspace/learning_object_reconstruction"
alias sl="cd /home/periyasa/workspace/stillleben"

[ -s "/home/periyasa/.scm_breeze/scm_breeze.sh" ] && source "/home/periyasa/.scm_breeze/scm_breeze.sh"


alias bc4="ssh periyasa@bigcuda4"
alias bc5="ssh periyasa@bigcuda5.informatik.uni-bonn.de"
alias bbeast="ssh periyasa@bigbeast"

# add nvidia-top to path
PATH="$PATH:/home/periyasa/softwares/nvidia-htop/"
alias gpu-top="nvidia-smi | nvidia-htop.py -cl"
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"


shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
alias beast="ssh periyasa@beast.informatik.uni-bonn.de"




save_history_daily () {
  # if the current time is more than a day's-worth of seconds newer than
  # the modification time of $HISTFILE, then run 'history -a'

  if (( $(printf '%(%s)T' -1) - 86400 > $(stat -c %Y "$HISTFILE") ))
  then 
    history -a
  fi
}

PROMPT_COMMAND="$PROMPT_COMMAND save_history_daily"


# remap switch esc and capslock keys
# https://askubuntu.com/questions/363346/how-to-permanently-switch-caps-lock-and-esc
/usr/bin/setxkbmap -option "caps:swapescape"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# append to the history file, don't overwrite it
shopt -s histappend
shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.

export BASH_SILENCE_DEPRECATION_WARNING=1 # for macos
HISTSIZE=1000 # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=2000
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history. See bash(1) for more options

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lua=lua5.3
alias python=python3
alias subl="/mnt/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe" # sublime text wsl <-> windows
alias git-ll="git ls-tree -r --name-only"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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


# rust
[ -d "$HOME/.cargo" ] && source "$HOME/.cargo/env"

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ocaml configuration
[ -d $HOME/.opam ] && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# go configuration
export GOROOT="/usr/local/go"
export PATH="$PATH:/usr/local/go/bin"

# homebrew configuration
[ -f /opt/homebrew/bin/brew ] && eval $(/opt/homebrew/bin/brew shellenv)
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# haskell configuration
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"


# color prompt
source ~/.bash_prompt


# vulkan sdk on mac
export VULKAN_SDK="$HOME/VulkanSDK/1.3.211.0/MoltenVK"

# git configuration
export GIT_SSH_COMMAND='ssh -i $HOME/.ssh/$GIT_KEY'
export GIT_KEY=id_rsa

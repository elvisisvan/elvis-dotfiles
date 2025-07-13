# termux .bashrc

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc

# Aliases
[[ -f ~/.aliases ]] && . ~/.aliases

PS1="\[\e[0;31m\]\n\
\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\e[0;33m\]\342\234\227\[\e[0;31m\]]\342\224\200\")\
[\[\e[01;34m\]\u\[\e[30m\]@\[\e[01;96m\]\h\[\e[0;31m\]]\
\342\224\200\$(date '+%y-%m-%d \[\e[30m\]• \[\e[0;31m\]%H:%M:%S')\
\342\224\200[\[\e[0;32m\]\w\[\e[0;31m\]]\
\[\e[0;35m\]\$(git rev-parse --abbrev-ref HEAD 2>/dev/null)\
\n\
\[\e[0;31m\]\342\224\224\342\224\200\342\225\274 \[\e[01;33m\]\$([[ \$UID == 0 ]] && echo '#' || echo '$')\[\e[0m\] "


# https://www.reddit.com/r/termux/s/tBDBOhSzm1
#PS1="\[\e]0;\u@\h: \w\a\]\[\033[;32m\]┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)\[\033[;32m\])}(\[\033[1;34m\]\u㉿\h\[\033[;32m\])-[\[\033[0;1m\]\w\[\033[;32m\]]\n\[\033[;32m\]└─\[\033[1;34m\]\$\[\033[0m\] "

# append to history, case-insensitive globbing
shopt -s histappend nocaseglob nocasematch

# Set the size of history and save the maximum number of history entries
HISTSIZE=999999999          # Number of commands to remember in the current session
SAVEHIST=$HISTSIZE          # Maximum number of commands to store in the history file

# Don't include duplicate lines in history
# You can also force ignore duplicates and commands with a leading space
HISTCONTROL=ignoredups:ignorespace

# Share history across all active sessions.
export PROMPT_COMMAND='history -a; history -n'

# ignore commands from bash history
export HISTIGNORE="*alias*:\
l:\
lg:\
ll:\
ls -l:\
cd:\
cr:\
ff:\
lazygit:\
bqt:\
exit:\
e:\
zsh:\
bash:\
rfrs:\
st:\
"
# Dynamically create HISTIGNORE from aliases file
if [ -f ~/.aliases ]; then
    HISTIGNORE="$(grep -oP "(?<=['\"]).*?(?=['\"])" ~/.aliases | tr '\n' ':')$HISTIGNORE"
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# nvm (node version manager)
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(fzf --bash)"

[[ -f ~/LinuxDroidmenu.sh ]] && . ~/LinuxDroidmenu.sh



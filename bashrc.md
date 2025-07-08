# .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source Arco configs
[[ -f ~/.bashrc.arco ]] && . ~/.bashrc.arco

# Source SolydXK info file
[[ -f /usr/share/solydxk/info ]] && . /usr/share/solydxk/info

# Source global definitions (RHEL-based)
[[ -f /etc/bashrc ]] && . /etc/bashrc

# Aliases
[[ -f ~/.aliases ]] && . ~/.aliases

# command-not-found helper (find-the-command-git)
[[ -f "/usr/share/doc/find-the-command/ftc.bash" ]] && . "/usr/share/doc/find-the-command/ftc.bash"

export PATH=$(echo $PATH | tr ':' '\n' | awk '!seen[$0]++' | tr '\n' ':' | sed 's/:$//')

# Consolidated PATH setup
# [[ ! "$PATH" =~ (^|:)"/usr/bin"(:|$) ]] && PATH="/usr/bin:$PATH"
# [[ ! "$PATH" =~ (^|:)"$HOME/.local/bin:$HOME/bin"(:|$) ]] && PATH="$HOME/.local/bin:$HOME/bin:$PATH"
# export PATH

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# ignore commands from history
export HISTIGNORE="*alias*:\
e:\
reboot:\
rfrs:\
ff:\
st:\
sl:\
l:\
lg:\
ll:\
ls -l:\
logout:\
cd:\
cr:\
lazygit:\
bqt:\
exit:\
zsh:\
bash:\
nano ~/.bashrc:\
nano ~/.zshrc:\
kate ~/.bashrc:\
kate ~/.zshrc:\
"

# Dynamically create HISTIGNORE from aliases file
if [ -f ~/.aliases ]; then
  HISTIGNORE="$(grep -oP "(?<=['\"]).*?(?=['\"])" ~/.aliases | tr '\n' ':')$HISTIGNORE"
fi

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Enable colored prompt if terminal supports it
force_color_prompt=yes

# Consolidated color support check
if [ -n "$force_color_prompt" ] && [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
else
    color_prompt=
fi

# Define the fancy prompt only once
FANCY_PS1="\[\e[0;31m\]\n\
\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\e[0;33m\]\342\234\227\[\e[0;31m\]]\342\224\200\")\
[\[\e[01;34m\]\u\[\e[30m\]@\[\e[01;96m\]\h\[\e[0;31m\]]\
\342\224\200\$(date '+%y-%m-%d \[\e[30m\]• \[\e[0;31m\]%H:%M:%S')\
\342\224\200[\[\e[0;32m\]\w\[\e[0;31m\]]\
\[\e[0;35m\]\$(git rev-parse --abbrev-ref HEAD 2>/dev/null)\
\n\
\[\e[0;31m\]\342\224\224\342\224\200\342\225\274 \[\e[01;33m\]\$([[ \$UID == 0 ]] && echo '#' || echo '$')\[\e[0m\] "
# Breakdown of the Configuration:
# Backslash (\): Each line ends with a backslash to indicate that the command continues on the next line. This allows you to format the prompt configuration neatly.
# Structure:
# The first line sets the color and starts the prompt.
# The second line includes user and host information.
# The third line displays the date and time with a separator.
# The fourth line shows the current working directory.
# The final line is where the command input will occur.
# `\[\e[0;31m\]` set following contents to red
# `\[\e[01;34m\]` set following contents to bold cyan
# `\[\e[01;33m\]` set following contents to bold yellow
# `\[\e[0m\]` resets color for following contents
# `\342\224\200` is ─ (U+2500)
# `\342\224\214` is ┌ (U+250C)
# `\342\224\224` is └ (U+2514)
# `\342\225\274` is ╼ (U+257C)
# `\342\234\227` is ✗ (U+2717)

# Set prompt based on color support
if [ "$color_prompt" = yes ]; then
    PS1="$FANCY_PS1"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Handle terminal-specific settings
case "$TERM" in
    xterm*|rxvt*)
        PS1="$FANCY_PS1"
        ;;
esac

unset color_prompt force_color_prompt FANCY_PS1

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

###########################################################

# autostart byobu
# if [ -n "$BASH" ] && [ -n "$PS1" ] && [ -z "$STARTED_BY_BYOBU" ] && [ -z "$TMUX" ]; then
#    byobu
# fi

# nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pipx (python applications executable)
#    eval "$(register-python-argcomplete pipx)"

alias keploy='sudo -E env PATH="$PATH" keploybin'

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/bash/__tabtab.bash ]] && . ~/.config/tabtab/bash/__tabtab.bash || true

[[ -f "$HOME/.local/share/bash-completion/completions/deno.bash" ]] && source "$HOME/.local/share/bash-completion/completions/deno.bash"


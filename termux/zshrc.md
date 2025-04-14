# termux .zshrc

# ======================================================================
# Source Files
# ======================================================================

[[ -f $PREFIX/etc/zshrc ]] && . $PREFIX/etc/zshrc

# ======================================================================
# Path Configuration
# ======================================================================
# PATH setup
typeset -U PATH  # Prevents duplicate entries
path=(/usr/bin $HOME/.local/bin $HOME/bin $path)
export PATH

# ======================================================================
# ZSH Configurations
# ======================================================================
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=fino-time
plugins=(git gh fzf tldr zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting)

[[ -d '${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete' ]] && . '${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh'

[[ -d '${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions' ]] && . '${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'

if [[ -d '${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting' ]]; then
  source '${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'
fi

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
[[ -f ~/.aliases ]] && . ~/.aliases


# ======================================================================
# Completion System
# ======================================================================
#autoload -Uz compinit
#compinit
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' completer _complete _ignored _files _fzf
zstyle ':completion:*:*:*:*' fzf:use-history yes
zstyle ':completion:*' fzf:history yes
zstyle ':completion:*' fzf:preview 'bat {}'
zstyle ':autocomplete:*' default-context history-incremental-search-backward
zstyle ':autocomplete:*' min-input 1

# ======================================================================
# Key Bindings
# ======================================================================
# bindkey -e                          # Use emacs key bindings
bindkey '^[[A' up-line-or-search    # Up arrow for history search
bindkey '^[[B' down-line-or-search  # Down arrow for history search
bindkey '^[[H' beginning-of-line    # Home key
bindkey '^[[F' end-of-line          # End key
bindkey '^[[3~' delete-char         # Delete key
bindkey '^[[1;5C' forward-word      # Ctrl + right arrow
bindkey '^[[1;5D' backward-word     # Ctrl + left arrow

# ======================================================================
# Shell Options (setopt)
# ======================================================================

# Directory Navigation
setopt AUTO_CD              # Change directory without 'cd'
setopt AUTO_PUSHD           # Push dirs into history
setopt PUSHD_IGNORE_DUPS    # Don't store duplicates in dir stack
setopt PUSHD_SILENT         # Don't print dir stack after pushd/popd

# History
setopt APPEND_HISTORY       # add history entries incrementally across shells
setopt EXTENDED_HISTORY     # Save timestamp and duration
setopt SHARE_HISTORY        # Share history between sessions
setopt HIST_FIND_NO_DUPS    # hide duplicates in command search
setopt HIST_IGNORE_DUPS     # Don't record duplicated entries
setopt HIST_IGNORE_SPACE    # Don't record entries starting with space

# Globbing and Files
setopt EXTENDED_GLOB        # Extended globbing capabilities
setopt NO_CASE_GLOB         # Case insensitive globbing
setopt NO_CASE_MATCH        # Case insensitive matching

# Command Correction
setopt CORRECT              # Try to correct command spelling
setopt CORRECT_ALL          # Try to correct arguments as well

# Job Control
setopt NOTIFY               # Report status of background jobs immediately
setopt LONG_LIST_JOBS       # List jobs in long format
setopt AUTO_RESUME          # Resume existing jobs instead of creating new ones

# Prompting
setopt PROMPT_SUBST         # Enable parameter expansion in prompts

# ======================================================================
# History Configuration
# ======================================================================
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# ignore commands from history
export HISTORY_IGNORE="(e|\
rfrs|\
reboot|\
st|\
l|\
ll|\
ls -l|\
gs|\
lg|\
lazygit|\
cd|\
cr|\
bqt|\
exit|\
zsh|\
bash|\
git reset HEAD --hard|\
)"

# ======================================================================
# Color Support
# ======================================================================
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ======================================================================
# Prompt Configuration
# ======================================================================
autoload -U colors && colors
#PROMPT=$'%F{red}\n┌─$([[ $? != 0 ]] && echo "[%F{yellow}✗%F{red}]─")%(#.%F{red}root%F{black}@%F{cyan}%m.%F{blue}%n%F{black}@%F{cyan}%m)%F{red}─%T─[%F{green}%~%F{red}]\n└──╼ %f%F{yellow}%#%f '

# ======================================================================
# Prompt
# ======================================================================
# Starship
#eval "$(starship init zsh)"


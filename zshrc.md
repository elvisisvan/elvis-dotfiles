# .zshrc

# ======================================================================
# Path Configuration
# ======================================================================
# PATH setup
typeset -U PATH  # Prevents duplicate entries
path=(/usr/bin $HOME/.local/bin $HOME/bin $path)
export PATH

# ======================================================================
# Source Files
# ======================================================================
# Load global settings
[[ -f /etc/zshrc ]] && . /etc/zshrc

# Source Arco configs
[[ -f ~/.zshrc.arco ]] && . ~/.zshrc.arco

# command-not-found helper (find-the-command-git)
[[ -f usr/share/doc/find-the-command/ftc.zsh ]] && . /usr/share/doc/find-the-command/ftc.zsh

# ======================================================================
# ZSH Configurations
# ======================================================================
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME='random'
ZSH_THEME='fino-time'
# themes: fino-time,jonathan,ys,junkfood,3den,adben,xiong-chiamiov-plus,re5et

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(git fzf zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting)

[[ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete" ]] && source "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

[[ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]] && source "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

if [[ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]]; then
  source "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
fi

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
#source /home/linuxbrew/.linuxbrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Aliases
[[ -f ~/.aliases ]] && . ~/.aliases

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
setopt HIST_IGNORE_DUPS     # Don't record duplicated entries
setopt HIST_FIND_NO_DUPS    # hide duplicates in command search
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
sl|\
l|\
ll|\
ls -l|\
logout|\
lazygit|\
cd|\
cr|\
bqt|\
exit|\
zsh|\
bash|\
nano ~/.bashrc|\
nano ~/.zshrc|\
kate ~/.bashrc|\
kate ~/.zshrc|\
git reset HEAD --hard|\
)"

# ignore commands from .aliases
if [ -f ~/.aliases ]; then
  HISTORY_IGNORE="($(grep -oP "(?<=['\"]).*?(?=['\"])" ~/.aliases | tr '\n' '|'))$HISTORY_IGNORE"
fi

# ======================================================================
# Completion System
# ======================================================================
autoload -Uz compinit; compinit
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
# Development Tools
# ======================================================================

# pipx completion
command -v register-python-argcomplete &>/dev/null && eval "$(register-python-argcomplete pipx)" 2>/dev/null

# ======================================================================
# Prompt
# ======================================================================

# nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Starship
#eval "$(starship init zsh)"

# Zoxide
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# Warpify subshell
#printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add deno completions to search path
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then export FPATH="$HOME/.zsh/completions:$FPATH"; fi


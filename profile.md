# .profile

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# prevent path duplicate (chatgpt)
# export PATH="$(awk -v RS=: '!a[$1]++ { if (NR == 1) printf "%s", $1; else printf ":%s", $1 }' <<< "$PATH")"

# prevent path duplicates (claude.ai)
export PATH=$(echo $PATH | tr ':' '\n' | awk '!seen[$0]++' | tr '\n' ':' | sed 's/:$//')

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"

# bun
export PATH="$HOME/.bun/bin:$PATH"

# deno
[[ -f "$HOME/.deno/env" ]] && source "$HOME/.deno/env"

# phpenv (php version manager)
export PHPENV_ROOT="$HOME/.phpenv"
if [ -d "${PHPENV_ROOT}" ]; then
    export PATH="${PHPENV_ROOT}/bin:${PATH}"
    eval "$(phpenv init -)"
fi

# Homebrew (`brew`)
[[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# rust version manager (`cargo` `rustc` `rustup`)
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Foundry (`forge` `anvil` `cast` `chisel`)
export PATH="$HOME/.foundry/bin:$PATH"

# android-tools
export PATH="$HOME/linux-downloads/platform-tools:$PATH"

# Radicle
export PATH="$HOME/.radicle/bin:$PATH"


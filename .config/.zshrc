eval "$(starship init zsh)"

alias ls='lsd -A'
alias ll='lsd -lA'
alias lt='lsd --tree --depth 3 --ignore-glob node_modules'

. "$HOME/.local/bin/env"
eval "$(mise activate zsh)"
fpath+=~/.zfunc

export PATH="/Users/vova/.local/state/fnm_multishells/31402_1736943891422/bin":$PATH
export FNM_MULTISHELL_PATH="/Users/vova/.local/state/fnm_multishells/31402_1736943891422"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/Users/vova/.local/share/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_COREPACK_ENABLED="false"
export FNM_RESOLVE_ENGINES="true"
export FNM_ARCH="arm64"
autoload -U add-zsh-hook
_fnm_autoload_hook () {
    if [[ -f .node-version || -f .nvmrc || -f package.json ]]; then
    fnm use --silent-if-unchanged
fi

}

add-zsh-hook chpwd _fnm_autoload_hook \
    && _fnm_autoload_hook

rehash

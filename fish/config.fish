fish_vi_key_bindings

set -U fish_greeting

alias spotify='ncspot'
alias lg='lazygit'
alias ld='lazydocker'
alias vim='nvim'
alias ls='lsd -A'
alias ll='lsd -lA'
alias lt='lsd --tree --depth 3 --ignore-glob node_modules'
alias top='btm'
alias htop='btm -b'
alias vtop='btm -b'
alias cat='bat --theme=GitHub'
alias ps='procs'
alias df='duf'
alias docker='podman'
alias docker-compose='podman-compose'
alias reload='exec fish'

starship init fish | source
frum init | source
fnm env --use-on-cd | source
zoxide init fish | source

fish_add_path -g ~/.cargo/bin
# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

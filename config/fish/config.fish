fish_vi_key_bindings

set -U fish_greeting

set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

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
# alias speedtest='networkquality'
alias speedtest='speedtest-cli'
alias weather='curl wttr.in/cherkasy'
alias youtube='youtube-dl'

function npm-login
  if grep -q "codeartifact" ~/.npmrc
    aws codeartifact login --tool npm --domain maxeda --repository npm
  else
    echo "You are currently using Artifactory, login is not needed!"
  end
end

function build_fabric
  set -l current_path $PWD
  rm -rf ~/work/bitbucket/frontend/fabricsjs/packages/fabricsjs/dist && ~/work/bitbucket/frontend/fabricsjs/packages/fabricsjs & npm run build && rm -rf ~/work/bitbucket/frontend/buying-advice/node_modules/@maxeda/fabricsjs/dist && rm -rf ~/work/bitbucket/frontend/buying-advice/node_modules/@maxeda/fabricsjs/src && cp -R ~/work/bitbucket/frontend/fabricsjs/packages/fabricsjs/dist ~/work/bitbucket/frontend/buying-advice/node_modules/@maxeda/fabricsjs && cp -R ~/work/bitbucket/frontend/fabricsjs/packages/fabricsjs/src ~/work/bitbucket/frontend/buying-advice/node_modules/@maxeda/fabricsjs
  cd $current_path
end

starship init fish | source
frum init | source
fnm env --use-on-cd | source
zoxide init fish | source

fish_add_path -g ~/.cargo/bin
# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish


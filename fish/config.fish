fish_vi_key_bindings

set -U fish_greeting

alias spotify='ncspot'
alias lg='lazygit'
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

frum init | source
fnm env --use-on-cd | source
starship init fish | source
zoxide init fish | source

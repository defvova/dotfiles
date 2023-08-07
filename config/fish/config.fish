fish_vi_key_bindings

set -U fish_greeting
set -gx EDITOR nvim
set -gx FZF_CTRL_T_COMMAND nvim

# don't describe the command for darwin
# https://github.com/fish-shell/fish-shell/issues/6270
function __fish_describe_command; end

# fish_config theme save "Catppuccin Frappe"
# fish_config theme save "Catppuccin Latte"

# Fish syntax highlighting
# set -g fish_color_autosuggestion '555'  'brblack'
# set -g fish_color_cancel -r
# set -g fish_color_command --bold
# set -g fish_color_comment red
# set -g fish_color_cwd green
# set -g fish_color_cwd_root red
# set -g fish_color_end brmagenta
# set -g fish_color_error brred
# set -g fish_color_escape 'bryellow'  '--bold'
# set -g fish_color_history_current --bold
# set -g fish_color_host normal
# set -g fish_color_match --background=brblue
# set -g fish_color_normal normal
# set -g fish_color_operator bryellow
# set -g fish_color_param cyan
# set -g fish_color_quote yellow
# set -g fish_color_redirection brblue
# set -g fish_color_search_match 'bryellow'  '--background=brblack'
# set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
# set -g fish_color_user brgreen
# set -g fish_color_valid_path --underline

# set -gx PATH bin $PATH
# set -gx PATH ~/bin $PATH
# set -gx PATH ~/.local/bin $PATH

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
alias cat="bat --theme='Monokai Extended Bright'"
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

fish_add_path -g ~/.cargo/bin
# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# set --export PATH $HOME/.emacs.d/bin $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

starship init fish | source
frum init | source
fnm env --use-on-cd | source
zoxide init fish | source

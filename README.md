Installation:

1) clone
`````
git clone git@github.com:volodymyrpartytskyi/vim.git
`````
2) create symlink
````````````
ln -s  ~/.vim/.vimrc ~/.vimrc
````````````
3) open gvim and enter:
``````````
:BundleInstall
``````````

If you have warnings:

1) `Unable to create Ubuntu Menu Proxy: Timeout was reached`

2) `Trying to remove a child that does not believe we are it is parent.`

add in `~/.bashrc` the lines and restart the terminal
``````
function gvim () { (/usr/bin/gvim -f "$@" &>/dev/null &) }
alias gvim='UBUNTU_MENUPROXY= gvim'
``````

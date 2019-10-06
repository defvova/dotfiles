"               _______           _______
"     |\     /|(  ___  )|\     /|(  ___  )
"     | )   ( || (   ) || )   ( || (   ) |
"     | |   | || |   | || |   | || (___) |
"     ( (   ) )| |   | |( (   ) )|  ___  |
"      \ \_/ / | |   | | \ \_/ / | (   ) |
"       \   /  | (___) |  \   /  | )   ( |
"        \_/   (_______)   \_/   |/     \|
"           _                              __ _
"          (_)                            / _(_)
"    __   ___ _ __ ___     ___ ___  _ __ | |_ _  __ _
"    \ \ / / | '_ ` _ \   / __/ _ \| '_ \|  _| |/ _` |
"     \ V /| | | | | | | | (_| (_) | | | | | | | (_| |
"      \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                __/ |
"                                               |___/

scriptencoding utf-8
source ~/.config/nvim/init/plugins.vim

for f in split(glob('~/.config/nvim/init/functions/*.vim'), '\n')
  exe 'source' f
endfor

source ~/.config/nvim/init/functions.vim
source ~/.config/nvim/init/mappings.vim

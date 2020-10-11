" let $NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
let $NNN_TRASH=1
let $NNN_BMS="D:~/Downloads;v:~/Videos"
let $NNN_PLUG='f:finder;o:fzopen;p:preview-tui;d:diffs;t:nmount;v:imgview'
let $NNN_OPENER="nuke"

" Disable default mappings
let g:nnn#set_default_mappings = 0

let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#command = 'nnn -od'

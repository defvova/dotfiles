" Map leader to which_key
nnoremap <silent> <Space> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <Space> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'

" By default timeoutlen is 1000 ms
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['.'] = [ ':e $MYVIMRC', 'open init' ]

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'v' : [':Vista!!', 'tag viewer'],
      \ 'w' : [':WakaTimeToday', 'total coding activity for Today'],
      \ 'c' : [':Codi', 'total coding activity for Today'],
      \ }

let g:which_key_map.s = {
      \ 'name': '+surroundings',
      \ 'a': ['saiw', 'add'],
      \ 'A': ['sai', 'add (for visual mode)'],
      \ 'd': ['sd', 'delete/visual mode'],
      \ 'r': ['sr', 'replace'],
      \ 'f': ['saiwf', 'function surroundings'],
      \ 'i': ['saiwi', 'instant surroundings'],
      \ 't': ['saiwt', 'html style tags'],
      \ }

let g:which_key_map.r = {
      \ 'name': '+rails',
      \ 'v': [':Eview', 'go to view'],
      \ 'm': [':Emodel', 'go to model'],
      \ 'c': [':Econtroller', 'go to controller'],
      \ 'M': [':Emigration', 'go to last migration'],
      \ 'o': ['gf', 'go to class/gem etc'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'C' : [':Commits', 'commits'],
      \ 'c' : [':BCommits', 'buffer commits'],
      \ 'V' : [':GV', 'view commits'],
      \ 'v' : [':GV!', 'view buffer commits'],
      \ 'd' : [':Git difftool', 'load changesets']
      \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ 't' : [':FloatermNew --wintype=popup --height=6', 'open terminal'],
      \ 'h' : [':FloatermNew htop', 'open htop'],
      \ }


" Register which key map
call which_key#register('<Space>', "g:which_key_map")

" Wrap in try/catch to avoid errors on initial install before plugin is available
try

" Open NERDTree in the directory of the current file (or /home if no file is open)
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
    exe ':NERDTreeClose'
  else
    if (expand('%:t') !=# '')
      exe ':NERDTreeFind'
    else
      exe ':NERDTreeToggle'
    endif
  endif
endfunction

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1

" Remove bookmarks and help text from NERDTree
let NERDTreeMinimalUI=1

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

let g:NERDTreeWinSize=60

catch
  echo 'NERDTree not installed. It should work after running :PlugInstall'
endtry

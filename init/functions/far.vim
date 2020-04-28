" Wrap in try/catch to avoid errors on initial install before plugin is available
try

" Improving scrolling performance
set lazyredraw
set regexpengine=1

" Specify the source
let g:far#source = 'rgnvim'

" Automatically open/scroll preview window on cursor movement.
let g:far#auto_preview = 0

" List of favorite file masks provided for command-line completion.
let g:far#file_mask_favorites = ['**/*.rb', '**/*.js', '**/*.css']

" This value is used as the file-mask if it wasn't specified through the command.
let g:far#default_file_mask = '**/*.*'

catch
  echo 'Far not installed. It should work after running :PlugInstall'
endtry


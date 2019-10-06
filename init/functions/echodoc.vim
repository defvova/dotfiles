" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1

catch
  echo 'Echodoc not installed. It should work after running :PlugInstall'
endtry

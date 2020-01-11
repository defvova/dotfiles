let g:ale_fixers = {
\   'javascript': ['standard', 'prettier'],
\   'ruby': ['rubocop'],
\   'css': ['prettier']
\}
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '➤'
let g:ale_sign_info = '⚠'
" let g:ale_airline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_lint_on_text_changed = 'never'

let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1

" Automatically lint when leaving insert mode
let g:lint_on_insert_leave = 1

let g:ale_linters = {
\   'javascript': ['standard', 'prettier'],
\   'ruby': ['rubocop'],
\}

" Enable signs showing in the gutter to reduce interruptive visuals
" let g:ale_set_signs = 1

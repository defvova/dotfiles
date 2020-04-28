let g:ascii = [
      \'',
      \'',
      \':::::::::   ::::::::               :::::::::   ::::::::',
      \':+:    :+: :+:    :+:              :+:    :+: :+:    :+:',
      \'+:+    +:+       +:+               +:+    +:+       +:+',
      \'+#++:++#:      +#+   +#++:++#++:++ +#+    +:+     +#+',
      \'+#+    +#+   +#+                   +#+    +#+   +#+',
      \'#+#    #+#  #+#                    #+#    #+#  #+#',
      \'###    ### ##########              #########  ##########',
      \'',
      \'Description: Made with love in Ukraine.',
      \'Maintainer:  Vova <https://github.com/0bman/vim>',
      \'',
      \ ]
let g:startify_custom_header = g:ascii + startify#fortune#boxed()
let g:startify_files_number = 6
let g:startify_list_order = [
      \ ['   My most recently used files in the current directory:'],
      \ 'dir',
      \ ['   My most recently used files:'],
      \ 'files',
      \ ['   These are my sessions:'],
      \ 'sessions',
      \ ['   These are my bookmarks:'],
      \ 'bookmarks',
      \ ]
let g:startify_update_oldfiles = 1
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0
let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
      \ 'bundle/.*/doc',
      \ ]


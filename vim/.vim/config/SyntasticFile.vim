" Recommended Settings
" https://github.com/scrooloose/syntastic
" =======================================
" Add a message to the status line that there's errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set eslint as javascript linter
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_scss_checkers = ['scss_lint']

" Turn debugging on
" let g:syntastic_debug = 3

" Don't show the error window
let g:syntastic_auto_loc_list = 0



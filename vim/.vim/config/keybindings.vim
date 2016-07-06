" Tabs
map <C-t><up> :tabr<cr>
map <C-t>l :tabl<cr>
map <C-t>h :tabp<cr>
map <C-t><right> :tabn<cr>

" CtrlP
let g:ctrlp_map = '<c-p>'

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

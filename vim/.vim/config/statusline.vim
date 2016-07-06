" Show git information
set statusline+=%{fugitive#statusline()}

" Add a message to the status line that there's errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

Get ESLint for Vim
===================

References
----------
* [Syntastic](https://github.com/scrooloose/syntastic)
* [ESLint Integrations](http://eslint.org/docs/user-guide/integrations)

Install
--------
Make sure you install [Syntastic](https://github.com/brandyn1bennett/documentation/blob/master/vim/Vim-Syntastic.md)

In `~/.vim/config/SyntasticFile.vim` add the following
```VimL
let g:syntastic_javascript_checkers = ["eslint"]
```
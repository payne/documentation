" Install powerline
" @see http://powerline.readthedocs.io/en/master/usage/other.html
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Always show statusline
set laststatus=2

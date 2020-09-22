set ai
set nu
set ru
set list
set title
set expandtab
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=3
set encoding=utf-8
"set encoding=big5
set listchars=tab:\|\ ,trail:.",eol:_
set backspace=indent,eol,start
set fileencodings=utf8,big5
    "set cursorline
imap <C-[>[1~ <C-o>^
imap <C-[>[H ^
imap <C-[>[F $
imap <F9> <C-o><C-w><
imap <F10> <C-o><C-w>+
imap <F11> <C-o><C-w>-
imap <F12> <C-o><C-w>>
map <C-[>[1~ ^
map <C-[>[H ^
map <C-[>[F $
map <F9> <C-w><
map <F10> <C-w>+
map <F11> <C-w>-
map <F12> <C-w>>
autocmd FileType make set noexpandtab
syntax on
color desert

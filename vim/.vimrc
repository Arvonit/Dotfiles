" Allow copying and pasting to OS clipboard
set clipboard=unnamed
" Set tab equal to 4 spaces since I use that most often
set tabstop=4
set expandtab
" Show relative line numbers but show absolute line for selected one
set number
set relativenumber
" Change <esc> delay to 5 ms
set timeoutlen=1000
set ttimeoutlen=5
" Enable mouse support
set mouse+=a
" Always show the status line at the bottom
" set laststatus=2
" Disable the alert when you mess up because it's annoying 
set noerrorbells visualbell t_vb=

" Turn on snytax highlighting
syntax on

" Base 16 theme
" let base16colorspace=256
" colorscheme base16-default-dark

" Set line cursor for insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" Set block cursor for normal mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

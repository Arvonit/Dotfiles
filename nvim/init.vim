" Because fish is not POSIX compliant
set shell=/bin/zsh

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'dag/vim-fish'

call plug#end()

" Allow copying from and pasting to OS clipboard
set clipboard=unnamed

" Hide insert and visual indicator at the bottom since we are using lightline
set noshowmode

" Change <esc> delay to 5 ms
" This eliminates the delay when switching between insert and normal
set timeoutlen=1000
set ttimeoutlen=5

" Enable mouse support
set mouse+=a

" Show relative line numbers but show absolute line for selected one
set number
set relativenumber

" Set tab equal to 4 spaces since I use that most often
set tabstop=4
set expandtab
set shiftwidth=4

" Map <C-j> to <esc> to make it easier to go to normal mode
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

" Gruvbox theme
colorscheme base16-gruvbox-dark-hard
set termguicolors

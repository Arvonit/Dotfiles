" Helper function to conditonally initialize plugins (this is useful to not load certain plugins 
" that may not work through the vscode neovim extension)
function! Cond(Cond, ...)
    let opts = get(a:000, 0, {})
    return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'dag/vim-fish'
Plug 'tpope/vim-commentary', Cond(!exists('g:vscode'))
" Use normal easymotion when in vim mode
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" Use vscode easymotion when in vscode mode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

call plug#end()

" Gruvbox theme
colorscheme base16-gruvbox-dark-hard
set termguicolors

" Map leader to space
let mapleader = "\<Space>"

" Allow copying from and pasting to OS clipboard
set clipboard=unnamed

" Hide insert and visual indicator at the bottom since I am using lightline
set noshowmode

" Change <esc> delay to 5 ms
" This eliminates the delay when switching between insert and normal
set timeoutlen=1000
set ttimeoutlen=5

" Enable mouse support
set mouse+=a

" Show line numbers
set number

" Highlight current line number
set cursorline
hi cursorline guibg=NONE

" Set tab equal to 4 spaces since I use that most often
set expandtab
set tabstop=4
set shiftwidth=4

" Display 100-character-wide ruler/column and wrap text at 100 characters
set colorcolumn=100
set textwidth=100

" Make search case-insensitive unless a capital letter is specifically typed
set ignorecase
set smartcase

" Enable searching while typing instead waiting to press enter
set incsearch

" Disable Ex mode since I never intend to use it
nmap Q <Nop>

" Map Ctrl+j to Escape to make it easier to go to normal mode
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

" Disable arrow keys so that I am forced to use vim navigation keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
" inoremap <Left> <ESC>:echoe "Use h"<CR>
" inoremap <Right> <ESC>:echoe "Use l"<CR>
" inoremap <Up> <ESC>:echoe "Use k"<CR>
" inoremap <Down> <ESC>:echoe "Use j"<CR>

" Clear search results with Ctrl+l
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" VSCode-related settings (used with the VSCode NeoVim plugin)
if exists('g:vscode')
    " Use vim-commentary keybindings for commenting in vscode
    xmap gc <Plug>VSCodeCommentary
    nmap gc <Plug>VSCodeCommentary
    omap gc <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
    nmap gC <Plug>VSCodeCommentaryLine
endif

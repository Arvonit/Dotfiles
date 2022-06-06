" Helper function to conditonally initialize plugins (this is useful to not load certain plugins 
" that won't work with the vscode neovim extension)
function! Cond(Cond, ...)
    let opts = get(a:000, 0, {})
    return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'fnune/base16-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi' " Use readline/emacs shortcuts in insert mode and the command line
Plug 'michaeljsmith/vim-indent-object'

if !exists('vscode') && executable('node')
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " VSCode-style autocomplete
endif

Plug 'bfrg/vim-cpp-modern' " Better C/C++ syntax highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight' " C/C++ semantic highlighting from clangd
Plug 'dag/vim-fish' " Syntax highlighting for fish script

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'chriskempson/base16-vim'
" Plug 'gruvbox-community/gruvbox'
" Plug 'neovim/nvim-lspconfig' 
" Use normal easymotion when in vim and patched easymotion when in vscode
" Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

call plug#end()

" Gruvbox theme
colorscheme base16-gruvbox-dark-hard
hi CursorLineNr guifg=gui04 guibg=gui00
hi link LspCxxHlGroupMemberVariable Normal
set termguicolors

" Map leader to space
let mapleader = ' '

" Allow copying from and pasting to OS clipboard
set clipboard=unnamed

" Hide insert and visual indicator at the bottom since I am using lightline
set noshowmode

" Change <esc> delay to 5 ms
" This eliminates the delay when switching between insert and normal modes
set timeoutlen=300
set ttimeoutlen=5

" Enable mouse support
set mouse=a

" Show line numbers
set number

" Highlight current line number
set cursorline
hi cursorline guibg=NONE

" Set tab equal to 4 spaces since I use that most often
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent autoindent

" Display 100-character-wide ruler/column and wrap text at 100 characters
set colorcolumn=100
set textwidth=100

" Make search case-insensitive unless a capital letter is specifically typed
set ignorecase
set smartcase

" Enable searching while typing instead waiting to press enter
set incsearch

" Persistent undo
set undodir=~/.local/share/nvim/undo
set undofile

" Disable Ex mode since I never intend to use it
nmap Q <Nop>

" TODO: Fix
" nmap q <Nop>

" Quick save
nmap <leader>w :w<CR>

" Make it easier to enter commands
nmap ; :

" Map Ctrl+j to Escape to make it easier to go to normal mode
"
" For some bizarre reason, having this enabled in the VSCode Neovim extension causes all sorts of 
" trouble with pasting text, and only when C-j is used as the keybinding. So, we'll disable it
" in VSCode.
if !exists('g:vscode')
    nnoremap <C-j> <Esc>
    inoremap <C-j> <Esc>
    vnoremap <C-j> <Esc>
    snoremap <C-j> <Esc>
    xnoremap <C-j> <Esc>
    cnoremap <C-j> <C-c>
    onoremap <C-j> <Esc>
    lnoremap <C-j> <Esc>
    tnoremap <C-j> <Esc>
endif

" Disable arrow keys so that I am forced to use vim navigation keys
nnoremap <Left> :echoe 'Use h'<CR>
nnoremap <Right> :echoe 'Use l'<CR>
nnoremap <Up> :echoe 'Use k'<CR>
nnoremap <Down> :echoe 'Use j'<CR>
" inoremap <Left> <ESC>:echoe 'Use h'<CR>
" inoremap <Right> <ESC>:echoe 'Use l'<CR>
" inoremap <Up> <ESC>:echoe 'Use k'<CR>
" inoremap <Down> <ESC>:echoe 'Use j'<CR>

" Clear search results with Ctrl+l
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Change C comment string to double-slash (//)
autocmd FileType c setlocal commentstring=//\ %s

" VSCode-related settings (used with the VSCode NeoVim plugin)
if exists('g:vscode')
    " Use vim-commentary keybindings for commenting in VSCode
    xmap gc <Plug>VSCodeCommentary
    nmap gc <Plug>VSCodeCommentary
    omap gc <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
    nmap gC <Plug>VSCodeCommentaryLine
endif

" TextEdit might fail if hidden is not set
" set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Give more space for displaying messages
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Show sign column and line numbers
set signcolumn=number

" COC related settings
" if !exists('g:vscode') && executable('node')
"     " source ~/.config/nvim/coc.vim

"     " Use tab for trigger completion with characters ahead and navigate
"     " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"     " other plugin before putting this into your config
"     inoremap <silent><expr> <TAB>
"           \ pumvisible() ? "\<C-n>" :
"           \ <SID>check_back_space() ? "\<TAB>" :
"           \ coc#refresh()
"     inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"     function! s:check_back_space() abort
"       let col = col('.') - 1
"       return !col || getline('.')[col - 1]  =~# '\s'
"     endfunction

"     " Use <c-space> to trigger completion
"     inoremap <silent><expr> <c-space> coc#refresh()

"     " Make <CR> auto-select the first completion item and notify coc.nvim to
"     " format on enter, <cr> could be remapped by other vim plugin
"     inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                                   \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"     " Use `[g` and `]g` to navigate diagnostics
"     " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
"     nmap <silent> [g <Plug>(coc-diagnostic-prev)
"     nmap <silent> ]g <Plug>(coc-diagnostic-next)

"     " GoTo code navigation
"     nmap <silent> gd <Plug>(coc-definition)
"     nmap <silent> gy <Plug>(coc-type-definition)
"     nmap <silent> gi <Plug>(coc-implementation)
"     nmap <silent> gr <Plug>(coc-references)

"     " Use K to show documentation in preview window
"     nnoremap <silent> K :call <SID>show_documentation()<CR>

"     function! s:show_documentation()
"       if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"       elseif (coc#rpc#ready())
"         call CocActionAsync('doHover')
"       else
"         execute '!' . &keywordprg . " " . expand('<cword>')
"       endif
"     endfunction

"     " Highlight the symbol and its references when holding the cursor
"     autocmd CursorHold * silent call CocActionAsync('highlight')

"     " Symbol renaming
"     nmap <leader>rn <Plug>(coc-rename)

"     " Formatting selected code
"     xmap <leader>f  <Plug>(coc-format-selected)
"     nmap <leader>f  <Plug>(coc-format-selected)

"     augroup mygroup
"       autocmd!
"       " Setup formatexpr specified filetype(s)
"       autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"       " Update signature help on jump placeholder
"       autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"     augroup end

"     " Applying codeAction to the selected region
"     " Example: `<leader>aap` for current paragraph
"     xmap <leader>a  <Plug>(coc-codeaction-selected)
"     nmap <leader>a  <Plug>(coc-codeaction-selected)

"     " Remap keys for applying codeAction to the current buffer
"     nmap <leader>ac  <Plug>(coc-codeaction)
"     " Apply AutoFix to problem on the current line
"     nmap <leader>qf  <Plug>(coc-fix-current)

"     " Map function and class text objects
"     " NOTE: Requires 'textDocument.documentSymbol' support from the language server
"     xmap if <Plug>(coc-funcobj-i)
"     omap if <Plug>(coc-funcobj-i)
"     xmap af <Plug>(coc-funcobj-a)
"     omap af <Plug>(coc-funcobj-a)
"     xmap ic <Plug>(coc-classobj-i)
"     omap ic <Plug>(coc-classobj-i)
"     xmap ac <Plug>(coc-classobj-a)
"     omap ac <Plug>(coc-classobj-a)

"     " Remap <C-f> and <C-b> for scroll float windows/popups
"     if has('nvim-0.4.0') || has('patch-8.2.0750')
"       nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"       nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"       inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"       inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"       vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"       vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"     endif

"     " Use CTRL-S for selections ranges
"     " Requires 'textDocument/selectionRange' support of language server
"     nmap <silent> <C-s> <Plug>(coc-range-select)
"     xmap <silent> <C-s> <Plug>(coc-range-select)

"     " Add `:Format` command to format current buffer
"     command! -nargs=0 Format :call CocAction('format')

"     " Add `:Fold` command to fold current buffer
"     command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"     " Add `:OR` command for organize imports of the current buffer
"     command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
 
"     " Mappings for CoCList
"     " Show all diagnostics
"     nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"     " Manage extensions
"     " nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"     " Show commands
"     nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"     " Find symbol of current document
"     nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"     " Search workspace symbols
"     nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"     " Do default action for next item
"     nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"     " Do default action for previous item
"     nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"     " Resume latest coc list
"     nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"     " Add CoC status to lightline
"     let g:lightline = {
"         \ 'active': {
"         \   'left': [ [ 'mode', 'paste' ],
"         \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"         \ },
"         \ 'component_function': {
"         \   'cocstatus': 'coc#status'
"         \ },
"     \ }

"     " Use autocmd to force lightline update
"     autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"     " Change error underline to undercurl to make it more obvious
"     " hi CocUnderline cterm=undercurl gui=undercurl 
"     hi ErrorHighlight cterm=undercurl ctermfg=0 ctermbg=1 gui=undercurl guisp=#fb4934
" endif

" Treesitter config
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   highlight = {
"     enable = true,
"     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"     -- Using this option may slow down your editor, and you may see some duplicate highlights.
"     -- Instead of true it can also be a list of languages
"     additional_vim_regex_highlighting = false,
"   },
"   indent = {
"     enable = true
"   }
" }
" EOF

filetype on
filetype plugin on
filetype indent on

" Search
set ignorecase
"set hlsearch
set smartcase

" Sidebar
set number
"set relativenumber
set ruler

" Other
set nocompatible
set clipboard=unnamed
set showcmd
set autoindent
set smartindent
set wildmenu
"set lazyredraw
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Markdown .md support

" Setting text width
au BufRead /tmp/mutt-* set tw=72

" Automatically close completion windows
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Tab usage
set smarttab
"set expandtab

" Colorscheme
syntax enable
colorscheme jellybeans

" Highlight current line number
hi clear CursorLine
augroup CLClear
	autocmd! ColorScheme * hi clear CursorLine
augroup END
hi CursorLineNR cterm=bold
augroup CLNRSet
	autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END
set cursorline

" Completion stuff
let g:clang_user_options='|| exit 0'
let g:clang_hl_errors='0'

" Mapping
noremap <F8> :bn<CR>
noremap <F7> :bd<CR>
noremap <F6> :bp<CR>
noremap <F5> :b#<CR>
noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :TlistToggle<CR>
nnoremap <F9> <C-W>v
nnoremap <F10> <C-W>s
nnoremap <F11> <C-W>q
nnoremap <F11> <C-W>q
nnoremap <Left> <C-w>h
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Right> <C-w>l
nnoremap <S-Left> gT
nnoremap <S-Right> gt
map H ^
map L $
nnoremap ; :

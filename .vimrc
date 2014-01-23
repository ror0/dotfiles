filetype on
filetype plugin on
filetype indent on

" Search
set ignorecase
set smartcase

" Sidebar
set number
set ruler

" Font
set guifont=Inconsolata

" Other
set nocompatible
set clipboard=unnamed
set showcmd
set showmode

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Tab usage
set autoindent
set smartindent
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
set wildmenu

" YCM settings
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-N>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-P>']
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_strings = 0
let g:ycm_filetype_whitelist = {
			\ 'cpp': 1,
			\ 'c': 1,
			\ 'python': 1,
			\ 'perl': 1
			\}
"end

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

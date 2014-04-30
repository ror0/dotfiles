filetype on
filetype plugin on
filetype indent on

" Search
set ignorecase
set smartcase
set incsearch
"end

" Sidebar
set number
set ruler
"end

" GUI Options
set guifont=Inconsolata
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
"end

" Other
set nocompatible
set clipboard=unnamed
set showcmd
set showmode
"set nowrap
"end

" Prevent vim from auto inserting comments on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"end

" Tab usage
set autoindent
set smartindent
set smarttab
"end

" Colorscheme
syntax enable
colorscheme jellybeans
"end

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
"end

" Completion stuff
set wildmenu
"end

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
			\ 'html': 1,
			\ 'php': 1,
			\ 'css': 1,
			\ 'perl': 1
			\}
"end

"Taglist
let Tlist_Use_Right_Window = 1
"end

" Status line
set modeline
set ls=2

hi User1	ctermfg=3	ctermbg=0
hi User2	ctermfg=1	ctermbg=0
hi User3	ctermfg=5	ctermbg=0
hi User4	ctermfg=2	ctermbg=0
hi User5	ctermfg=11	ctermbg=0

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
"end

" Mapping
noremap <F8> :bn<CR>
noremap <F7> :bd<CR>
noremap <F6> :bp<CR>
noremap <F5> :b#<CR>
noremap <F3> :TlistToggle<CR>
noremap <F2> :NERDTreeToggle<CR>
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
"end

" Omnifunc settings
if has("autocmd")
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete
	autocmd FileType python setlocal omnifunc=youcompleteme#OmniComplete
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType c setlocal omnifunc=ccomplete#Complete
	autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
endif 
"end

" Change directory to the current buffer when opening files.
"set autochdir

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction

" ======== Plugin sourcing ========
silent so $HOME/.vim/plugins.vim


" ======== General settings ========
set number						" Line numbering
set visualbell					" No bell noise
set t_vb=						" No visual bell
set showcmd						" Show incomplete commands below
set ignorecase					" Ignore case when searching
set smartcase					" Override ignorecase when an upper case character is used
set nohlsearch					" Do not highlight search matches
set whichwrap+=<,>,h,l			" Allows movement to wrapped lines
set showmatch					" Show macthing brakcets
set noswapfile					" Turn off swap files
"set hidden						" Allow switching buffers without writing changes
set splitbelow					" Change horizontal split to open below
set splitright					" Change vertical split to open to the right
set wildmode=longest:full,full	" Open wildmenu on first tab and complete on second
set wildmenu					" Enable command completion window
set nowritebackup				" Disable backups
set history=10000				" Increase command history and search patterns
set mouse=a						" Enable use of mouse
set encoding=utf-8				" Enable UTF-8 encoding
set updatetime=100				" Decrease update time to 100 ms

" Prevent vim from auto inserting comments on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" ======== Color settings ========
syntax enable				" Enable syntax highlighting
colorscheme jellybeans		" Set colorscheme

" Highlight current line number
hi clear CursorLine
augroup CLClear
	autocmd! ColorScheme * hi clear CursorLine
augroup END

hi CursorLineNR ctermfg=yellow
augroup CLNRSet
	autocmd! ColorScheme * hi CursorLineNR ctermfg=yellow
augroup END

set cursorline				" Enable cursorline highlighting


" ======== GUI settings ======== 
if has("gui_running")
    set guioptions-=T   " Remove toolbar
    set guioptions-=m   " Remove menu bar
    set guioptions-=r   " Remove scrollbar
    set guioptions-=e   " Remove tabs
    set guioptions-=g   " Hide unused menu items
    set guioptions-=L   " Remove other scrollbar
    set t_Co=256
    set guitablabel=%M\ %t

    " Set the font for each operating system
	if has("unix")
		set guifont=Source\ Code\ Pro\ 12
	elseif has("mac")
		set guifont=Menlo\ Regular:h14
	elseif has("win32")
		set guifont=Consolas:h10:cANSI
	endif
endif


" ======== Completion settings ========
set completeopt=menuone,longest


" ======== Tab settings ======== 
set tabstop=4		" Use 4 spaces for tabes instead of 8
set shiftwidth=4	" Use 4 spaces when indenting

set smartindent		" Use smart indenting hints


" ======== Folding settings ========
set foldmethod=syntax
au BufRead * normal zR


" ======== Tabline settings ========
hi TablineFill	ctermfg=0	ctermbg=235


" ======== Seperator settings ========
set fillchars=vert:\ ,fold:\ 


" ======== Statusline settings ======== 
set laststatus=2

" Status line
hi User1	ctermfg=3	ctermbg=235
hi User2	ctermfg=1	ctermbg=235
hi User3	ctermfg=5	ctermbg=235
hi User4	ctermfg=2	ctermbg=235
hi User5	ctermfg=11	ctermbg=235

hi User1	guifg=#E1AA5D	guibg=#262626
hi User2	guifg=#E84F4F	guibg=#262626
hi User3	guifg=#9B64FB	guibg=#262626
hi User4	guifg=#B8D68C	guibg=#262626
hi User5	guifg=#F39D21	guibg=#262626

set statusline=
set statusline +=%1*\ [%n]\ %*		" Buffer number
set statusline +=%4*\ %t\ %*		" File name
set statusline +=%3*\ %y%*			" File type
set statusline +=%2*%m%*			" Modified flag
set statusline +=%1*%=%l\ x\ %*		" Current line
set statusline +=%1*%v\ %*			" Virtual column number
set statusline +=%2*\ [%L]%*		" Total lines


" ======== Netrw settings ========
let g:netrw_liststyle=3         " thin (change to 3 for tree)
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically


" ======== Mapping sourcing ========
silent so ~/.vim/mappings.vim


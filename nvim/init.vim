" ======== Plugin sourcing ======== 
silent so $HOME/.config/nvim/plugin.vim


" ======== General settings ======== 
set number						" Line numbering
set visualbell					" No bell noise
set showcmd						" Show incomplete commands below
set ignorecase					" Ignore case when searching
set smartcase					" Override ignorecase when an upper case character is used
set nohlsearch					" Do not highlight search matches
set whichwrap+=<,>,h,l			" Allows movement to wrapped lines
set showmatch					" Show macthing brakcets
set noswapfile					" Turn off swap files
set hidden						" Allow switching buffers without writing changes
set splitbelow					" Change horizontal split to open below
set splitright					" Change vertical split to open to the right
set wildmode=longest:full,full	" Open wildmenu on first tab and complete on second

" Prevent vim from auto inserting comments on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" ======== Color settings ======== 
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
	if has("gui_gtk2")
		set guifont=DejaVuSansMono\ 9
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		set guifont=Consolas:h10:cANSI
	endif
endif


" ======== Completion settings ======== 
set completeopt=menuone,longest


" ======== Tab settings ======== 
set tabstop=4		" Use 4 spaces for tabs instead of 8
set shiftwidth=4	" Use 4 spaces when indenting

set smartindent		" Use smart indenting hints


" ======== Folding settings ======== 
set foldmethod=syntax
au BufRead * normal zR

" ======== Statusline settings ======== 
set laststatus=2

" Status line
hi User1	ctermfg=3	ctermbg=235
hi User2	ctermfg=1	ctermbg=235
hi User3	ctermfg=5	ctermbg=235
hi User4	ctermfg=2	ctermbg=235
hi User5	ctermfg=11	ctermbg=235

set statusline=
set statusline +=%1*\ [%n]\ %*		" Buffer number
set statusline +=%4*\ %t\ %*		" File name
set statusline +=%3*\ %y%*			" File type
set statusline +=%2*%m%*			" Modified flag
set statusline +=%1*%=%l\ x\ %*		" Current line
set statusline +=%1*%v\ %*			" Virtual column number
set statusline +=%2*\ [%L]%*		" Total lines


" ======== Mapping sourcing ======== 
silent so $HOME/.config/nvim/mapping.vim


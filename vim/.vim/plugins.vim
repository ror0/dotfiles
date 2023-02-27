" ======== vim-plug ======== 
if empty(glob(expand($HOME) . '/' . g:vimdir . '/autoload/plug.vim'))
	execute "silent !curl -fLo " . expand($HOME) . "/" . g:vimdir . "/autoload/plug.vim --create-dirs " .
				\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin() 
" Colorscheme
Plug 'nanotech/jellybeans.vim'

" Utility
Plug 'ap/vim-buftabline'
Plug 'cohama/lexima.vim'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-characterize'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Languages
Plug 'rust-lang/rust.vim'
Plug 'vim-python/python-syntax'
Plug 'cespare/vim-toml'
Plug 'tikhomirov/vim-glsl'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/html5.vim'

" Add plugins to &runtimepath
call plug#end()


" ======== Plugin settings ======== 
" CoC
inoremap <silent><expr> <c-space> coc#refresh()

" Jellybeans
let g:jellybeans_overrides = {
			\    'background': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': '151515' },
			\}
let g:jellybeans_use_gui_italics = 0

" Buftabline
let g:buftabline_show = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1


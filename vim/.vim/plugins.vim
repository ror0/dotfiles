" ======== vim-plug ======== 
call plug#begin()

" Colorscheme
Plug 'nanotech/jellybeans.vim'

" Utility
Plug 'ap/vim-buftabline'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

" Linter
Plug 'w0rp/ale'

" Completion
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "getafix"
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
	"Plug 'r10o/YouCompleteMe', { 'do': './install.py --all' }
endif

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
" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" ale
let g:ale_lint_on_save = 1
"let g:ale_linters = {
"	\'python': ['pylint', 'autopep8'],
"	\}

" Jellybeans
let g:jellybeans_overrides = {
	\    'background': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': '151515' },
	\}
let g:jellybeans_use_gui_italics = 0

" Buftabline
let g:buftabline_show = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1


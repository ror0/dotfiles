" ======== vim-plug ======== 
call plug#begin()

" Colorscheme
Plug 'nanotech/jellybeans.vim'

" Utility
Plug 'ap/vim-buftabline'
Plug 'jiangmiao/auto-pairs'

" Completion
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "getafix"
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
endif

" Languages
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'tikhomirov/vim-glsl'
Plug 'octol/vim-cpp-enhanced-highlight'

" Add plugins to &runtimepath
call plug#end()


" ======== Plugin settings ======== 
" YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Jellybeans
let g:jellybeans_overrides = {
	\    'background': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': '151515' },
	\}
let g:jellybeans_use_gui_italics = 0

" Buftabline
let g:buftabline_show = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1


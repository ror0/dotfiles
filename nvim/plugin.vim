" ======== vim-plug ======== 
call plug#begin()

" Colorscheme
Plug 'nanotech/jellybeans.vim'

" Utility
Plug 'ap/vim-buftabline'
Plug 'jiangmiao/auto-pairs'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'racer-rust/vim-racer'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'othree/html5.vim'

" Languages
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'tikhomirov/vim-glsl'
Plug 'octol/vim-cpp-enhanced-highlight'

" Add plugins to &runtimepath
call plug#end()


" ======== Plugin settings ======== 
" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 1000
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['around']

" Clang
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/include/clang/"
let g:deoplete#sources#clang#sort_algo = "priority"

" Go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#cgo = 1
let g:deoplete#sources#go#cgo#libclang_path = '/lib/libclang.so'
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = $HOME.'/.cache/deoplete/go/$GOOS_$GOARCH'

" Rust
let g:racer_cmd = "/usr/bin/racer"

" Jellybeans
let g:jellybeans_overrides = {
	\    'background': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': '151515' },
	\}
let g:jellybeans_use_gui_italics = 0

" Buftabline
let g:buftabline_show = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1

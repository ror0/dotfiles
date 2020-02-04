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
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

" Linter
"Plug 'w0rp/ale'
"Plug 'vim-syntastic/syntastic'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"let hostname = substitute(system('hostname'), '\n', '', '')
"if hostname == "getafix"
"	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --clangd-completer --rust-completer --go-completer --ts-completer' }
"endif

" Languages
"Plug 'sheerun/vim-polyglot'
"Plug 'rust-lang/rust.vim'
Plug 'vim-python/python-syntax'
Plug 'cespare/vim-toml'
Plug 'tikhomirov/vim-glsl'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/html5.vim'

" Add plugins to &runtimepath
call plug#end()


" ======== Plugin settings ======== 
" YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_enable_diagnostic_signs = 0
"let g:ycm_error_symbol = '!'
"let g:ycm_warning_symbol = '~'
"let g:ycm_echo_current_diagnostic = 0

" CoC
inoremap <silent><expr> <c-space> coc#refresh()

" ALE
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_save = 0
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_filetype_changed = 0
"let g:ale_lint_on_insert_leave = 0
"let g:ale_open_list = 0
"
"let g:ale_lint_delay = 100
"
"let g:ale_linters = {'c': ['clangd']}
"
"nnoremap <leader>l :ALELint<CR>

" Jellybeans
let g:jellybeans_overrides = {
			\    'background': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': '151515' },
			\}
let g:jellybeans_use_gui_italics = 0

" Buftabline
let g:buftabline_show = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1


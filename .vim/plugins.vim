"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" Completion
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'Shougo/context_filetype.vim'
"Plugin 'Shougo/vimproc.vim'
" Python
Plugin 'davidhalter/jedi-vim'
" C/C++
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'osyo-manga/vim-marching'
"Plugin 'osyo-manga/vim-reunions'
" Lua
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-lua-ftplugin'

" Linting
Plugin 'scrooloose/syntastic'

" Filetypes
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'fatih/vim-go'

" Utility
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Shougo/vimshell.vim'

"Colorscheme
Plugin 'nanotech/jellybeans.vim'

"Usage
Plugin 'mattn/emmet-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lua autocomplete
let g:lua_complete_omni = 1
let g:lua_check_syntax = 0

" YouCompleteMe
let g:ycm_error_symbol = '!!'
let g:ycm_warning_symbol = '<>'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers = {'rust' : ['::', '.']}

" Syntastic
let g:syntastic_error_symbol = "!!"
let g:syntastic_style_error_symbol = "!!"
let g:syntastic_warning_symbol = "<>"
let g:syntastic_style_warning_symbol = "<>"

" Go
let g:go_fmt_fail_silently = 1

" C++
"let g:clang_complete_macros = 1

" Vim Marching
let g:marching_include_paths = filter(
	\	split(glob('/usr/include/c++/*'), '\n') +
	\	split(glob('/usr/include/*/c++/*'), '\n') +
	\	split(glob('/usr/include/*/'), '\n'),
	\	'isdirectory(v:val)')
let g:marching_enable_neocomplete = 1

" Neocomplete
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#min_keyword_length = 2
"let g:neocomplete#enable_camel_case = 1
"let g:neocomplete#use_vimproc = 1
"if !exists('g:neocomplete#sources#omni#input_patterns')
"	let g:neocomplete#sources#omni#input_patterns = {}
"endif

"autocmd FileType lua NeoCompleteLock

" Syntastic
let g:syntastic_cpp_compiler_options =  '-std=c++11 -stdlib=libc++ -Werror -pedantic -pedantic-errors -g -Wextra -Wall -pipe'

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"	return neocomplete#close_popup() . "\<CR>"
"endfunction

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

if has("gui_running")
	inoremap <C-Space> <C-X><C-O>
else
	inoremap <Nul> <C-X><C-O>
endif

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ======== General mappings ========

" Map leader to the spacebar
map <Space> <leader>

" Quick saving
nmap <leader>w :w!<cr>	

" Semicolon also opens command bar
nnoremap ; :

" ======== Movement mappings ======== 
" Treat wrapped lines as seperate lines
map j gj
map k gk

" ======== Window mappings ========
" Movement between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Open split windows
nnoremap <leader><Bar> <C-W>v
nnoremap <leader>- <C-W>s
nnoremap <leader>q <C-W>q

" Resize windows
nnoremap <leader>w+ <C-W>+
nnoremap <leader>w- <C-W>-
nnoremap <leader>w> <C-W>>
nnoremap <leader>w< <C-W><

" ======== Buffer mappings ========
map <leader>bd :bd<cr>	" Close the current buffer

" Moving through buffers
noremap <Right> :bn<CR>
noremap <Left> :bp<CR>

" ======== Completion mappings ======== 
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" ======== Netrw mappings ========
map <leader>t :15Lexplore<CR>


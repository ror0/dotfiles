" Vim support file to detect file types

if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	" au! commands to set the filetype go here
	au BufRead,BufNewFile *.md				setf markdown
	au BufRead,BufNewFile *[tT][oO][dD][oO]			setf todo
	au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl	setf glsl 
	au BufNewFile,BufRead .tmux.conf*,tmux.conf*		setf tmux
	au! BufRead,BufNewFile Jamroot		setfiletype jam


augroup END

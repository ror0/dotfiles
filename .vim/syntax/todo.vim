" Vim syntax file
" Language:	generic TODO file
" Maintainer:	stykr <stykrrr@gmail.com>
" Last Change:	2013-08-15

if exists("b:current_syntax")
	finish
endif

" Text
syn match	todoText	'^\s.*$' contains=todoNumber,todoComment,todoHighPri,todoMedPri,todoLowPri,todoNoPri,todoDone,todoUrgent,todoBegun,todoAbandoned

" Header
syn match	todoHeader	'^\S.*$' contains=todoNumber,todoComment 

" Bullets
syn match	todoHighPri	contained '^\s\++\s'
syn match	todoMedPri	contained '^\s\+o\s'
syn match	todoLowPri	contained '^\s\+-\s'
syn match	todoNoPri	contained '^\s\+\*\s'

" Status
syn match	todoBegun	contained 'b[;:].*$' contains=todoNumber
syn match	todoDone	contained 'd[;:].*$'
syn match	todoAbandoned	contained 'a[;:].*$'

" Numbers
syn match	todoNumber	contained '[.-]*\d\+'

" Comments
syn region	todoComment	contained start='\[' end='\]'

hi def link todoHeader		Statement
hi def link todoHighPri		Constant
hi def link todoMedPri		Type
hi def link todoLowPri		PreProc
hi def link todoNoPri		Special
hi def link todoComment		Comment
hi def link todoDone		Delimiter
hi def link todoBegun		Identifier
hi def link todoAbandoned	Comment
hi def link todoNumber		Number
"hi def link todo

let b:current_syntax = "todo"

" Highlight Class and Function names
syn match	cCustomParen	"(" contains=cParen contains=cCppParen
syn match	cCustomFunc	"\w\+\s*(\@=" contains=cCustomParen

syn match	cCustomDot	"\."
syn match	cCustomArrow	"->"

hi def link cCustomDot Special
hi def link cCustomArrow Special
hi def link cCustomFunc  Function

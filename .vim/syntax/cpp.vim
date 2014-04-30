syn match	cCustomScope	"::"
syn match	cCustomName	"\l\w*\s*::" contains=cCustomScope
syn match	cCustomType	"\l\w*\s*::\l\w*\s*[^(]\@=" contains=cCustomScope,cCustomName,cCustomParen,cCustomFunc
syn match	cCustomClass1	"\u\w*\s*::" contains=cCustomScope
syn match	cCustomClass2	"\l\w*\s*::\s*\u\w*\s*" contains=cCustomScope,cCustomName

hi def link cCustomClass1 Special
hi def link cCustomClass2 Special
hi def link cCustomName Constant
hi def link cCustomType Type

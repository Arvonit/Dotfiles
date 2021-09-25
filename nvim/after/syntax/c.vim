syn match cOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match cOperator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match cOperator	"[.!~*&%<>^|=+-]"
syn match cOperator	"/[^/*=]"me=e-1
syn match cOperator	"/$"
syn match cOperator "&&\|||"

" #define BLAH
hi link cDefine Include
" for, while, do
hi link cRepeat Keyword
" return, continue, break
hi link cStatement Keyword
" +, =, ==, ||
hi! link cOperator Operator
" \n, \0, \t
hi link cSpecial Special
hi link cSpecialCharacter Special

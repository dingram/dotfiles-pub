" Vim syntax file
" Language:	DBFS
" Maintainer:	Dave Ingram <dave.dbfs@partis-project.net>
" Last Change:	2006 Jun 07

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn region	dbfsString	start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syn region	dbfsString	start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline
syn match	dbfsParent	"[({[\]})]"	contained
syn match	dbfsIdentifierSimple	"[$#~]{\w[-a-zA-Z0-9_.]*}"	contains=dbfsParent

syn match dbfsOperator "=|\|==\|===\|!=\|!==\|>=\|<=\|&&\|||"
syn match dbfsOperator "[><!&|^.]"
syn match dbfsArithOp  "[-+*/^%]" contained
syn match dbfsArithFunc "\(sin\|cos\|tan\|sqrt\|log\|int\)("he=e-1
syn match dbfsArithFunc "\(e\|pi\)()"
syn region dbfsArith start=+((+ end=+))+ contains=dbfsArithOp,dbfsArithFunc,dbfsIdentifierSimple

syn match	dbfsKeyword	"!\(NAME\|CRITERIA\)"
syn match	dbfsFunction "[?$](\|)"
syn match	dbfsList     "[?$]\[\|\]"
syn match	dbfsChar     "\\."
syn match	dbfsPathSep  "/"

syn match	dbfsBoolean "true\|false"

syn keyword	dbfsTodo	contained TODO FIXME XXX HACK HELP
syn region  dbfsComment		 start="/\*"  end="\*/" contains=@dbfsCommentSpecial,dbfsTodo
syn match   dbfsCommentStar      contained "^\s*\*[^/]"me=e-1
syn match   dbfsCommentStar      contained "^\s*\*$"
syn match   dbfsLineComment      "//.*" contains=@dbfsCommentSpecial2,dbfsTodo

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link dbfsComment	   Comment
hi def link dbfsCommentStar	   Comment
hi def link dbfsLineComment	   Comment

hi def link dbfsTodo	   Todo
hi def link dbfsString	   String

hi def link dbfsKeyword    Keyword
hi def link dbfsOperator   Operator
hi def link dbfsFunction   Function
hi def link dbfsParent     Delimiter
hi def link dbfsIdentifierSimple   Identifier
hi def link dbfsList       Operator
hi def link dbfsBoolean    Boolean
hi def link dbfsChar       Character

hi def link dbfsArithOp    Operator
hi def link dbfsArithFunc  Function
hi def link dbfsPathSep    Delimiter

let b:current_syntax = "dbfs"

" vim: ts=8 sw=2

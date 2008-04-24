" Vim syntax file
" Language: DeepWeaver
" Maintainer: David Ingram <dmi04@doc.ic.ac.uk>
" Last Change: 2006 Jul 06
"
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" source the java.vim file
syn include @dwJava syntax/java.vim
unlet b:current_syntax

" remove the javaError for .. in aspectJ
syn clear javaError
syn match ajError "<<<\|=>\|<>\|||=\|&&=\|[^-]->\|\*\/"

syn keyword javaTodo		 contained TODO FIXME XXX
if exists("java_comment_strings")
  syn region  javaCommentString    contained start=+"+ end=+"+ end=+$+ end=+\*/+me=s-1,he=s-1 contains=javaSpecial,javaCommentStar,javaSpecialChar,@Spell
  syn region  javaComment2String   contained start=+"+  end=+$\|"+  contains=javaSpecial,javaSpecialChar,@Spell
  syn match   javaCommentCharacter contained "'\\[^']\{1,6\}'" contains=javaSpecialChar
  syn match   javaCommentCharacter contained "'\\''" contains=javaSpecialChar
  syn match   javaCommentCharacter contained "'[^\\]'"
  syn cluster javaCommentSpecial add=javaCommentString,javaCommentCharacter,javaNumber
  syn cluster javaCommentSpecial2 add=javaComment2String,javaCommentCharacter,javaNumber
endif
syn region  javaComment		 start="/\*"  end="\*/" contains=@javaCommentSpecial,javaTodo,@Spell
syn match   javaCommentStar      contained "^\s*\*[^/]"me=e-1
syn match   javaCommentStar      contained "^\s*\*$"
syn match   javaLineComment      "//.*" contains=@javaCommentSpecial2,javaTodo,@Spell

syn keyword dwKeywords aspect import
syn keyword dwPatterns predicate weave patterncut rewrite interjection
syn keyword dwObsolete patterncut rewrite
syn keyword dwTypes    FreeType InterjectionPrototype DeepWeaverClass Local List Value CodeBlock SootMethod
syn match   dwOperators ":"

syn region dwProlog start=+:+ end=+\.+me=e-1 extend contains=dwProlog,dwPrologString,javaComment,javaLineComment nextgroup=dwJava skipwhite skipempty skipnl
"syn region dwProlog start=+:+ skip=+\.[^	  ]+ end=+\.\s*$+ contains=dwProlog,javaLineComment,javaComment nextgroup=dwJava
syn region dwJava  start=+{+ end=+}+ contains=@dwJava contained keepend extend
syn region dwPrologString start=+"+ end=+"+ skip=+\\"+ contained contains=javaString keepend extend

syn keyword dwplPredicates assignment between call defs encloses eval if local loop member method_body method nl null precedes reaching_def same_value source_location suppose_value_at type within write head containedin=dwProlog contained
syn match   dwplOperators ":\|=\\=\|=:=\|\\==\|=<\|==\|>=\|\\=\|\\+\|<\|>\|=\|,\|;\|\." containedin=dwProlog contained
syn match   dwplOperators "\(^\|\s\)[()]" containedin=dwProlog contained
syn match   dwplOperators "\(^\|[\s,]\)_" containedin=dwProlog contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_deepweaver_syn_inits")
  if version < 508
    let did_deepweaver_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink dwKeywords     Type
  HiLink dwPatterns     Type
  HiLink dwTypes        Type
  HiLink dwProlog       Preproc
  HiLink dwOperators    Operator
  HiLink dwplPredicates Function
  HiLink dwplOperators  Operator
  HiLink dwObsolete     Error

  HiLink ajError Error

  delcommand HiLink
endif

let b:current_syntax = "deepweaver"

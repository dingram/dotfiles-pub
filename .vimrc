"""""""""""""""""""""""""""""""""
" Various settings
"""""""""""""""""""""""""""""""""

set cmdheight=1       " Commandbar height is 1
set expandtab		      " Expand tabs to spaces
set history=400       " How many lines of history to remember
set hlsearch          " Highlight search
set ignorecase        " Ignore case when searching
set incsearch         " Incremental search
set magic             " Allow magic characters in searches or replaces
set mat=2             " Blink for 2/10 sec
"set mouse=a           " Always use mouse
set nobackup		      " No backups!
set nocompatible      " No compatible mode
set noerrorbells      " Quiet on errors
set nonu              " Do not number lines
set novisualbell      " No visual flash
set ruler             " Show ruler
set shell=zsh         " Use bash for my shell
set shiftwidth=2	    " Tabstop = 2 chars (autoindenting)
set shortmess+=I      " No welcome message
set showcmd           " Show partial command in statusbar
set showmatch         " Show matching brackets
set t_vb=             " No visual flash (termcap)
set tabstop=2		      " Tabstop = 2 chars
set textwidth=0		    " Text width = 0 == no autowrapping of text
set wildmenu          " Wildcard menu
set winminheight=0    " No minimum window height
set foldlevel=9999    " Expand folds by default
" Not sure whether it's better to enable/disable the ones I (don't) want.
set guioptions=aegimc " enable autoselect, tabs, grey menu items, icon, menubar, console dialogs
"set spell spelllang=en_gb

" Set backspace
set backspace=eol,start,indent

" grep sometimes doesn't display file names when searching a single file,
" which confuses latex-suite, so let's fix that:
set grepprg=grep\ -nH\ $*

"set mapleader = ","
"set g:mapleader = ","

" format a paragraph
noremap Q mzgqap`z
" expected behaviour
noremap Y y$

"""""""""""""""""""""""""""""""""
" Filetype settings
"""""""""""""""""""""""""""""""""

filetype indent on	" Indent files please
filetype plugin on  " Omnicompletion etc
syntax on

color desert

"""""""""""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""""""""""

iab xdate <c-r>=strftime("%Y-%m-%d")<cr>
iab xtime <c-r>=strftime("%H:%M:%S")<cr>
iab xdatetime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
iab xname Dave Ingram

"""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""

let spell_executable = "aspell"
let spell_root_menu = "-"
let spell_insert_mode = 0
let spell_auto_type = ''
highlight SpellErrors ctermfg=Red

" Highlight space at end of line as error
highlight WhitespaceEOL ctermbg=darkred guibg=Red
match WhitespaceEOL /\s\+$/

"""""""""""""""""""""""""""""""""
" file formats
"""""""""""""""""""""""""""""""""

map <leader>fd :set ff=dos<cr>:w<cr>
map <leader>fu :set ff=unix<cr>:w<cr>

"""""""""""""""""""""""""""""""""
" vimrc editing
"""""""""""""""""""""""""""""""""

" Fast reload of vimrc
map <leader>s :source ~/.vimrc<cr>

" Fast editing of vimrc
map <leader>e :sp ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""
" functions
"""""""""""""""""""""""""""""""""

func! DeleteTrailingWS()
  norm mz
  %s/\s\+$//ge
  norm `z
endfunc

"""""""""""""""""""""""""""""""""
" auto commands
"""""""""""""""""""""""""""""""""

augroup deltrailws

  " Don't redefine these
  autocmd!

  " C programmers suck.
  autocmd BufWrite *.[chC]          :call DeleteTrailingWS()
  autocmd BufWrite *.{cc,hh}        :call DeleteTrailingWS()
  autocmd BufWrite *.[ch]{xx,pp,++} :call DeleteTrailingWS()

  autocmd BufWrite *.pl     :call DeleteTrailingWS()
  autocmd BufWrite *.php    :call DeleteTrailingWS()
  autocmd BufWrite *.java   :call DeleteTrailingWS()
  autocmd BufWrite *.txt    :call DeleteTrailingWS()
  autocmd BufWrite *.tex    :call DeleteTrailingWS()

augroup END

autocmd BufNewFile,BufRead *.thtml :setfiletype php

"""""""""""""""""""""""""""""""
" SVN section
"""""""""""""""""""""""""""""""
map <F8> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg

"""""""""""""""""""""""""""""""""
" automatic Java stuff
"""""""""""""""""""""""""""""""""

" Folding
function! JavaFold()
  setl foldmethod=syntax
  setl foldlevelstart=1
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
  syn match foldImports /\(\n\?import.\+;\n\)\+/ transparent fold

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction
  setl foldtext=FoldText()
endfunction

augroup java-stuff
  au!
  au FileType java call JavaFold()
  au FileType java setl fen
  au FileType java inoremap <buffer> <C-t> System.out.println();<esc>hi

  "Abbrevs
  au FileType java inoremap <buffer> $pr private
  au FileType java inoremap <buffer> $r return
  au FileType java inoremap <buffer> $pu public
  au FileType java inoremap <buffer> $i import
  au FileType java inoremap <buffer> $b boolean
  au FileType java inoremap <buffer> $v void
  au FileType java inoremap <buffer> $s String
augroup END


"""""""""""""""""""""""""""""""""
" automatic JS stuff
"""""""""""""""""""""""""""""""""

function! JavaScriptFold()
  setl foldmethod=syntax
  setl foldlevelstart=1
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction
  setl foldtext=FoldText()
endfunction

augroup javascript-stuff
  au!
  au FileType javascript call JavaScriptFold()
  au FileType javascript setl fen

  au FileType javascript imap <c-t> console.log();<esc>hi
  au FileType javascript imap <c-a> alert();<esc>hi
  au FileType javascript setl nocindent
  au FileType javascript inoremap <buffer> $r return

  au FileType javascript inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space>
  au FileType javascript inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka
augroup END

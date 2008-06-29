""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filename:     .vimrc
" Description:  Custom vim (and gvim) configuration)
" Author:       Dave Ingram
" Coauthor:     Nick Pope
" Last Updated: 2008-04-24 14:21:43
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " do not use compatibility mode (must be 1st)
set backspace=indent,eol,start " configure backspace behaviour
set cmdheight=1                " Commandbar height is 1
set expandtab		               " Expand tabs to spaces
set foldlevel=9999             " Expand folds by default
set history=500                " How many lines of history to remember
set hlsearch                   " Highlight search
set ignorecase                 " Ignore case when searching
set incsearch                  " Incremental search
set linebreak                  " Break at word boundaries
set magic                      " Allow magic characters in searches or replaces
set mat=2                      " Matching parens should blink for 2/10 sec
"set mouse=a                    " Always use mouse
set nobackup		               " No backups!
set noerrorbells               " Quiet on errors
set nonumber                   " Do not number lines
set novisualbell               " No visual flash
set ruler                      " Show ruler
set shiftwidth=2	             " Tabstop = 2 chars (autoindenting)
set shortmess+=I               " No welcome message
set showcmd                    " Show partial command in statusbar
set showmatch                  " Show matching brackets
set t_vb=                      " No visual flash (termcap)
set tabstop=2		               " Tabstop = 2 chars
set textwidth=0		             " Text width = 0 == no autowrapping of text
set wildmenu                   " Wildcard menu
set winminheight=0             " No minimum window height
set guioptions=aegimc          " enable autoselect, tabs, grey menu items,
                               "   icon, menubar, and console dialogs

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OS-Specific Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32') || has('win64')
  " Windows-specific options
  set guifont=Courier\ New:h10 " set a respectable looking font
  set shellslash               " required for latex-suite
else " Assume Linux-specific options
  " grep sometimes doesn't display file names when searching a single file,
  " which confuses latex-suite, so let's fix that:
  set grepprg=grep\ -nH\ $*
  set shell=zsh
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colour scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  colorscheme desert
else
  colorscheme delek " or elflord?
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent plugin on	" Indent files please, with omnicompletion
syntax on
" file formats
map <silent> <leader>fd :set fileformat=dos<cr>:w<cr>
map <silent> <leader>fm :set fileformat=mac<cr>:w<cr>
map <silent> <leader>fu :set fileformat=unix<cr>:w<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let spell_executable="aspell"
let spell_root_menu="-"
let spell_insert_mode=0
let spell_auto_type=''
highlight SpellErrors ctermfg=Red
map <silent> <F10> :setlocal spell! spelllang=en_gb<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight space at end of line as error
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight WhitespaceEOL ctermbg=DarkRed guibg=Red
match WhitespaceEOL /\s\+$/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32') || has('win64')
  " Fast reload of vimrc
  map <silent> <leader>vs :source ~/_vimrc<cr>
  " Fast editing of vimrc
  map <silent> <leader>ve :sp ~/_vimrc<cr>
  " When vimrc is edited, reload it
  autocmd! bufwritepost _vimrc source ~/_vimrc
else
  " Fast reload of vimrc
  map <silent> <leader>vs :source ~/.vimrc<cr>
  " Fast editing of vimrc
  map <silent> <leader>ve :sp ~/.vimrc<cr>
  " When vimrc is edited, reload it
  autocmd! bufwritepost .vimrc source ~/.vimrc
endif

"*****************************************************************************
" Vim Sessions
"*****************************************************************************
" ignore 'options' because of latex-suite (would be pointless to save that!)
set sessionoptions=blank,curdir,folds,help,resize,tabpages,winsize
if has('win32') || has('win64')
  set sessionoptions+=slash,unix
  map <leader>ss :mksession! ~/_vimsession<cr>
  map <leader>sr :source ~/_vimsession<cr>
else
  map <leader>ss :mksession! ~/.vim/.session<cr>
  map <leader>sr :source ~/.vim/.session<cr>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTrailingWS()
  norm mz
  %s/\s\+$//ge
  norm `z
endfunc

map <silent> <leader>ds :call DeleteTrailingWS()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup deltrailws
  " Remove existing commands in group if defined
  autocmd!
  autocmd BufWrite *.[chC]          :call DeleteTrailingWS()
  autocmd BufWrite *.{cc,hh}        :call DeleteTrailingWS()
  autocmd BufWrite *.[ch]{xx,pp,++} :call DeleteTrailingWS()
  autocmd BufWrite *.{pl,php,java}  :call DeleteTrailingWS()
  autocmd BufWrite *.txt            :call DeleteTrailingWS()
  autocmd BufWrite *.{cls,sty,tex}  :call DeleteTrailingWS()
augroup end
augroup fixfiletype
  autocmd!
  autocmd BufNewFile,BufRead *.thtml            :set filetype=php
  autocmd BufRead            /var/log/messages* :set filetype=messages
augroup end
augroup qmv
  autocmd!
  autocmd BufRead /tmp/qmv* :set ts=8
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Subversion helper
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !(has('win32') || has('win64'))
  map <F8> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
endif

"*****************************************************************************
" HTML Formatting Commands
"*****************************************************************************
" strip tags
map <silent> <leader>h! mz:%s#<\_.\{-}>##g<cr>:%s#&nbsp;# #g<cr>`z

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting/movement commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" format current paragraph and keep cursor in current position
noremap <silent> Q mzgqap`z
" copy to end of line
noremap Y y$
" remove search highlight
map <silent> <leader>hh :let @/=''<cr>

"*****************************************************************************
" Automatic Java Commands - TODO: move to ftplugin
"*****************************************************************************
" Functions
function! JavaFold()
  syn region fold_braces start=/{/ end=/}/ transparent fold keepend extend
  syn region fold_javadoc start=+/\*\*+ end=+\*/+ transparent fold keepend extend
  syn match  fold_imports /\n\%(import[^;]\+;\n\)\+/ transparent fold
  function! JavaFoldText()
    let header = substitute(getline(v:foldstart), '{.*', '{...}', '')
    return matchstr(foldtext(), '^[^:]*') . ': ' . header
  endfunction
  setl foldlevelstart=1
  setl foldmethod=syntax
  setl foldtext=JavaFoldText()
endfunction

" Autocommand group
augroup java_au
  au!
  " folding
  au FileType java call JavaFold()
  au FileType java setl fen
  " macros
  au FileType java inoremap <buffer> <C-t> System.out.println();<esc>hi
  " abbreviations
  au FileType java inoremap <buffer> $b boolean
  au FileType java inoremap <buffer> $i import
  au FileType java inoremap <buffer> $pa private
  au FileType java inoremap <buffer> $pr private
  au FileType java inoremap <buffer> $pu public
  au FileType java inoremap <buffer> $r return
  au FileType java inoremap <buffer> $s String
  au FileType java inoremap <buffer> $v void
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic JavaScript Commands - TODO: move to ftplugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! JavaScriptFold()
  syn region fold_braces start=/{/ end=/}/ transparent fold keepend extend
  function! JavascriptFoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction
  setl foldlevelstart=1
  setl foldmethod=syntax
  setl foldtext=JavascriptFoldText()
endfunction

augroup javascript_au
  au!
  " folding
  au FileType javascript call JavaScriptFold()
  au FileType javascript setl fen
  " macros
  au FileType javascript imap <c-t> console.log();<esc>hi
  au FileType javascript imap <c-a> alert();<esc>hi
  " abbreviations
  au FileType javascript inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka
  au FileType javascript inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space>
  au FileType javascript inoremap <buffer> $r return
  " options
  au FileType javascript setl nocindent
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%Y-%m-%d")<cr>
iab xtime <c-r>=strftime("%H:%M:%S")<cr>
iab xdatetime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
iab xlongdate <c-r>=strftime('%A, %e %B %Y')<cr>
iab xname Dave Ingram
iab xcorp Imperial College London
iab xdept Department of Computing

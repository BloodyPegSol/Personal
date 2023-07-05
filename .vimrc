" Enter the current millenium
"set noncompatible

"**************************************************************************
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

"Display all matching filds when we press tab
set wildmenu

" Tweaks for browsing using NETRW
let g:netrw_browse_split=4 	"Open in prior windows
let g:netrw_altv=1		"Open splits to the right
let g:netrw_lsitstyle=3		"Tree view
let g:netrw_list_hide=netrw_gitignore#Hide()		


"**************************************************************************

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"PDF OUTPUT DEFAULT"

filetype plugin on
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='zathura'
let g:Tex_CompileRule_pdf='pdflatex'

"Setting enumerated rows"
set number

"***********************************************************************
"Vim NETRW configurations

"Set window siz of vertical split and orientation
let g:netrw_winsize= 0		" Set default windows size to be always equal
let g:netrw_preview= 1		" Open splits to the right

"Change the netrw style for directories
"let g:netrw_liststyle= 0	" Default view (directory name/file name)
"let g:netrw_liststyle= 1	" Show time and size
"let g:netrw_liststyle= 2	" Shows listing in 2 columns
let g:netrw_liststyle= 3	" Shows the tree listing


"************************************************************************"
"FUNCTIONS"

function! LE(...)
    let l:line = line('.')
    if (a:0 == 2)   
    	let l:text = ["\\begin{".a:1."}{".a:2."}<++>","\\end{".a:1."}"]
    else
    	let l:text = ["\\begin{".a:1."}<++>","\\end{".a:1."}"]
    endif
    call append(l:line, l:text)
endfunction
   
function! Le(...)
    let l:line = line('.')
    if (a:0 == 2)
    	let l:text = ["\\begin{".a:1."}{".a:2."}<++>\\end{".a:1."}"]
    else
    	let l:text = ["\\begin{".a:1."}<++>\\end{".a:1."}"]
    endif
    call append(l:line, l:text)
    normal! gJ
endfunction
"************************************************************************"
"COMMANDS"

command! -nargs=*  LE :call LE(<f-args>)
command! -nargs=*  Le :call Le(<f-args>)
command! -nargs=+  Cfun :call append(line('^'),["<args>()","{","<++>","}"])
command! MakeTags !ctags -R .
"************************************************************************"
"MAPS FOR BASIC_MATH.TEX TEMPLATE"


"IMAPS"
"Environment related"

"PDF compiling"
:imap \ll <ESC>:w<CR>\ll<CR>

"Font related"


"NMAPS"
"ENVIRONMENT RELATED"


"PDF compiling"



"NOREMAP"
" Go to tab by number of buffer

:noremap ,1 1gt
:noremap ,2 2gt
:noremap ,3 3gt
:noremap ,4 4gt

" Jump between windows in split mode
:nnoremap ,v :vsplit<cr>
:inoremap ,v <ESC>:vsplit<cr>
:nnoremap ,w :wincmd w<cr>
:inoremap ,w <ESC>:wincmd w<cr>

" SNIPPETS:
" EXAMPLES:
"nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf<a
"************************************************************************"
"SYNTAX"
syntax on


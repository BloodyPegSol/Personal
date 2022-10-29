filetype plugin on

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

function! LE(environment)
    let l:line = line('.')
    let l:text = ["\\begin{".a:environment."}<++>","\\end{".a:environment."}"]
    call append(l:line, l:text)
endfunction
   
function! Le(environment)
    let l:line = line('.')
    let l:text = ["\\begin{".a:environment."}<++>\\end{".a:environment."}"]
    call append(l:line, l:text)
    normal! gJ
endfunction
"************************************************************************"
"COMMANDS"

command! -nargs=1  LE :call LE(<q-args>)
command! -nargs=1  Le :call Le(<q-args>)
"************************************************************************"
"MAPS FOR BASIC_MATH.TEX TEMPLATE"


"IMPAS"
"Environment related"

"PDF compiling"
:imap \ll <ESC>:w<CR>\ll<CR>

"Font related"


"NMAPS"
"ENVIRONMENT RELATED"
:nmap bp' \begin{problem}<CR> <CR>\end{problem}
:nmap btf' \begin{figure}<CR>\begin{tikzpicture}<CR><CR>\end{tikzpicture}<C    R>\centering<CR>\caption{<++>}<CR>\label{<++>}<CR>\end{figure}<++>
"PDF compiling"


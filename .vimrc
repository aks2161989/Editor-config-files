" Allow netrw to remove non-empty local directories
"
let g:netrw_localrmdir='rm -r'

" Activates filetype detection
filetype plugin on

" Set word wrap on
set wrap

" Activates syntax highlighting among other things
syntax on

" Set font used in GVIM
set guifont=Lucida_Console:h14:cANSI:qDRAFT

set backspace=indent,eol,start

" Turn on auto indent
filetype indent on

" Macro to select entire buffer and copy it to clipboard
nnoremap <F5> :%y+<CR>
" Macro code to copy ENDS HERE

" Macro to paste from clipboard
nnoremap <F6> "+gP
" Macro code to paste ENDS HERE



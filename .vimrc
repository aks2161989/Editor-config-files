" Code to autocomplete ( [ < " ' { 
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap { {}<ESC>i
"inoremap { {<CR>}<Esc>O<TAB> " Puts a blank line between two curly braces and
"puts cursor on it in insert mode
" Autocomplete ( [ < " ' { code ends here

" Function to delete closing ( [ < " ' { when an opening tag is deleted
function! DeleteClosingTag()
	if @- == '(' && getline(".")[col(".")-1] == ')'
		call feedkeys("x") " when last character is deleted in visual mode
	endif
	if @- == '[' && getline(".")[col(".")-1] == ']'
		call feedkeys("x") " when last character is deleted in visual mode
	endif
	if @- == '<' && getline(".")[col(".")-1] == '>'
		call feedkeys("x") " when last character is deleted in visual mode
	endif
	if @- == '"' && getline(".")[col(".")-1] == '"'
		call feedkeys("x") " when last character is deleted in visual mode
	endif
	if @- == '''' && getline(".")[col(".")-1] == ''''
		call feedkeys("x") " when last character is deleted in visual mode
	endif
	if @- == '{' && getline(".")[col(".")-1] == '}'
		call feedkeys("x") " when last character is deleted in visual mode
	endif
endfunction
" Function to delete closing tags ends here

" Remap x to do the action of x (delete character) and then call DeleteClosingTag()
nnoremap x x:call DeleteClosingTag()<CR>

"augroup MyGroup
""	autocmd!
""	autocmd textChanged * call DeleteClosingTag()
""augroup end

" Function to automatically toggle comments (on visual selection)
" Uncommenting works ONLY if the comments begin from the first character of
" the line
function! ToggleComments()
	let cFamilyTypes = ['c', 'cpp', 'cc', 'cxx', 'cs', 'java']
	let commentString = ""
	let commentChar = ''
	let counter = 0 " Indicates if the line was commented, so don't comment again
	if index(cFamilyTypes, &filetype) != -1
		let commentString = "//"
		let commentChar = '/'
	endif
	if &filetype == 'vim'
		let commentString = "\""
		let commentChar = '"'
	endif

	" Check if comments exist at the beginning of the current line and
	" delete them
	execute "normal! 0"
	while getline(".")[col(".")-1] == commentChar || getline(".")[col(".")-1] == ' '  || getline(".")[col(".")-1] == '\t'     
		if getline(".")[col(".")-1] == commentChar
			execute "normal! x"	
			let counter += 1
			continue
		endif
		execute "normal! l" 
	endwhile
" Code to check and delete existing comments ends here

" If counter was not incremented, the line is uncommented. So add
" comments
if counter == 0
	execute "normal! 0"
	execute "normal! i" . commentString . "\<ESC>"
	let counter = 0
endif
" Code to add comments ends here
endfunction
" Function to automatically toggle comments ends here

" Function to automatically uncomment selected lines (Provided comments begin
" from the first character of the line)
" Below function is not needed as ToggleComments() can both, comment and uncomment
" Hence this function is commented out.
"function! UncommentSelection()
"	let cFamilyTypes = ['c', 'cpp', 'cc', 'cxx', 'cs', 'java']
"	let numberOfDeletions = 0
"	if index(cFamilyTypes, &filetype) != -1
"		let numberOfDeletions = 2 " C-family languages have 2-character comments
"	endif
"	if &filetype == 'vim'
"		let numberOfDeletions = 1 " Vimscript has 1-character comments
"	endif
"	execute "normal! 0"	
"	let temp = 0
"	while temp < numberOfDeletions
"		execute "normal! x"	
"		let temp += 1
"	endwhile
"endfunction
" Function to automatically uncomment selected lines ends here

" Allow netrw to remove non-empty local directories
"
let g:netrw_localrmdir='rm -r'

" Show line numbers
set number

" Activates filetype detection
filetype plugin on

" Set word wrap on
set wrap
set textwidth=0
set linebreak

" Activates syntax highlighting among other things
syntax on

" Set font used in GVIM
set guifont=Consolas:h15:b:cANSI:qDRAFT

set backspace=indent,eol,start

" Turn on auto indent
filetype indent on

" Macro to select entire buffer and copy it to clipboard
nnoremap <F5> :%y+<CR>
" Macro code to copy ENDS HERE

" Macro to copy selected text (in visual mode) to clipboard
vnoremap <F5> "+y<CR>
" Macro to copy selected text ENDS HERE

" Macro to paste from clipboard
nnoremap <F6> "+gP
" Macro code to paste ENDS HERE

" Specify a directory for plugins to be installed by vim-plug
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'OmniSharp/omnisharp-vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'SirVer/ultisnips' " Track the engine.
Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them: 
" Initialize plugin system
Plug 'dense-analysis/ale'
call plug#end()

" Use the stdio version of OmniSharp-roslyn
let g:OmniSharp_server_stdio = 1

" Limit ALE plugin to only use OmniSharp, not other linters
let g:ale_linters = {
			\ 'cs': ['OmniSharp']
			\}

" Ultisnips-specific settings here
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Ultisnips-specific settings end here

"F8 key will toggle the Tagbar window
nmap <F8> :TagbarToggle<CR>

" Always display the status line
set laststatus=2

" Display the line number in the status line
set ruler

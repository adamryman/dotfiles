set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"So this command switches for youcompleteme to eclim, but it seems to fail, so
"I added a function to set it again if it does fail
set completefunc=eclim#java#complete#CodeComplete
function! SetEclim()
	set completefunc=eclim#java#complete#CodeComplete
endfunction

"function! EclimAutocomplete()
"	call SetEclim()
"	normal a<c-x><c-u>
"endfunction

"Autocomplete with leader.
map <leader>. :call SetEclim()<enter>a<c-x><c-u>


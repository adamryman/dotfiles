"Spell checking
setlocal spell spelllang=en_us

function! RenderMarkdown()
	silent call system('mkdir -p ./.render/')

	let rendercmd='pandoc ' . expand('%') . ' -H $HOME/dotfiles/css/github-pandoc.css -t html > ./.render/' . expand('%') . '.html'
	echo rendercmd
	call system(rendercmd)
endfunction

function! OpenInFirefox()
	let opencmd='firefox ./.render/' . expand('%') . '.html'
	call system(opencmd)
endfunction

command! Render call RenderMarkdown()
"command! Open call OpenInFirefox()

" For opening the render in firefox and rerendering it
map <leader><leader>j :call RenderMarkdown()<enter>
map <leader><leader>f :call OpenInFirefox()<enter>

" Allows me to align pandoc pipe tables using Tabularize
"map <leader><leader>t :Tab /\|<enter>

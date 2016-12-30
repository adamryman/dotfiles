
if $DOTFILES_vundle == '1'
" Vundle {{{ ----------------------------------------------------------------
" ----------------------------------------------------------------------------
"### Configure Vundle ###
" ----------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Need to add comments for each of these
if $DOTFILES_youcompleteme == '1'
Plugin 'Valloric/YouCompleteMe'
endif

Plugin 'fatih/vim-go'

Plugin 'tpope/vim-fugitive'

Plugin 'sickill/vim-monokai'

Plugin 'mattn/emmet-vim'

Plugin 'godlygeek/tabular'

Plugin 'tpope/vim-surround'

" Auto-pairing "" {} () [] ''
Plugin 'Raimondi/delimitMate'
"Plugin 'jiangmiao/auto-pairs'

"Silly
Plugin 'natw/keyboard_cat.vim'

" Commenting made easy!
Plugin 'scrooloose/nerdcommenter'

" Makes vim look nice and show your mode better and git things
Plugin 'vim-airline/vim-airline'

" Get link to github line number for code
Plugin 'tonchis/vim-to-github'

" Tagbar, for golang
Plugin 'majutsushi/tagbar'

Plugin 'vimwiki/vimwiki'

" Can use with ag
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" ----------------------------------------------------------------------------
"### End Configure Vundle ###
" ----------------------------------------------------------------------------
" }}}
" Vundler Plugin Configs {{{ ----------------------------------------------


" airline with powerline fonts, must be installed
" https://github.com/vim-airline/vim-airline
let g:airline_powerline_fonts = 1
" vim-airline only started when creating a split, this fixes it
set laststatus=2
" Get rid of pause when leaving insert mode
set ttimeoutlen=10

" gotags tagbar
" https://github.com/jstemmer/gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" {<CR>}
" =
" {
"   |
" }
let g:delimitMate_expand_cr=1

"Remove ycm preview
set completeopt -=preview

" Awk Ag settings
" LAg uses the location list
"let g:ag_highlight=1
if executable('ag')
	let g:ackprg = 'ag --vimgrep --smart-case'
endif
let g:ackhighlight = 1
"g:ackpreview = 1

" use Ag instead of Ack when typing
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" }}}
endif

" Fold on opening for organization
" vim:foldmethod=marker:foldlevel=0

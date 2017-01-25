
" Be vim instead of vi
set nocompatible

" Use .vim/ftplugins for vim filetupe config
filetype plugin indent on

if $DOTFILES_vundle == '1'
	source $HOME/.vim/vundle-conf.vim
endif

" Line {{{ ----------------------------------------------------------------
" Show lines numbers that are  relative to the cursor position
" Show the actual line number on the current line

set relativenumber
set number

" }}}
" Colors {{{ --------------------------------------------------------------

syntax on
colorscheme monokai
"colorscheme simple

" }}}
" Search {{{ --------------------------------------------------------------

" Highlight matching search terms
set hlsearch
" Set search register to empty string, clearing search
nmap <leader><leader><CR> :let @/ = ""<Return>

" }}}
" Code specific {{{ --------------------------------------------------------------

"shows matching ({[]})
set showmatch

" }}}
" Windowing {{{ -----------------------------------------------------------

" Keybinding hotkeys for switching windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Change how splits work
set splitbelow
set splitright

" }}}

" General Personal {{{ -------------------------------------------------
" Lets me see those tabs and spaces
set listchars=tab:>\ ,space:#,trail:‽

" Line breaks look like this
set linebreak
set showbreak=->\ \

" Allows case insensitive searching with smart exceptions
set ignorecase
set smartcase

" Common mistakes now fixed
command! W w
command! Q q
command! WQ wq
command! Wq wq

" letting me see the string of commands
set showcmd

" 4 space tabs are nicer by default
set tabstop=4
set shiftwidth=4

" Increamental search highlighting
set incsearch

" By default backspace does not remove auto-indenting (indent),
" end of line characters (eol),
" or text created before entering inset mode (start).
" This command makes backspace behave like most editors in insert mode
set backspace=indent,eol,start

" Turn Shift-Tab into Ctrl-P, like Tab is Ctrl-N
noremap <S-Tab> <C-P>

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" .gv files are graphviz files, they will be rendered using dot
autocmd BufNewFile,BufRead *.gv set filetype=graphviz

" }}}
" Leader {{{ --------------------------------------------------------------
" change my leader to space, using map allows me to see it with a \ in the
" Also space space to leader leader for DOUBLE COMMANDS
" showcmd space
map <space> <leader>
map <space><space> <leader><leader>

let maplocalleader = ","

" Quick quit and write
map <leader>q :q<CR>
map <leader>w :w<CR>

" Lets see how fast I can add stuff to my vimrc
map <leader>v :sp $HOME/.vimrc<CR>G

" Resource current vimrc and current ftplugin
" ReSource function {{{ --------------------------------------------------------------
" Don't resource this function while it is being used, redefining.
if !exists("*ReSource")
	function! ReSource()
		execute "source $HOME/.vimrc"
		" Sources the current filetype file again
		execute "set filetype=" . &filetype
	endfunction
endif
" }}}
map <leader>s :call ReSource()<CR>

" Allows me to edit the config of any filetype quickly
" OpenFtpluginFile function {{{ --------------------------------------------------------------
function! OpenFtpluginFile()
	execute ":sp $HOME/.vim/ftplugin/" . &filetype . ".vim"
endfunction
" }}}
map <leader>f :call OpenFtpluginFile()<CR>

" Show whitespace characters
map <leader>t :set list!<CR>

" Personal help file currently located at $HOME/.vim.helpfiles/new-commands.md
" Eventually learn how vim docs work and put it there
map <leader>h :sp $HOME/.vim/helpfiles/new-commands.md<CR>zRG

" I want faster macros
" So leader 1 will start recording a macro on key 2
" and leader 2 will play that back
map <leader>2 @2
map <leader>1 q2

" Do a string replacement of current visual selection
map <leader>/ yq:i%s/<ESC>pa/

" sudo save
" http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
map <leader>! :w !sudo tee %<CR>

" Make a bold line to see where cursor is
map <leader>g :set cursorline!<CR>:set cursorcolumn!<CR>

" Toggle spelling for checking comments and such
map <leader>l :set spell! spelllang=en_us<CR>

" Clear search
map <leader><leader><enter> :let @/ = ""<CR>

" Yank current file path to x clipboard
map <leader><leader>y :let @+ = expand("%:p")<CR>

" Call xclip to put yank buffer into system clipboard, yank first if in visual
" mode
nmap <leader>y :silent call system('xclip -selection c -in', @0)<CR>
vmap <leader>y y:silent call system('xclip -selection c -in', @0)<CR>

" Quick system buffer put / clipboard put
map <leader>p "+p

" Setting default yank to also go to the + register, which is the system
" clipboard. Not sure why clipboard=unnamed does not work (which would be the
" * register)
" This allows for yy to go to the clipboard, which is what I want for now. the
" whole <leader>' was getting pretty annoying to be honest
"set clipboard=unnamedplus

" Ag search
map <leader>n :LAg<Space>

" Comment code!
map <leader>cd <plug>NERDCommenterToggle

" Create bars of dashes from the last charater on a line to
" the "&textwidth" as set by the user. Used to make plaintext seperations of
" sections like in this file
" Currently not working
map <leader>- :silent 'execute "set virtualedit=block" <bar> exec "normal A\ \<ESC>\<C-V>80<bar>r-" <bar> exec "set virtualedit=\"\""<CR>'

" Remove trailing whitespace
map <leader><BS> :%s/\s\+$//e<CR>

" Open a new file with the full directory path
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Crazy
" git checkout HEAD file, but on a visual selection
" Currently not working as a leader command, but will work for copy + paste
"vnoremap <leader>c :g/./silent execute ".!true && git blame -p -L" . line(".") . "," . line(".") . " HEAD -- % <bar> tail -1 <bar> cut -c 2-" <bar> let @/ = ""<CR>
" }}}
" truss {{{ ----------------------------------------------
" Set .gotemplate to go file for syntax, but let it fail as it is a template
au BufNewFile,BufRead *.gotemplate set filetype=go
au BufNewFile,BufRead *.gotemplate let g:go_fmt_fail_silently = 1
" }}}
" nvim {{{ ----------------------------------------------
if $DOTFILES_nvim == '1'
" Press escape twice quicky to get into nvim normal mode
" press escape once to get into bash set -o vi normal mode
tnoremap <Esc><Esc> <C-\><C-n>
let g:terminal_scrollback_buffer_size = 2147483647

" Only typed actions casue redraw
set lazyredraw
endif " }}}
"
" Fold on opening for organization
" vim:foldmethod=marker:foldlevel=0

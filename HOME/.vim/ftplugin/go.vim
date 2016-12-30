" Build go files quickly
map <leader>b :w<Return>:GoBuild<Return>

" Run test
map <leader><leader>b :w<Return>:GoTest<Return>

" Lets get those imports
map <leader>i :GoImports<Return>

" Go def and return
map <leader><Return> :GoDef<Return>
map <leader>\ <c-t>

" Go to next error in quickfix message
map <leader>j :cn<Return>
map <leader>k :cp<Return>

" Run!
map <leader>a :GoRun<Return>

" Stop goformat for templating
map <leader><leader>f :let g:go_fmt_fail_silently = 1<Return>

" Open godef in vertical or horizontal split
nmap <Leader>ds <Plug>(go-def-split)
nmap <Leader>dv <Plug>(go-def-vertical)

" Rename identifier
nmap <Leader>e <Plug>(go-rename)

nmap <leader><leader>0 :silent PlayMeOff /home/adamryman/projects/go/src/github.com/TuneLab/gob/demo/add/.plans/gofiles/partial.go<Return><ESC>i

nmap <leader><leader>1  :silent call system('cp --remove-destination /home/adamryman/projects/go/src/github.com/TuneLab/gob/demo/add/.plans/gofiles/service.go /home/adamryman/projects/go/src/github.com/TuneLab/gob/demo/add/service/server/service.go')<Return><ESC>

" Clear goRawString so ` template `  is syntax highlighted. Re-source to undo
" (<leader>s)
noremap <leader><leader>; :syntax clear goRawString<CR>

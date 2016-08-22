" Spaces instead of tabs
set expandtab
" Backspace tabs by 2 even though they are spaces
set softtabstop=2
set tabstop=2
set shiftwidth=2


""" FUNNY STUFF MAN
map <leader><leader>1  :silent call system('cp --remove-destination /home/adamryman/projects/go/src/github.com/TuneLab/gob/demo/add/.plans/protofiles/0010_base.proto /home/adamryman/projects/go/src/github.com/TuneLab/gob/demo/add/service.proto')<Return><ESC>
map <leader><leader>2  :silent call system('cp --remove-destination /home/adamryman/projects/go/src/github.com/TuneLab/gob/demo/add/.plans/protofiles/0020_newrpc.proto /home/adamryman/projects/go/src/github.com/TuneLab/gob/demo/add/service.proto')<Return><ESC>


map <leader><leader>0  :silent PlayMeOff /home/adamryman/projects/go/src/github.com/TuneLab/gob/demo/add/.plans/protofiles/partial.proto<Return><ESC>i


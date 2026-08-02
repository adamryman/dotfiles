
if $DOTFILES_vundle == '1'

call plug#begin('~/.config/nvim/plugged')

"call plug#begin(s:plug_dir)
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" python venv selector
Plug 'linux-cultist/venv-selector.nvim'

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For mini.snippets users.
" Plug 'echasnovski/mini.snippets'
" Plug 'abeldekat/cmp-mini-snippets'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'



" language server linter
Plug 'dense-analysis/ale'

" A prerequisite for autocompletion
"Plug 'ncm2/ncm2'
"" Also a prerequisite for autocompletion
"Plug 'roxma/nvim-yarp'
"" Also a prerequisite for autocompletion
"Plug 'roxma/vim-hug-neovim-rpc'
"" Also a prerequisite for autocompletion
"Plug 'autozimu/LanguageClient-neovim', {
      "\ 'branch': 'next',
      "\ 'do': 'bash install.sh',
      "\ }
"jedi for python
"Plug 'ncm2/ncm2-jedi'

" git tools
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'

" Makes vim look nice and show your mode better and git things
Plug 'vim-airline/vim-airline'

" Nice Go integrations and autocompletions
Plug 'fatih/vim-go'

" An inter-vim wiki for my own use
Plug 'vimwiki/vimwiki'

" Commenting made easy!
Plug 'scrooloose/nerdcommenter'

" Auto-pairing "" {} () [] ''
"Plug 'Raimondi/delimitMate'
"Plug 'jiangmiao/auto-pairs'

" Can use with ag for searching files
 if executable('ag')
   let g:ackprg = 'ag --vimgrep'
 endif
Plug 'mileszs/ack.vim'

call plug#end()

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
      end,
    },
    window = {
       completion = cmp.config.window.bordered({
         col_offset = -3,
         side_padding = 2,
         border = "rounded",
       }),
       documentation = cmp.config.window.bordered({
         border = "rounded",
         side_padding = 2,
         max_width = 80,
       }),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?`
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':'
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  vim.lsp.config('gopls', {
    capabilities = capabilities,
  })
  vim.lsp.enable('gopls')

vim.lsp.config('pylsp', {
    capabilities = capabilities,
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = false },
          pylint = { enabled = false },
          pycodestyle = { enabled = false },
		  flake8 = { enabled = false, ignore = { "E501" } },
        }
      }
    }
  })
  vim.lsp.enable('pylsp')

  -- LSP keymaps on attach
  -- Note: K, grr, grn, gra are defaults in nvim 0.11+
  -- gd and <C-]> are not defaults so we map them here
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, opts)
    end
  })

EOF
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

" For plugin 'tonchis/vim-to-github'
let g:to_github_clip_command = 'xclip -sel clip -i'
let g:to_github_clipboard = 1

let g:fugitive_gitlab_domains = ['https://gitlab.corp.tune.com']

" Syntastic
"
" Stuff for autocompletion  {{{ ----------------------------------------------
" Affects the visual representation of what happens after you hit <C-x><C-o>
" https://neovim.io/doc/user/insert.html#i_CTRL-X_CTRL-O
" https://neovim.io/doc/user/options.html#'completeopt'
"
" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
"
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Stuff for autocompletion
"autocmd BufEnter  *  call ncm2#enable_for_buffer()

" Disable the vim-go jump to definition, replacing with the LSP jtd
"let g:go_def_mapping_enabled = 0
"nnoremap <c-]> :call LanguageClient#textDocument_definition()<CR>

" 'go': ['.git', 'go.mod'],
"let g:LanguageClient_rootMarkers = {
      "\ 'go': ['.git', 'go.mod'],
      "\ }

"    \ 'go': ['bingo', '-format-style', 'gofmt', '-disable-func-snippet', '-enhance-signature-help'],
"    \ 'go': ['tcp://127.0.0.1:4389'],
"     \ 'go': ['gopls'],
"let g:LanguageClient_serverCommands = {
     "\ 'go': ['gopls'],
      "\ 'python': ['pyls'],
      \ }
"let g:ncm2_jedi#environment="/home/adamryman/bin/venv-3/bin/python"
"let g:ncm2_jedi#environment="~/projects/glympse_ghorg/glympse/enroute/core-api/.venv-core-api/bin/python"


" }}}
endif
" Fold on opening for organization
" vim:foldmethod=marker:foldlevel=0
"
"

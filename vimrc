call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/vim-fern'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
call plug#end()

set number
set laststatus=2
set statusline=%F
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set completeopt=menuone,noinsert,noselect
set timeout
set timeoutlen=300
set ttimeout
set ttimeoutlen=30
set redrawtime=10000

syntax enable
filetype plugin indent on

inoremap <silent><expr> <C-@> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gB :GitMessenger<CR>
nnoremap <leader>e :Fern . -drawer -toggle -width=30<CR>

let g:indentLine_enabled = 0

augroup FastSyntax
  autocmd!
  autocmd FileType javascript,typescript,typescriptreact,javascriptreact,vue,svelte,html setlocal synmaxcol=200
  autocmd FileType javascript,typescript,typescriptreact,javascriptreact,vue,svelte,html syntax sync minlines=50 maxlines=200
augroup END

augroup FernMappings
  autocmd!
  autocmd FileType fern call s:fern_init()
augroup END

function! s:fern_init() abort
  nmap <buffer> <CR> <Plug>(fern-action-open)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> p <Plug>(fern-action-preview:toggle)
  nmap <buffer> R <Plug>(fern-action-reload)
  nmap <buffer> q :q<CR>
endfunction

augroup FernAuto
  autocmd!
  autocmd VimEnter * ++nested execute 'Fern . -drawer -width=30 -reveal=' . fnameescape(expand('%:p'))
  autocmd VimEnter * ++nested wincmd p
augroup END

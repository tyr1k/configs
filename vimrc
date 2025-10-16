call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
syntax enable
filetype plugin indent on

set completeopt=menuone,noinsert,noselect
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_fmt_command = 'goimports'
let g:go_gopls_enabled = 1

nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gB :GitMessenger<CR>
nnoremap <leader>e :Fern . -drawer -toggle -width=30<CR>

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

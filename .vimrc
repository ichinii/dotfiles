set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/L9'
Plugin 'Valloric/YouCompleteMe'
Plugin 'peterhoeg/vim-qml'
Plugin 'rdnetto/YCM-Generator'
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/local_vimrc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:max_diagnostics_to_display = 64

syntax on
set encoding=UTF-8

set number
set relativenumber
set hlsearch
set wildmenu
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:$
set linebreak
set wrap
"set showmatch
set autoindent

map <F2> :tabe 
map <F3> :tabp<CR>
map <F4> :tabn<CR>

set tabstop=2
set softtabstop=2 noexpandtab
set shiftwidth=2 nosmarttab
autocmd Filetype python setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab nosmarttab
autocmd Filetype qml setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

tab all

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

"set exrc
set secure

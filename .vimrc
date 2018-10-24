set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'gmarik/Vundle.vim'
	Plugin 'vim-scripts/L9'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'peterhoeg/vim-qml'
	Plugin 'rdnetto/YCM-Generator'
	Plugin 'junegunn/fzf'
	Plugin 'junegunn/fzf.vim'
call vundle#end()
filetype plugin indent on

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:max_diagnostics_to_display = 1024

" FZF
let g:fzf_action = {
	\ '': 'tab split',
  \ 'ctrl-t': 'e',
  \ 'ctrl-v': 'split',
  \ 'ctrl-b': 'vsplit' }

" options
syntax on
set encoding=UTF-8 fileencoding=UTF-8 termencoding=UTF-8
set number relativenumber
set hlsearch incsearch ignorecase smartcase
"set showmatch
set wildmenu
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:$
set wrap linebreak
set colorcolumn=80

set                              tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab smarttab autoindent
autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4   expandtab smarttab
autocmd Filetype qml    setlocal tabstop=4 softtabstop=0 shiftwidth=4   expandtab smarttab

" mappings
nnoremap <F2> :tabe 
nnoremap <F3> :tabp<CR>
nnoremap <F4> :tabn<CR>
nnoremap <F5> :YcmDiags<CR>
nnoremap <F6> :YcmCompleter FixIt<Cr>
nnoremap <F7> :YcmCompleter GetType<CR>
nnoremap <F8> :YcmCompleter GoTo<CR>
nnoremap <C-J> :jumps<CR>
nnoremap f :FZF<CR>
command YCMcompile !cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --system-libclang

"set exrc
set secure
tab all

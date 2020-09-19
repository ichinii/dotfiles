set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'vim-scripts/L9'
  Plugin 'ycm-core/YouCompleteMe'
  Plugin 'rdnetto/YCM-Generator'
  "Plugin 'vim-syntastic/syntastic'
  Plugin 'peterhoeg/vim-qml'
  Plugin 'tikhomirov/vim-glsl'
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'
  Plugin 'itchyny/lightline.vim'
  Plugin 'tomtom/tcomment_vim'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'calviken/vim-gdscript3'
	Plugin 'lervag/vimtex'
call vundle#end()
filetype plugin indent on

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:max_diagnostics_to_display = 1024

" Syntastic
" needs .syntastic_cpp_config with flags inside
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" FZF
"  \ '': 'tab split',
let g:fzf_action = {
  \ 'ctrl-t': 'e',
  \ 'ctrl-v': 'split',
  \ 'ctrl-b': 'vsplit' }

" lightline
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'one',
  \ }

" easymotion
map <Leader> <Plug>(easymotion-prefix)

" options
syntax on
set background=dark
set encoding=UTF-8 fileencoding=UTF-8 termencoding=UTF-8
set number relativenumber
set hlsearch incsearch ignorecase
"set showmatch
set wildmenu
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:$
set wrap linebreak
set colorcolumn=80
hi Search ctermbg=darkblue ctermfg=lightblue

set                              tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab   smarttab autoindent
autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4   expandtab   smarttab
autocmd Filetype qml    setlocal tabstop=4 softtabstop=0 shiftwidth=4   expandtab   smarttab

" mappings
nnoremap <F2> :tabe 
nnoremap <F3> :tabp<CR>
nnoremap <F4> :tabn<CR>
nnoremap <F5> :YcmDiags<CR>
nnoremap <F6> :YcmCompleter FixIt<Cr>
nnoremap <F7> :YcmCompleter GetType<CR>
nnoremap <F8> :YcmCompleter GoTo<CR>
nnoremap <C-J> :jumps<CR>
command YCMcompile !cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --system-libclang
nnoremap f :FZF<CR>

"set exrc
set secure
tab all

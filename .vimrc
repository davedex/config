set nocompatible
set ls=2
set expandtab
set tabstop=4
set shiftwidth=4
set scrolloff=3
set showcmd
set hlsearch
set incsearch
set ruler
set directory=~/.vim_backups,/tmp
set number
set ignorecase
set title
set ttyfast
set modeline
set modelines=3
set autoindent
set cindent
set nowrap
set bs=2


" Disable arrow keys
inoremap <Up>   <NOP>
inoremap <Down>   <NOP>
inoremap <Left>   <NOP>
inoremap <Right>   <NOP>
noremap <Up>   <NOP>
noremap <Down>   <NOP>
noremap <Left>   <NOP>
noremap <Right>   <NOP>


filetype off    

" Go setup
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufWritePost *.go silent! !ctags -R &
autocmd FileType go set makeprg=go\ build\ ./...
nmap <F5> :make<CR>:copen<CR>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Blackrush/vim-gocode'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'majutsushi/tagbar'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'gilsondev/lizard'
Bundle 'flazz/vim-colorschemes'

" Nerdtree
map <F4> :NERDTreeTabsToggle<CR>
let NERDTreeShowBookmarks=1

" Tagbar
map <F3> :TagbarToggle<CR>
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

filetype plugin indent on
syntax on

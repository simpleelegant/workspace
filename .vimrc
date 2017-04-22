" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'            " integrate Git
Plug 'itchyny/lightline.vim'         " status line
Plug 'flazz/vim-colorschemes'        " color schemes

Plug 'pangloss/vim-javascript'       " better javascript support
Plug 'ekalinin/Dockerfile.vim'       " Dockerfile support
Plug 'plasticboy/vim-markdown'       " markdown support
Plug 'fatih/vim-go'                  " Go support

Plug 'tomtom/tlib_vim'               " dependence of vim-snippets
Plug 'MarcWeber/vim-addon-mw-utils'  " dependence of vim-snippets
Plug 'garbas/vim-snipmate'           " snippets engine
Plug 'honza/vim-snippets'            " snippets


" Initialize plugin system
call plug#end()

" configuration of lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" setting of vim-markdown
let g:vim_markdown_folding_disabled = 1

" count length of string on clipboard
fun! Size()
    echo strlen(@")
endf

" command maps
nmap ; :
cmap ; <CR>

" custom settings
set scrolloff=3 " keep 3 lines below and above the cursor
set laststatus=2
set hlsearch incsearch
set encoding=utf-8 fileencodings=ucs-bom,utf-8,default,gbk,latin1
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set nu
set hidden
set ignorecase
set background=dark
au BufRead,BufNewFile *.conf :setlocal filetype=config
au FileType html,css,javascript :setlocal isk+=- tabstop=4 softtabstop=4 shiftwidth=4
au FileType php :setlocal isk+=$

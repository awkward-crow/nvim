" init.vim for neovim

call plug#begin()
Plug 'JuliaEditorSupport/julia-vim'
Plug 'file://'.expand('~/a/vim-slime/vim-slime')
Plug 'dhruvasagar/vim-table-mode'
call plug#end()

" built-in markdown stuff (?)
let g:markdown_fenced_languages = ['r', 'python', 'bash=sh']

" vim-slime
let g:slime_target="xdotool"
let g:slime_default_config={}
let g:slime_dont_ask_default=0

" R
let g:r_indent_align_args=0 " see :help ft-r-indent

command -nargs=0 U
\ | execute ":silent !urxvt &"
\ | execute ':redraw!'

command -nargs=0 X
\ | execute ":silent !urxvt -e nvim -c ':terminal' &"
\ | execute ':redraw!'

autocmd TermOpen * startinsert
tnoremap <Esc> <C-\><C-n> " does this work?
tnoremap <S-Space> <C-\><C-n> " does this work?
tnoremap <C-Space> <C-\><C-n> " is this good enough?
" tnoremap <M-j> <C-\><C-n>

command -nargs=1 T
\ | execute ":silent !urxvt -e '<args>' &"
\ | execute ':redraw!'

" open file in another window
command -nargs=1 E
\ | execute ':silent !urxvt -e nvim <args> &'
\ | execute ':redraw!'

" open file in another window - readonly
command -nargs=1 I
\ | execute ':silent !urxvt -e nvim -R <args> &'
\ | execute ':redraw!'

" command abbrev, i -> view
cabbrev i <C-R>=(getcmdtype()==':' && getcmdpos()==1 ? 'view' : 'i')<CR>


set clipboard=unnamed

" do away with status line
set laststatus=0

set modelines=0 

set backspace=indent,eol,start

set nobackup
set writebackup

set shortmess+=I
set shortmess+=r
set guioptions-=T

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent

set showcmd
set showmode
" set showmatch
set ignorecase
set smartcase
set gdefault
set incsearch
set hidden
set hlsearch


noremap <M-Space> <Esc>
inoremap <M-Space> <Esc>
cnoremap <M-Space> <Esc>

" no <M-w> :let b:w = system("xdotool selectwindow \| tr -d '\n'")
" no <M-m> :call system('xsel -o | xdotool type --window ' . b:w . ' --delay 0 --file -')

" mappings for dv kbd

no s :

no t j
no T <C-D>
no c k
no C <C-U>
no h w
no H $
no n b
no N ^
no g l
no G }
no f f
no F F
no r h
no R {
no d u
no D U
no b n
no B N
no m e
no M E
no w gg
no W G

no a a
no A A
no o i
no O I
no e x
vno e d
no E dd
no u dw
no U d$
no i r
no I J
no , yy
no ; y$
vno , y
no . p
no : P
no p o
no P O
no y t
no Y T
no j .
no k V
no K v
no x /
no X ?
no q s
vno q c
no Q C



nnoremap <leader><space> :noh<cr>

" set wrap
" set textwidth=79
" set formatoptions=qrn1
" set colorcolumn=85

set completeopt=menu,longest

set wildmenu
" set wildmode=longest,full
" set wildmode=list:longest
set wildmode=list:longest,full

set history=50		" keep 50 lines of command line history

noremap <F3> :bn<CR>
noremap <S-F3> :bp<CR>
noremap <F4> :b#<CR>
noremap <F5> <c-w>w

noremap <F7> :only<CR>
noremap <F6> :bd<CR>

autocmd BufEnter * cd %:p:h

colorscheme bluegray

" let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-u>"

syntax on
filetype on
filetype plugin indent on

" nnoremap <tab> %
" vnoremap <tab> %
nmap <tab> %
vmap <tab> %

inoremap <M-.> <C-n>
inoremap <M-:> <C-p>

" open file under the cursor
nnoremap <M-f> gf

nnoremap <M-o> :w<cr>

nnoremap <M-q> gqap

" mappings for latex
inoremap <M-p> $
inoremap <S-M-p> $$
inoremap <M-y> \ref{


" comment/uncomment
" taken from
" http://vim.wikia.com/wiki/Comment/UnComment_visually_selected_text
au FileType lua,haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType scheme,lisp let b:comment_leader = ';; '
au FileType c,javascript,pony,rust,cpp,java,scala,go let b:comment_leader = '// '
au FileType julia,r,python,sh,make let b:comment_leader = '# '
au FileType erlang,prolog,mercury,tex,cfl let b:comment_leader = '% '
noremap <silent> <M-,> :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> <M-;> :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>


"
" The End
"


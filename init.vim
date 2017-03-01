" init.vim for neovim

call plug#begin()
Plug 'plasticboy/vim-markdown'
Plug 'awkward-crow/vim-slime'
call plug#end()

let g:slime_target="tmux"
let g:slime_default_config={"socket_name": "", "target_pane": ":"}
let g:slime_dont_ask_default=0

" for vim-markdown (see github.com/plasticboy/vim-markdown)
let g:vim_markdown_folding_disabled=1

command -nargs=1 T
\ | execute ":silent !urxvt -e tmux new-session -s <args> 'bash' &"
\ | execute ':redraw!'

" run R in a new window under tmux
" can this be tailored to filetype?
" command -nargs=0 T
" \ | execute ":silent !urxvt -e tmux new-session -s r-session 'R -q' &"
" \ | execute ':redraw!'

command -nargs=0 R
\ | execute ":silent !urxvt -e tmux new-session -s r-session 'R -q' &"
\ | execute ':redraw!'

" run bash in a new window under tmux
command -nargs=0 B
\ | execute ":silent !urxvt -e tmux new-session -s bash-session 'bash' &"
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

" call pathogen#infect()
" call pathogen#helptags()

syntax on
filetype on
filetype plugin indent on

au BufNewFile,BufRead *.jy set filetype=python

" taken from http://vim.wikia.com/wiki/Configuring_the_cursor

" if &term =~ "nvim|xterm\\|rxvt"
"     " use an orange cursor in insert mode
"     let &t_SI = "\<Esc>]12;orange\x7"
"     " use a red cursor otherwise
"     let &t_EI = "\<Esc>]12;lightgreen\x7"
"     " silent !echo -ne "\033]12;lightgreen\007"
"     " reset cursor when vim exits
"     autocmd VimLeave * silent !echo -ne "\033]12;yellow\007"
"     " use \003]12;gray\007 for gnome-terminal
" endif 


nnoremap <tab> %
vnoremap <tab> %

inoremap <M-.> <C-n>
inoremap <M-:> <C-p>

" open file under the cursor
" nnoremap <M-u> gf

nnoremap <M-o> :w<cr>

nnoremap <M-q> gq

" comment/uncomment
" taken from
" http://vim.wikia.com/wiki/Comment/UnComment_visually_selected_text
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType lisp let b:comment_leader = ';; '
au FileType c,cpp,java,scala,go let b:comment_leader = '// '
au FileType r,python,sh,make let b:comment_leader = '# '
au FileType erlang,tex let b:comment_leader = '% '
noremap <silent> <M-,> :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> <M-;> :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>


"
" The End
"


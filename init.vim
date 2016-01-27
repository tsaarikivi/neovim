call plug#begin()

Plug 'https://github.com/croaker/mustang-vim.git'

Plug 'https://github.com/vim-airline/vim-airline.git'

Plug 'https://github.com/kien/ctrlp.vim.git'

Plug 'https://github.com/scrooloose/nerdcommenter.git'

Plug 'https://github.com/tpope/vim-surround.git'

call plug#end()

"Mapleader
let mapleader = ","
let maplocalleader = ","

"autoreload vimrc when changes made to it
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

syntax on
syntax enable
filetype plugin indent on

"jump to last postition whtn reopening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"---------
"Plugins
"----------

"airline
let g:airline#extensions#tabline#enabled = 1

"auto open nerdtree
"autocmd vimenter * NERDTree
"let g:NERDTreeWinPos = "right"
"toggle nerdtree
"nmap <F2> :NERDTreeToggle<CR>
"imap <F2> <Esc>:NERDTreeToggle<CR>

"ctrlp settings
nnoremap <leader>ff :CtrlP ~/code<CR>
inoremap <leader>ff <Esc>:CtrlP ~/code<CR>

"--------
"Functionality
"----------

"autoread files when focus gained
set autoread

"256col
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

"colorscheme
colo mustang
"transparent bg
hi Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none

"enable mouse
"set mouse=a

"autowrite between buffers
set autowriteall

"line numbering
set number
set relativenumber
set nuw=6

"Tabstuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Always show the status line
set laststatus=2

"rid of leader + cmd timeout
set ttimeoutlen=500
set timeoutlen=500

"switch between buffers without saving
set hidden

"linewrapping
set nowrap

"searching
"incremental
set incsearch
"highlight
set hlsearch
"case insensitive
set ignorecase
set smartcase

"start deleting from i
set backspace=indent,eol,start

"----------
"KEYBINDINGS
"---------

"open vimrc for editing
nnoremap <leader>vim :e $MYVIMRC<CR>

"use jj to esc
inoremap jj <Esc>:w<CR>

"use ,ww to save
nnoremap <leader>ww :wa<CR>
inoremap <leader>ww <C-o>:wa<CR>

"use ,wq to wq
nnoremap <leader>wq :wa<CR>:qa<CR>
inoremap <leader>wq <Esc>:wa<CR>:qa<CR>

"use ,qq to q
nnoremap <leader>qq :q<CR>
inoremap <leader>qq <Esc>:q<CR>
"use ,qa to end session
nnoremap <leader>qa :qa<CR>
inoremap <leader>qa <Esc>:qa<CR>

"use ,tt to do the double terminals
nnoremap <leader>tt <C-w>v<C-w>l:terminal<CR><C-\><C-n><C-w>s<C-w>j:terminal<CR><C-\><C-n><C-w>h
"use ,td to destroy the double terminals from the left window
nnoremap <leader>td <C-w>l:q!<CR>:q!<CR>

"indent all rows
nnoremap <leader>ia gg=<S-g>

"highlights off
nnoremap <leader>/ :noh<CR>

"delete all
nnoremap <leader>da ggdGi

"use CTRLH and L to navigate BUFFERS
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
"use ALThjlk to navigate windows
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"use ,xx to kill buffer
nnoremap <leader>xx :w<CR>:bd<CR>
inoremap <leader>xx <Esc>:w<CR>:bd<CR>

"autocomplete html tags with ,<
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType eruby set omnifunc=htmlcomplete#CompleteTags
nnoremap <leader>< $a</<C-X><C-O><Esc>
inoremap <leader>< <Esc>$a</<C-X><C-O>
"set tag middle line
inoremap <leader>> ></<C-X><C-O><Esc>%i
inoremap <leader>>> ></<C-X><C-O><Esc>%i<CR><Esc><S-O>

","" gives ="|"
inoremap <leader>22 =""<Esc>i
inoremap <leader>"" =""<Esc>i

"make insides pop
nnoremap <leader>oo F>a<CR><Esc>f<i<CR><Esc>k$

"ruby tags
"%%% gives <%
inoremap %%% <%  %><Esc>hhi
"=== gives <%=
inoremap === <%=  %><Esc>hhi

"ö ä
nmap ö 0
nmap ä $
imap ö (
imap ä )
imap Ö {
imap Ä }
imap å [
imap Å ]

":PlugUpgrade :PlugClean :PlugInstall :PlugUpdate
call plug#begin()

Plug 'mattn/emmet-vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'croaker/mustang-vim'

Plug 'NLKNguyen/papercolor-theme'
Plug 'akmassey/vim-codeschool'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kien/ctrlp.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'octref/RootIgnore'

Plug 'tpope/vim-surround'

Plug 'scrooloose/syntastic'

Plug 'mxw/vim-jsx'

Plug 'tpope/vim-fugitive'

Plug 'pangloss/vim-javascript'

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

"airline
let g:airline#extensions#tabline#enabled = 1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aluto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"syntastic Checkers
let g:syntastic_javascript_checkers = ['eslint']
"jsx
let g:jsx_ext_required = 0

"deoplete
let g:deoplete#enable_at_startup = 1

"jump to last postition whtn reopening file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"---------
"Plugins
"----------

"auto open nerdtree
"autocmd vimenter * NERDTree
"autocmd vimenter * NERDTreeToggle
"let g:NERDTreeWinPos = "left"
"NerdTree
let loaded_netrwPlugin=1
let NERDTreeRespectWildIgnore=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"toggle nerdtree
noremap <F2> :NERDTreeToggle<CR>
nmap <leader>tre :NERDTreeToggle<CR>
imap <leader>tre <Esc>:NERDTreeToggle<CR>

"ctrlp settings
nnoremap <leader>ff :CtrlP<CR>
inoremap <leader>ff <Esc>:CtrlP<CR>

"css-color
"let g:cssColorVimDoNotMessMyUpdatetime = 1

"javascript
"set foldmethod=syntax

"--------
"Functionality
"----------

"autoread files when focus gained
set autoread

"keep cursor in middle
set so=999

"256col
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"colorscheme
set background=dark
colo PaperColor

"enable mouse
"set mouse=a

"autowrite between buffers
set autowriteall

"line numbering
set number
set relativenumber
set nuw=6

"Tabstuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
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

"use ,1t to do one terminal
nnoremap <leader>1t <C-w>v<C-w>l:terminal<CR><C-\><C-n>i
"use ,1d to destroy one terminal
nnoremap <leader>1d <C-w>l:q!<CR><C-w>h
"use ,2t to do the double terminals
nnoremap <leader>2t <C-w>v<C-w>l:terminal<CR><C-\><C-n><C-w>s<C-w>j:terminal<CR><C-\><C-n><C-w>h
"use ,2d to destroy the double terminals from the left window
nnoremap <leader>2d <C-w>l:q!<CR>:q!<CR><C-w>h
"use ,3t to do the triple terminals
nnoremap <leader>3t <C-w>v<C-w>l:terminal<CR><C-\><C-n><C-w>s<C-w>j:terminal<CR><C-\><C-n><C-w>s<C-w>j:terminal<CR><C-\><C-n><C-w>h
"use ,3d to destroy the triple terminals from the left window
nnoremap <leader>3d <C-w>l:q!<CR>:q!<CR>:q!<CR><C-w>h
"use ,at to add a terminal under this one
nnoremap <leader>at <C-w>l<C-w>j<C-w>s<C-w>j:terminal<CR><C-\><C-n>i
"rails terminals summon
nnoremap <leader>rt <C-w>v<C-w>l:terminal<CR>cd code/sample_app<CR><C-\><C-n><C-w>s<C-w>j:terminal<CR>cd code/sample_app && bundle exec guard<CR><C-\><C-n><C-w>s<C-w>j:terminal<CR>cd code/sample_app && rails s<CR><C-\><C-n><C-w>h

"indent all rows
nnoremap <leader>ia gg=<S-g>

"highlights off
nnoremap <leader>/ :noh<CR>

"delete all
nnoremap <leader>da ggdGi

"use shift H and L to navigate BUFFERS
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
"use ctrl hjkl to navigate windows
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h<C-w>
tnoremap <C-j> <C-\><C-n><C-w>j<C-w>
tnoremap <C-k> <C-\><C-n><C-w>k<C-w>
tnoremap <C-l> <C-\><C-n><C-w>l<C-w>
nnoremap <C-h> <C-w>h<C-w>
nnoremap <C-j> <C-w>j<C-w>
nnoremap <C-k> <C-w>k<C-w>
nnoremap <C-l> <C-w>l<C-w>

"use ,xx to kill buffer
nnoremap <leader>xx :w<CR>:bd<CR>
inoremap <leader>xx <Esc>:w<CR>:bd<CR>

"autocomplete html tags with ,<
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType eruby set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=htmlcomplete#CompleteTags
nnoremap <leader>< $a</<C-X><C-O><Esc>
inoremap <leader>< <Esc>$a</<C-X><C-O>

","" gives ="|"
inoremap <leader>22 =""<Esc>i
inoremap <leader>"" =""<Esc>i

"make insides pop
nnoremap <leader>oo F>a<CR><Esc>f<i<CR><Esc>k$

"ö ä
nmap ö 0
nmap ä $
imap ö (
imap ä )
imap Ö {
imap Ä }
imap å [
imap Å ]

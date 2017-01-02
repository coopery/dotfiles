" This must be first, because it changes other options as a side effect.
set nocompatible

" start up pathogen
execute pathogen#infect()
Helptags

" 4-width tabs
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" Syntax highlighting
syntax enable

" Colorscheme
set background=dark
colorscheme skittles_berry
" don't let colorscheme override terminal background
hi Normal ctermbg=none

" Show relative line numbers
set number
set rnu

" Auto update buffers if a file changes from outside vim
set autoread

" Don't make backup (~) files
set nobackup

" Show long lines on only one line
set nowrap

" Use jk to exit insert mode
inoremap jk <esc>
inoremap <esc> <nop>

" Highlight 80th column
set colorcolumn=80

" New line continues block comments, not one-line comments
autocmd FileType c,cpp setlocal comments-=:// comments+=f://

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" keep x lines of command line history
set history=100

" show the cursor position all the time
set ruler

" Show command as you're typing it
set showcmd

" do incremental searching
set incsearch

" highlight search results
" set hlsearch

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" copy indentation from previous line when starting new line
set autoindent

" use <leader>ev to edit .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" use <leader>sv to reload .vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" tab completion for commands shows options and stuff
set wildmenu

" only continue block comments onto new lines
au FileType c,cpp setlocal comments-=:// comments+=f://

" insert newline below/above in normal mode
nmap <C-K> mxOjk`x:delmarks x<CR>
nmap <C-J> mxojk`x:delmarks x<CR>

" open a diff of the current buffer using the .swp file
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	\ | wincmd p | diffthis

" delete trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" type <Leader>tl to go to the last viewed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<Enter>
autocmd TabLeave * let g:lasttab = tabpagenr()

" toggle paste mode and echo current state
map <leader>p :setlocal paste! paste?<Enter>

" map ; to :, ;; to original ;
map ; :
noremap ;; ;

" Turn off search highlighting if no buttons pressed for 'updatetime'
" Turn it back on when n, N, /, ? are pressed
autocmd cursorhold * set nohlsearch
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * :set hlsearch<cr>*

let g:netrw_dirhistmax = 0

" to enable word wrap at column n
" set wrap
" set linebreak
" set nolist
" set columns=n

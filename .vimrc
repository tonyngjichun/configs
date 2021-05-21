"filetype off
"set nocompatible
filetype plugin indent on
"turn on syntax hihlighting.
syntax on


""""""""""""""""""
" Here is for Pathogen
"execute pathogen#infect()
"
" Here is for vim-plug
"silent !mkdir --parents ~/.vim/autoload
"silent !curl --fail --location --output ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim' ", { 'for': 'python3'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

augroup python
    autocmd!
    autocmd filetype python
                \   syn keyword pythonself self
                \ | hi! pythonself ctermfg=darkcyan
augroup end

" no arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" move lines up and down
nnoremap <Esc>j :m .+1<CR>==
nnoremap <Esc>k :m .-2<CR>==
"inoremap <Esc>j <Esc>:m .+1<CR>==gi
"inoremap <Esc>k <Esc>:m .-2<CR>==gi
vnoremap <Esc>k :m '<-2<CR>gv=gv
vnoremap <Esc>j :m '>+1<CR>gv=gv

imap jj <Esc>

" for navigating windows
nnoremap <Space> <C-w>
" Turn off modelines
set modelines=0

"""" " automatically wrap text that extends beyond the screen length.
"""" "set wrap
"""" " vim's auto indentation feature does not work properly with text copied from outisde of vim. press the <f2> key to toggle paste mode on/off.
"""" nnoremap <f2> :set invpaste paste?<cr>
"""" imap <f2> <c-o>:set invpaste paste?<cr>
"""" set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" lazy redraw
set lazyredraw

" Status bar
set laststatus=2


" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"
" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=25
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1
noremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Colour Scheme
colorscheme gruvbox
let g:gruvbox_termcolors=256
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_number_column='bg0'
let g:airline_theme='gruvbox'
" let g:airline_left_sep='>'
" let g:airline_right_sep='<'
let g:airline_detect_modified=1
let g:airline_inactive_collapse=1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
set bg=dark

" display indentation guides
set list listchars=tab:\⁞\ ,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4

" let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures= "2"
" let g:jedi#max_doc_height="15"
" let g:jedi#auto_close_doc = 0
autocmd FileType python setlocal completeopt-=preview

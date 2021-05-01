" plugins
"
call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'fatih/vim-go'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar'

call plug#end()

let g:deoplete#enable_at_startup = 1

" General Settings

filetype on
filetype plugin on
filetype indent on
set nu

set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
" set autowrite                     " write when switching buffers
" set autowriteall                  " write on :quit
" set clipboard=unnamedplus
set colorcolumn=81                " highlight the 80th column as an indicator
set cursorline                    " highlight the current line for the cursor
set encoding=utf-8
set expandtab                     " expands tabs to spaces
set list                          " show trailing whitespace
set listchars=tab:\·\ ,extends:›,precedes:‹,nbsp:˙,trail:▫
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set number                        " show number ruler
set relativenumber                " show relative numbers in the ruler
set ruler
set formatoptions=tcqronj         " set vims text formatting options
set softtabstop=2
set tabstop=2
set title                         " let vim set the terminal title
set updatetime=1000                " redraw the status bar often

syntax enable

" Searching
syntax on
set showmatch
set hlsearch
set incsearch

set history=500

" Fix some common typos
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Qall qall
cnoreabbrev Qall! qall!
cnoreabbrev Qa qa
cnoreabbrev Qw qw
cnoreabbrev Qwa qwa
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev WQ wq
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq

" colors
"
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme PaperColor

set termguicolors
" let ayucolor="mirage"
" colorscheme ayu
" colorscheme palenight 
" let g:lightline = { 'colorscheme': 'palenight' }

" Plugin: vim-go
" References: https://medium.com/hackernoon/my-neovim-setup-for-go-7f7b6e805876
" Indentation
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Code highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

" Auto import dependencies
let g:go_fmt_command = "goimports"

" Linting code
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Navigation
au FileType go nmap <leader>gt :GoDeclsDir<cr>

" Running tests
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>

"show type info in status line
let g:go_auto_type_info = 1

" get the docs
au FileType go nmap <F12> <Plug>(go-def)

" JSON Tags
let g:go_addtags_transform = "camelcase"

" PLUGIN: airline
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#fugitiveline#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='PaperColor'

" PLUGIN: NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" PLUGIN: vim-devicons
set guifont=RobotoMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1

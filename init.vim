set nocompatible
filetype off

call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf'
Plug 'luochen1990/rainbow'
Plug 'ap/vim-css-color'
Plug 'leshill/vim-json'
Plug 'digitaltoad/vim-pug'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dense-analysis/ale'
Plug 'arcticicestudio/nord-vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

filetype plugin indent on
syntax on

set background=dark
set termguicolors
colorscheme catppuccin_macchiato
" colorscheme catppuccin_frappe
" colorscheme catppuccin_mocha
" colorscheme catppuccin_latte
" colorscheme nord

let mapleader=','
set encoding=utf-8
set pastetoggle=<Leader>p
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set number
set conceallevel=0
set foldmethod=indent
set nofoldenable
set showmatch
set hlsearch
set completeopt-=preview
set noshowmode
"set cursorcolumn
"set cursorline
"set showcmd
"set foldlevelstart=1
"set foldnestmax=5
"set colorcolumn=80

hi Cursor ctermbg=red ctermfg=black
" hi CursorColumn ctermbg=magenta ctermfg=black
" hi QuickFixLine ctermbg=green ctermfg=black
" hi Search ctermbg=red ctermfg=black
hi Search ctermbg=yellow
hi IncSearch ctermbg=red ctermfg=black
" hi Visual ctermbg=green ctermfg=black
" hi ExtraWhitespace ctermbg=red
hi Folded ctermbg=black ctermfg=green
" hi CursorLine ctermbg=235
" hi MatchParen ctermfg=black ctermbg=red
" hi SpecialKey ctermfg=240
" hi Directory guifg=none ctermfg=red
" let &colorcolumn=join(range(81,999),",")
" hi ColorColumn ctermbg=darkgray

" set clipboard=unnamed
" set clipboard=unnamedplus
set mouse=r

" BLACKHOLE REGISTER "
vnoremap p "_dP
vnoremap P "_dP

" RAINBOW "
" let g:rainbow_active = 1
" let g:rainbow_conf = {
" \  'ctermfgs': ['218', 'lightyellow', 'lightcyan', 'lightmagenta'],
" \  }

" ACK "
cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space>

" LIGHTLINE "
let g:lightline = {'colorscheme': 'jellybeans'}

" NERDTREE "
let NERDTreeShowLineNumbers = 0
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['egg-info', '__pycache__$', '\.pyc$', 'node_modules']
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'

map <C-n> :NERDTreeToggle<CR>
nmap <Leader>w <C-w>w
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ALE "
let g:ale_enabled = 1
let g:ale_linters = {'javascript': ['eslint'], 'json': ['jq'], 'python': ['flake8']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_open_list = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_warn_about_trailing_blank_lines = 0

" TABULAR "
"if exists(":Tabularize")
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:/l0r1<CR>
vmap <Leader>a: :Tabularize /:/l0r1<CR>
"endif

" BETTER WHITESPACE "
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" INDENT "
" set list
" let &lcs = 'tab:? '
let g:indentLine_color_term = 239
let g:indentLine_enabled = 1
" let g:indentLine_setConceal = 0
" let g:indentLine_char = '?'
" let g:indentLine_leadingSpaceEnabled = 0
" let g:indentLine_leadingSpaceChar = ''

" VIM-JAVASCRIPT "
" let g:javascript_plugin_jsdoc = 1

" VIM-JSON "
let g:vim_json_syntax_conceal = 0

" DEOPLETE "
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" FZF "
let g:fzf_layout = { 'down': '~30%' }

" vnoremap <leader>y "+y
" nnoremap <leader>y "+y
" nnoremap <leader>p "+p
" vnoremap <leader>p "+p

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2
augroup END

augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

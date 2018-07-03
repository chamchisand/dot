set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'
Plugin 'carlitux/deoplete-ternjs'
Plugin 'yggdroot/indentline'
Plugin 'ddollar/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'leshill/vim-json'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'digitaltoad/vim-pug'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'w0rp/ale'

call vundle#end()

filetype plugin indent on
syntax on

set t_Co=256
set background=dark
colorscheme nord
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
"set cursorline
"set showcmd
"set foldlevelstart=1
"set foldnestmax=5
"set colorcolumn=80

hi Visual ctermbg=green ctermfg=black
"hi ExtraWhitespace ctermbg=red
"hi Folded ctermbg=235 ctermfg=black
"hi CursorLine ctermbg=235
"hi MatchParen ctermfg=red ctermbg=none
"hi SpecialKey ctermfg=240
"hi Directory guifg=none ctermfg=red
"let &colorcolumn=join(range(81,999),",")
"hi ColorColumn ctermbg=darkgray

" BLACKHOLE REGISTER "
vnoremap p "_dP
vnoremap P "_dP

" ACK "
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" LIGHTLINE "
let g:lightline = {'colorscheme': 'jellybeans'}

" NERDTREE "
let NERDTreeShowLineNumbers = 0
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['egg-info', '__pycache__$', '\.pyc$']
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

map <C-n> :NERDTreeToggle<CR>
nmap <Leader>w <C-w>w
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERD COMMENTER "
let g:NERDSpaceDelims = 0
let g:NERDCompactSexyComs = 0
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 0
let g:NERDToggleCheckAllLines = 1

" ALE "
let g:ale_enabled = 1
let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_open_list = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_warn_about_trailing_blank_lines = 0

" TABULAR "
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:/l0r1<CR>
	vmap <Leader>a: :Tabularize /:/l0r1<CR>
endif

" BETTER WHITESPACE "
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" INDENT "
" set list
" let &lcs = 'tab:¦ '
let g:indentLine_color_term = 240
let g:indentLine_enabled = 1

" VIM-JAVASCRIPT "
let g:javascript_plugin_jsdoc = 1

" VIM-JSON "
let g:vim_json_syntax_conceal = 0

" DEOPLETE "
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

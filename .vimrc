execute pathogen#infect()

filetype plugin on
syntax on

set t_Co=256
set background=dark
colorscheme nord

let mapleader=','
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
"set showcmd
"set foldlevelstart=1
"set foldnestmax=5
"set colorcolumn=80

hi Visual ctermbg=green ctermfg=black
hi Folded ctermbg=magenta ctermfg=black
hi ExtraWhitespace ctermbg=red
"hi MatchParen ctermfg=red ctermbg=none
"hi SpecialKey ctermfg=240
"hi Directory guifg=none ctermfg=red
"hi ColorColumn ctermbg=darkgray
"let &colorcolumn=join(range(81,999),",")
"hi ColorColumn ctermbg=darkgray

" BLACKHOLE REGISTER "
vnoremap p "_dP
vnoremap P "_dP

" FLAKE8 "
let g:flake8_show_quickfix=0
let g:flake8_show_in_file=0
let g:flake8_show_in_gutter=1

" NERDTREE "
let NERDTreeShowLineNumbers = 0
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['egg-info', '__pycache__$', '\.pyc$']
let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

map <C-n> :NERDTreeToggle<CR>
nmap <Leader>w <C-w>w

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd BufWritePre * StripWhitespace

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

" AIRLINE "
let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1

" SYNTASTIC "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_generic = 1
let g:syntastic_javascript_eslint_exec = '/bin/ls'
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_javascript_eslint_args='-f compact'

" TABULAR "
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:/l0r1<CR>
	vmap <Leader>a: :Tabularize /:/l0r1<CR>
endif

" INDENTATION "
"set list
"let &lcs = 'tab:¦ '
let g:indentLine_color_term = 240
let g:indentLine_enabled = 1

" VIM-JSON "
let g:vim_json_syntax_conceal = 0

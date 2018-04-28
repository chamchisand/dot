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

" blackhole register
vnoremap p "_dP
vnoremap P "_dP

"=========="
" NERDTree "
"=========="
let NERDTreeShowLineNumbers = 0
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['__pycache__$', '\.pyc$']
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

"========="
" airline "
"========="
let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1

"==========="
" syntastic "
"==========="
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

"========="
" Tabular "
"========="
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:/l0r1<CR>
	vmap <Leader>a: :Tabularize /:/l0r1<CR>
endif

"============="
" indentation "
"============="
"set list
"let &lcs = 'tab:¦ '
let g:indentLine_color_term = 240
let g:indentLine_enabled = 1

"=========="
" vim-json "
"=========="
let g:vim_json_syntax_conceal = 0

"============="
" neocomplete "
"============="
let g:neocomplete#enable_at_startup = 1

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" *******************************************************************
"
"	Basic Setup
"
" *******************************************************************
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs
set smartindent
set tabstop=4
set softtabstop=0
set shiftwidth=4
set smarttab
set cindent

"" Searching
set hlsearch
set incsearch

"" Visual Settings
syntax on
syntax enable
set number
set background=dark
set t_Co=256
colorscheme molokai
let g:molokai_original=1
let g:rehash256=1

"" Status bar
set laststatus=2

" *******************************************************************
"
"	Plugin Install
"
"	:PluginList - lists configured plugins
"	:PluginInstall - installs plugins; append ! to update or just
"	:PluginUpdate
"	:PluginSearch foo - searches for foo; append ! to refresh local cache
"	:PluginClean - confirms removal of unused plugins; append ! to
"	 auto-approve removal
"
" *******************************************************************
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'
"" go
Plugin 'fatih/vim-go'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
"" python
Plugin 'vim-scripts/indentpython.vim'
call vundle#end()

filetype plugin indent on

" *******************************************************************
"
"	Plugin Settings
"
" *******************************************************************
" vim-airline
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"" Delimimate
let delimitMate_expand_cr=1


"" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

"" vim-go
let g:go_def_mode = "gopls"
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_fmt_fail_silently = 1
let g:go_auto_sameids = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

"" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"


"" html, js, css
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"" python
au BufNewFile,BufRead *.py
	\ set tabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab

" *******************************************************************
"
"	Mapp Settings
"
" *******************************************************************
" vim-go
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>d  <Plug>(go-doc-vertical)
autocmd FileType go nmap <Leader>l  <Plug>(go-metalinter)

"" NERDTree
nmap <silent><F7> :NERDTreeToggle<CR>

"" Tagbar
nmap <silent><F8> :TagbarToggle<CR>

"" splitjoin
nmap jj :SplitjoinJoin<CR>
nmap ss :SplitjoinSplit<CR>

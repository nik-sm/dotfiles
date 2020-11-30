set nocompatible " compatible mode turns off useful vim features in favor of compatibility
                 " NOTE - always begin with this, to avoid options getting reset/ignored
" setup pathogen (see https://github.com/tpope/vim-pathogen and https://gist.github.com/romainl/9970697)
execute pathogen#infect()  

set path+=** " allows use of  :find <STRING> and then <TAB> for recursive searching of subtree of current directory with any filename substring
" e.g.  :find main  and then <TAB> will match /path/to/main.py
" (so you should open vim at the root of a project)

syntax on " enable syntax highlighting
filetype plugin indent on " Turn on filetype detection, and enable the use of filetype-specific plugins and indentation behavior

"autocmd vimenter * NERDTree " launch nerdtree on startup - try it and see if you like
" return focus to previous window (the file)
"autocmd VimEnter * wincmd p " move cursor focus back to previous window (i.e. the place where it would be by default)

" quit if nerdtree is the only open buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" nmap - set a key mapping from normal mode
" open nerdtree and return to previous window
nmap <C-a> :NERDTreeToggle<CR><C-w><C-p>


" """"""""""
" " vim-go settings
" " vim-go all lists will be of type 'quickfix'
" let g:go_list_type = "quickfix"
" map <C-n> :cnext<CR>
" map <C-p> :cprevious<CR>
" map <C-x> :cclose<CR>
" autocmd FileType go nmap <Leader>t <Plug>(go-test)
" autocmd FileType go nmap <Leader>b <Plug>(go-build)
" autocmd FileType go nmap <Leader>r <Plug>(go-run)
" autocmd FileType go nmap <Leader>f <Plug>(go-test-func)
" autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" let g:go_fmt_command = "goimports"
" 
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint'] " Only run the fastest ones when saving
" let g:go_metalinter_deadline = "5s" " 5sec timeout
" 
" " More detailed syntax highlighting, but possibly processor intensive
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" 
" """"""""
" 
" " run :GoBuild or :GoTestCompile based on the filename ending
" function! s:build_go_files()
"   let l:file = expand('%')
"   if l:file =~# '^\f\+_test\.go$'
"     call go#test#Test(0, 1)
"   elseif l:file =~# '^\f\+\.go$'
"     call go#cmd#Build(0)
"   endif
" endfunction



color delek "Chosen so visual mode does not obscure text
" https://stackoverflow.com/questions/43814949/cant-read-when-vim-neovim-highlight-same-color-as-text


set backspace=indent,eol,start " using backspace in insert mode can now cross these additional boundaries
set number " show line numbers
" set rnu " show the current line number accurately, and then show relative line numbers counting outwards (good for precise line movements like '12j')
set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.
set shiftwidth=2    " Indents will have a width of 2
set expandtab       " Expand TABs to spaces


set hlsearch " After entering a search pattern, highlight all matches on screen
"set incsearch " Jump instantly to next matching string, re-jumping after each keystroke
set foldenable " allow folds
set foldopen-=block " when a fold is made, allow moving with "}" past the fold, without opening/deleting that fold

" Together, these 2 options give a nice autocomplete behavior for ed 
set wildmenu 
set wildmode=longest:full,full

set lazyredraw
set showmatch
set cursorline " show an underline for the current cursor position
set ruler " show file and line position info on bottom right
set autoindent
set smartindent
set laststatus=2
set ignorecase
set smartcase
set undofile
if !isdirectory($HOME. "/.vim/undodir")
  call mkdir($HOME . "/.vim/undodir", "p")
endif
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000
"set clipboard=unnamed
"set textwidth=100 "default is 78? 79? 80?
"set colorcolumn=80

"http://vimdoc.sourceforge.net/htmldoc/options.html#'autowrite'
"useful for :make, or <C-z>
set autowrite

" allows easy copy to tmux buffer by typing ":" before selecting
set mouse=nvi

" ex mode is basically useless, and we often get there accidentally, so disable it
map q: <Nop>
nnoremap Q <nop>

" change the speed of upward and downward scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nmap <TAB> mzi<CR><ESC>`z
nmap <CR> mzo<ESC>`z
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
nmap <SPACE> i<SPACE><ESC>
inoremap jk <ESC>
inoremap jK <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>
inoremap <C-z> <ESC><C-z>
nmap ' `

" * and # do not respect case sensitivity options, so remap them to literal
" searches
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

"yank to system clipboard (OS dependent behavior)
noremap <Leader>y "*y
noremap <Leader>p "*p

" Doesn't work yet ...
"nmap <C-s> :Update<CR>
"inoremap <C-s> <c-o>:Update<CR>
"vmap <C-s> <esc>:w<CR>gv

""when launching subshells using :shell or :i, use an interactive. Default value is shellcmdflag=-c
set shell=bash
"set shellcmdflag=-ic

"set makeprg=make\ clean\ test
"set makeef=~/tmp/vim-tmp/vim-error-file.##

" set behaviors to be invoked using :make
autocmd Filetype python setlocal makeprg=python3\ %
autocmd Filetype ocaml setlocal makeprg=make\ clean\ test
autocmd Filetype c setlocal makeprg=make\ clean\ test
autocmd Filetype text,markdown setlocal nocindent

autocmd Filetype go setlocal foldmethod=syntax
autocmd Filetype go setlocal foldnestmax=1
autocmd Filetype go setlocal foldlevel=99

" Commands for manipulating folds:
" To open a single fold under cursor: hit enter (or zo)
" To open all folds under the cursor: zO
" To close a single fold under cursor: zc
" To close all folds under cursor: zC
" 
" To open all folds in the file: zR
" To close all folds in the file: zM


" TODO - swap the role of ' and ` for jumping. Always preferrable to return to
" exact spot and ' is easier to reach

vnoremap <Leader>` <esc>:call QuickWrap('`')<cr>
vnoremap <Leader>' <esc>:call QuickWrap("'")<cr>
vnoremap <Leader>" <esc>:call QuickWrap('"')<cr>
vnoremap ( <esc>:call QuickWrap2('(',')')<cr>
vnoremap <Leader>{ <esc>:call QuickWrap2('{','}')<cr>
vnoremap [ <esc>:call QuickWrap2('[',']')<cr>
vnoremap x <esc>:call StripWrap()<cr>

function! StripWrap()
	  normal `>x`<x
endfunction

function! QuickWrap(wrapper)
  let l:w = a:wrapper
  let l:inside_or_around = (&selection == 'exclusive') ? ('i') : ('a')
  normal `>
  execute "normal " . inside_or_around . escape(w, '\')
  normal `<
  execute "normal i" . escape(w, '\')
  normal `<
endfunction

function! QuickWrap2(left, right)
  let l:left = a:left
  let l:right = a:right
  let l:inside_or_around = (&selection == 'exclusive') ? ('i') : ('a')
  normal `>
  execute "normal " . inside_or_around . escape(right, '\')
  normal `<
  execute "normal i" . escape(left, '\')
  normal `<
endfunction

" Some useful motions (not an exhaustive list or a detailed explanation of chords!)
" gg  top of file
" G   bottom of file
" gggqG     move to top, reformat until bottom
"
" da(   delete around the current enclosing parens
" ci(   delete inside current parens and enter insert mode
"
" dE   delete until the next whitespace
" cE   delete until next whitespace and enter insert mode
"
" .    repeat last sequence of actions (from when we entered insert mode until we left again)
" '.   jump to last edited line
" `.   jump to last edited position
"
" <C-]>   jump to definition (need to have generated a tags file using something like exuberant-ctags already)
" <C-t>   jump one level back in the tags stack
"
" <C-o>   jump to the last position, even across buffers
"
" <C-v>   enter visual block mode. After making a selection, do the following
" to make multiline edits:
"" I   
"" <make some changes>
"" ESC  followed

" ALE
nmap <Leader>b :ALEFix<CR>
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_virtualenv_dir_names = [$HOME . '/.venv']

let g:ale_fixers = {
\     '*': ['remove_trailing_lines', 'trim_whitespace'],
\     'python': ['yapf', 'isort'],
\     'json': ['jq'],
\}

let g:ale_linters = {
\     'python': ['flake8'],
\     'json': ['jsonlint'],
\}

" Keep gutter open always
" let g:ale_sign_column_always = 1

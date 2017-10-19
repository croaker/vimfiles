"" Initialization
set nocp
filetype off
set history=10000
set laststatus=2

"" Clipboard
set clipboard=unnamed

set backupdir=~/.vim/_backup    " where to put backup files.
set directory=~/.vim/_temp      " where to put swap files.

let mapleader=","

"" Matchit
runtime macros/matchit.vim

"" Plugins
call plug#begin('~/.vim/plugins')

Plug 'rking/ag.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/tpope-vim-abolish'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-textobj-user'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'nelstrom/vim-qargs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'keith/tmux.vim'
Plug 'drn/zoomwin-vim'
Plug 'jamessan/vim-gnupg'
Plug 'neomake/neomake'
Plug 'janko-m/vim-test'
Plug 'ctrlpvim/ctrlp.vim'

" Languages & syntax
Plug 'editorconfig/editorconfig-vim'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'sheerun/rspec.vim'
Plug 'tpope/vim-liquid'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'chr4/nginx.vim'
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

Plug 'othree/html5.vim'
Plug 'ap/vim-css-color'
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'

Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'elzr/vim-json'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'
Plug 'glanotte/vim-jasmine'
Plug 'mustache/vim-mustache-handlebars'

Plug 'lambdatoast/elm.vim'
Plug 'fatih/vim-go'
Plug 'elixir-lang/vim-elixir'
Plug 'rust-lang/rust.vim'

Plug 'jparise/vim-graphql'
Plug 'plasticboy/vim-markdown'
Plug 'lepture/vim-jinja'
Plug 'chrisbra/csv.vim'
Plug 'exu/pgsql.vim'
Plug 'tpope/vim-git'

call plug#end()

set background=light
color solarized

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set number
set relativenumber
set lazyredraw
set cursorline

let g:airline_powerline_fonts = 1

"" Mouse
set mouse=a

"" Whitespace and Files
set nowrap                               " don't wrap lines
set tabstop=2 shiftwidth=2               " a tab is two spaces
set expandtab                            " use spaces, not tabs (optional)
set backspace=indent,eol,start           " backspace through everything in insert mode
set autoindent

let &colorcolumn=81

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

"" Keymaps
" let's replace hash rockets with the new syntax
nnoremap <Leader>hr :%s/:\(\w\+\)\(\s*=>\s*\)/\1: /gc<CR>

" Strip trailing whitespace
nnoremap <Leader>ws :call StripTrailingWhitespaces()<CR>

" No fucking arrow-keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Neovim Terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Nerdtree
nnoremap <leader>nt :NERDTreeToggle<CR>

" Tmux Navigator
if has('nvim')
  set shell=$SHELL\ -l
  nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif

" Vim JSON
let g:vim_json_syntax_conceal = 0

" vim-test
if has('nvim')
  let test#strategy = "neovim"
else
  let test#strategy = "dispatch"
endif

nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

" Vim Go
let g:godef_split=0
let g:go_fmt_command='goimports'
let g:go_autodetect_gopath = 0

" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_interfaces = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1

map <Leader>d :GoDef<CR>
map <Leader>gr :GoRun<CR>

"" Neomake
autocmd! BufWritePost * Neomake

let g:neomake_ruby_rubocop_maker = {
    \ 'args': ['--format', 'emacs', '--force-exclusion', '--display-cop-names'],
    \ 'errorformat': '%f:%l:%c: %t: %m,%E%f:%l: %m',
    \ 'postprocess': function('neomake#makers#ft#ruby#RubocopEntryProcess')
    \ }
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']

" use the projects eslint if possible
function! NeomakeESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm-which')
    let l:eslint = split(system('npm-which eslint'))[-1]
  elseif executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[-1]

    if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
      let l:eslint = l:npm_bin . '/eslint'
    endif
  endif

  let b:neomake_javascript_eslint_exe = l:eslint
endfunction
autocmd FileType javascript :call NeomakeESlintChecker()

let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_error_sign = {
        \ 'text': '!',
        \ 'texthl': 'Title',
        \ }

let g:neomake_error_sign = {
        \ 'text': '●',
        \ 'texthl': 'Error',
        \ }


" Ruby
let ruby_operators = 1

" Tabularize stuff
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Rename file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" Inspect syntax group under cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Easier pasting
noremap <Leader>p "0p
vnoremap <Leader>p "0p
noremap <Leader>P "0P

" Removes trailing whitespace
fun! StripTrailingWhitespaces()
  let line = line(".")
  let col = col(".")
  let search = @/

  keepjumps %s/\s\+$//e

  let @/=search
  call cursor(line, col)
endfun

if has("autocmd")
  " j2 files are jinja templates
  au BufNewFile,BufRead *.j2 set ft=jinja

  " cap files are just rake files
  au BufNewFile,BufRead *.cap set ft=ruby

  " Treat various node configs as JavaScript
  au BufNewFile,BufRead .eslintrc,.babelrc set ft=javascript

  " Treat all JavaScript files as potentially containing JSX
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  au BufNewFile,BufRead *.js set filetype=javascript.jsx

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Makefiles and golang use real tabs, not tabs expanded to spaces
  au FileType make,go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

  " do not highlight special keys (annoying with real tabs)
  au FileType make,go,python :hi SpecialKey ctermbg=NONE guibg=NONE

  " make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Simplified Help
  au filetype help nnoremap <buffer><cr> <c-]>
  au filetype help nnoremap <buffer><bs> <c-T>
  au filetype help nnoremap <buffer>q :q<CR>
  au filetype help set nonumber

  " Remove trailing whitespace
  autocmd FileType ruby,javascript,coffee,eruby,c,cpp,java,php,vim autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " Close NERDTree if it's the last open window
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

" List chars
set listchars=""                  " Reset the listchars
set listchars+=tab:\ \ ,trail:.   " show tabs as spaces and trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set list

" provide some context when editing
set scrolloff=3

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
nnoremap <cr> :nohlsearch<cr>  " clear search on return

"" Open files in the dir of the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

"" remove fancy chars
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

"" CtrlP
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|bower_components|build|buck-out)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
map <leader>gv :CtrlP app/views<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gt :CtrlPTag<cr>
map <leader>f :CtrlP<cr>
map <leader>F :CtrlP %%<cr>

set wildignore+=vendor/*,build/*
set wildmode=longest,list
set wildmenu

"" Quickfix stuff
nnoremap <leader>q :ccl<cr>
nnoremap <leader>j :cnext<cr>
nnoremap <leader>k :cprev<cr>

"" Remove key delays
if(!has('nvim'))
  set noesckeys
  set ttimeout
  set ttimeoutlen=1
endif

"" Git Gutter
let g:gitgutter_enabled = 1

if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

"" Highlighting
hi clear SignColumn

hi def link jsObjectKey Label
hi link jsObjectBraces Constant
hi link jsClassProperty jsClassFuncName

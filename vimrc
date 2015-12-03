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

"" Bundles
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'rking/ag.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'kana/vim-textobj-user'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nelstrom/vim-qargs'
Plugin 'osyo-manga/vim-over'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/ZoomWin'
Plugin 'jamessan/vim-gnupg'

Plugin 'tpope/vim-dispatch'
Plugin 'thoughtbot/vim-rspec'

" Languages & syntax
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'

Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'groenewege/vim-less'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-markdown'
Plugin 'lepture/vim-jinja'
Plugin 'chrisbra/csv.vim'
Plugin 'fatih/vim-go'

call vundle#end()

set background=dark
color solarized

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set number
set relativenumber
set lazyredraw

let g:airline_powerline_fonts = 1

"" Keymaps
" let's replace hash rockets with the new syntax
nnoremap <Leader>hr :%s/:\(\w\+\)\(\s*=>\s*\)/\1: /gc<CR>

" Stript trailing whitespace
nnoremap <Leader>ws :call StripTrailingWhitespaces()<CR>

" Open a new tab
nnoremap <Leader>nt :tabnew<CR>

" No fucking arrow-keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" " rspec.vim
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "Dispatch bin/rspec {spec}"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Vim Go
let g:godef_split=0
let g:go_fmt_command='goimports'
let g:go_autodetect_gopath = 0

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

" Easier pasting
noremap <Leader>p "0p
vnoremap <Leader>p "0p
noremap <Leader>P "0P

"" Cursorline
hi CursorLine cterm=NONE term=NONE

"" Mouse
set mouse=a

"" Whitespace and Files
set nowrap                               " don't wrap lines
set tabstop=2 shiftwidth=2               " a tab is two spaces (or set this to 4)
set expandtab                            " use spaces, not tabs (optional)
set backspace=indent,eol,start           " backspace through everything in insert mode
set autoindent

let &colorcolumn=81

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

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
  "  In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab

  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " j2 files are jinja templates
  au BufNewFile,BufRead *.j2 set ft=jinja

  " cap files are just rake files
  au BufNewFile,BufRead *.cap set ft=ruby

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Simplified Help
  au filetype help nnoremap <buffer><cr> <c-]>
  au filetype help nnoremap <buffer><bs> <c-T>
  au filetype help nnoremap <buffer>q :q<CR>
  au filetype help set nonumber

  " Remove trailing whitespace
  autocmd FileType ruby,javascipt,coffee,eruby,c,cpp,java,php,vim autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " Close NERDTree if it's the last open window
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

" List chars
set listchars=""                  " Reset the listchars
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=tab:\ \
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

"" File selection
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_use_caching = 0

"" Jumping to files
map <leader>gv :CtrlP app/views<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>ga :CtrlP assets<cr>
map <leader>gs :CtrlP assets/stylesheets<cr>
map <leader>gj :CtrlP assets/javascripts<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gt :CtrlPTag<cr>
map <leader>f :CtrlP<cr>
map <leader>F :CtrlP %%<cr>

set wildignore+=vendor/*,build/*
set wildmode=longest,list
set wildmenu

"" Remove key delays
set noesckeys
set ttimeout
set ttimeoutlen=1

"" Git Gutter
let g:gitgutter_enabled = 1
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

"" Initialization
set nocp
filetype off

"" Clipboard
set clipboard=unnamed

set backupdir=~/.vim/_backup    " where to put backup files.
set directory=~/.vim/_temp      " where to put swap files.

let mapleader=","

set background=light
color solarized

"" Bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'git://git.wincent.com/command-t.git'
Bundle 'mileszs/ack.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-commentary'
Bundle 'ap/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-cucumber'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-markdown'
Bundle 'scrooloose/nerdtree'
Bundle 'mmalecki/vim-node.js'
Bundle 'ajf/puppet-vim'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'danro/rename.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'airblade/vim-gitgutter'
Bundle 'Align'

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set number

"" No fucking arrow-keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

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
let &colorcolumn=join(range(81,999),",") " Highlight line 80 and above

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

" Removes trailing whitespace
fun! <SID>StripTrailingWhitespaces()
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
  autocmd FileType ruby,javascipt,coffee,eruby,c,cpp,java,php,vim autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

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

"" Jumping to files
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . _ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction

map <leader>gr :call ShowRoutes()<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts
map <leader>gs :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

set wildignore+=vendor/*,build/*

let g:CommandTMaxHeight=15
let g:CommandTMaxFiles=20000
set ttimeoutlen=50

if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

"" Status- and Powerline
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar
  set statusline=%<%f\ [%{&ft}]\ %-4(%m%)%=%-19(%3l,%02c%03V%)
endif

"" Make :W behave the same as :w
cnoreabbrev W w

"" Make gitgutter's highlighting a little less painfull
highlight clear SignColumn

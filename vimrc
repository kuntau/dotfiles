set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Vundle help
""""""""""""""
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles


" VCS
Bundle 'tpope/vim-fugitive'

" System
" Bundle 'sophacles/vim-bundle-sparkup'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'vim-scripts/Gist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Rykka/colorv.vim'
Bundle 'mattn/webapi-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'

" Syntaxes and such.
" Bundle 'tpope/vim-cucumber'
" Bundle 'tpope/vim-liquid'
" Bundle 'tpope/vim-haml'
" Bundle 'groenewege/vim-less'
" Bundle 'jcf/vim-latex'
" Bundle 'mutewinter/nginx.vim'
" Bundle 'msanders/cocoa.vim'
" Bundle 'empanda/vim-varnish'
" Bundle 'atourino/jinja.vim'
" Bundle 'godlygeek/tabular'
" Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'leshill/vim-json'
Bundle 'tpope/vim-commentary'

" html, Javascript & css bundles
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'othree/html5.vim'
Bundle 'itspriddle/vim-jquery'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'mattn/emmet-vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'mklabs/grunt.vim'

" Python bundles
" Bundle 'nvie/vim-flake8'
" Bundle 'fs111/pydoc.vim'
" Bundle 'vim-scripts/python_match.vim'
" Bundle 'ehamberg/vim-cute-python'
Bundle 'jmcantrell/vim-virtualenv'

" Ruby specific
" Bundle 'vim-ruby/vim-ruby'
" Bundle 'tpope/vim-endwise'

" Fun, but not useful
" Bundle 'davidoc/taskpaper.vim'
" Bundle 'bling/vim-airline'  "alternative to powerline
Bundle 'altercation/vim-colors-solarized'
Bundle 'skammer/vim-css-color'
Bundle 'mgutz/vim-colors'
Bundle 'tpope/vim-speeddating'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'chriskempson/base16-vim'
Bundle 'chreekat/vim-paren-crosshairs'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/CSApprox'

" Misc bundle
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-commentary'

filetype plugin indent on     " required!

" Configurations
""""""""""""""""
set background=dark

" Wildmenu completion
"""""""""""""""""""""
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=**.class                         " Cursed Java class files

" Save when losing focus
set autowriteall " Auto-save files when switching buffers or leaving vim.
au FocusLost * silent! :wa
au TabLeave  * silent! :wa

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

if !has("gui_running")
    set term=xterm
    set t_Co=256
    " let &t_AB="\e[48;5;%dm"
    " let &t_AF="\e[38;5;%dm"
    colorscheme molokai

    " fix terminal timeout when pressing escape
    " set ttimeoutlen=10
    " augroup FastEscape
    "   autocmd!
    "   au InsertEnter * set timeoutlen=0
    "   au InsertLeave * set timeoutlen=1000
    " augroup END
else
    colorscheme molokai
endif

" Basic
syntax enable
set number               " always show line numbers
" set rnu                " show relative number instead
set hidden               " Allow un-saved buffers in background
set clipboard=unnamed    " Share system clipboard.
set backspace=indent,eol,start " Make backspace behave normally.
set noswapfile           " no swap files
set nobackup             " no backup files
set nowritebackup        " no undo files
set directory=/tmp//     " swap files
set backupskip=/tmp/*,/private/tmp/*
set ffs=unix,dos,mac     "Default file types
set nowrap               " don't wrap lines
set showmatch            " set show matching parenthesis
set ignorecase           " ignore case when searching
set smartcase            " ignore case if search pattern is all lowercase,
                         "  case-sensitive otherwise
set hlsearch             " highlight search terms
set incsearch            " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Remove the toolbar if we're running under a GUI (e.g. MacVIM).
if has("gui_running")
  set guioptions=-t
  if has('win32') || has('win64')
    set gfn=Consolas:h10                " font to use
  elseif has('mac') || has('macunix')
    " set gfn=Consolas\ for\ Powerline:h12
    set gfn=PragmataPro\ for\ Powerline:h12
  elseif has('gui_gtk2')
    set gfn=PragmataPro\ 10
    set lines=50 columns=100
  endif
endif

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:»\ ,trail:·

" Default Tabs & spaces
set tabstop=2     " a tab is four spaces
set shiftwidth=2  " number of spaces to use for autoindenting
set softtabstop=2
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  " shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

" General Code Folding
""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

" Highlight VCS conflict markers
""""""""""""""""""""""""""""""""
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" I CAN HAZ NORMAL REGEXES?
"""""""""""""""""""""""""""
nnoremap <space> /\v
vnoremap <space> /\v

" General auto-commands
"""""""""""""""""""""""
autocmd FileType * setlocal colorcolumn=0
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Get rid of trailing whitespace highlighting in mutt.
autocmd FileType mail highlight clear ExtraWhitespace
autocmd FileType mail setlocal listchars=

" Reformat XML files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Crontab auto-commands
"""""""""""""""""""""""
autocmd FileType crontab setlocal backupcopy=yes

" turn-on distraction free writing mode for markdown files
" au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call DistractionFreeWriting()

function! DistractionFreeWriting()
    colorscheme iawriter
    set background=light
    set gfn=Cousine:h14                " font to use
    set lines=60 columns=100           " size of the editable area
    set fuoptions=background:#00f5f6f6 " macvim specific setting for editor's background color
    set guioptions-=r                  " remove right scrollbar
    set laststatus=0                   " don't show status line
    set noruler                        " don't show ruler
    set fullscreen                     " go to fullscreen editing mode
    set linebreak                      " break the lines on words
endfunction

:map <F8> :call DistractionFreeWriting()<CR>

" Toggle spellcheck in normal mode
:map <F5> :setlocal spell! spelllang=en_us<CR>

" Ruby Configurations
"""""""""""""""""""""
autocmd filetype ruby setlocal noexpandtab shiftwidth=2 tabstop=2

" PHP Configurations
""""""""""""""""""""
autocmd FileType php setlocal colorcolumn=100

" HTML configurations
"""""""""""""""""""""
" autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" Python configurations
"""""""""""""""""""""""
autocmd FileType python setlocal shiftwidth=4 expandtab tabstop=4 softtabstop=4
autocmd FileType python setlocal colorcolumn=80
autocmd FileType python map <buffer> <F4> :call Flake8()<CR>
autocmd FileType python autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Coffeescript configurations
"""""""""""""""""""""""""""""
au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent
au BufNewFile,BufReadPost *.coffee setlocal shiftwidth=2 expandtab

" Javascript configurations
"""""""""""""""""""""""""""
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab

" Puppet configurations
"""""""""""""""""""""""
au FileType puppet setlocal noexpandtab

" Get jinja filetype selection working correctly for *.jinja.html files.
au BufNewFile,BufReadPost *.jinja.html setlocal filetype=htmljinja

" Make sure we hilight extra whitespace in the most annoying way possible.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Custom mappings
""""""""""""""""""

" Genral
noremap <silent> <F4> :QFix<CR>

" Change leader
let mapleader = ","
let g:mapleader = ","

" Get rid of search hilighting with ,/
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null

" Core fix -Kuntau-
nmap ; :
noremap 0 ^
noremap <leader>ei :e$MYVIMRC<CR>

" give me normal jk!!
map j gj
map k gk

" use delete move without storing to register
" noremap X "_X
" noremap x "_x
" noremap dw "_dw
" noremap dW "_dW
" noremap de "_de
" noremap dE "_dE
" noremap dd "_dd
" noremap d "_d

" Easier movement and copy paste combo
noremap H ^
noremap L $
noremap yp yyp
noremap yP yyP
noremap yd yydd

" Line mod time saver
nnoremap <enter> i<enter><esc>
nnoremap <down> m`o<esc>``
nnoremap <up> m`O<esc>``

" Escape key mapping
inoremap jj <Esc>
inoremap <F1> <Esc>
nnoremap <F1> <Esc>
vnoremap <F1> <Esc>

" insert mode movement mapping
inoremap <c-j> <Esc>^o
inoremap <c-k> <Esc>^O

" Match tag
map <c-space> %

" Smart way to move btw. windows
map <c-tab> <c-w>w
map <c-j> <C-W>j
map <c-k> <C-W>k
map <c-h> <C-W>h
map <c-l> <C-W>l

" faster way to terminate the line
inoremap <c-e> <esc>A;<esc>

" Working with split windows
nnoremap <leader>vs <C-w>v<C-w>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
" map <right> :bn<cr>
" map <left>  :bp<cr>

" Tab configuration
map <Tab> :tabnext<cr>
map <s-Tab> :tabprev<cr>
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <d-j> <m-j>
  nmap <d-k> <m-k>
  vmap <d-j> <m-j>
  vmap <d-k> <m-k>
endif

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Plugin configurations
"""""""""""""""""""""""

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 2
let g:gist_show_privates = 1

" TaskList
map <leader>l <Plug>TaskList

" TagBar
nnoremap <silent> <F2> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1

" crtl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules'

" NERDTreeTabs
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_new_tab = 0

" NERDTree
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <leader>cd :NERDTreeCWD<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeBookmarksFile=$HOME.'/.vim/.NERDTreeBookmarks'
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1
let NERDChristmasTree=0

" SnipMate
let g:snippets_dir = "~/.vim/bundle/snipmate-snippets"

" Jedi
let g:jedi#goto_command = "<leader>g"

" Double rainbow - What does it mean!?
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Syntastic settings
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 0
let g:syntastic_puppet_lint_disable = 0
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_css_checkers = ['csslint']

" Powerline & airline
set noshowmode      " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2    " Always dislay the statusline in all windows
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" CSApprox
let g:CSApprox_loaded = 1

" Useful functions
""""""""""""""""""

" Delete trailing white space on save, useful for Python, CoffeeScript & Jade
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z`"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.jade :call DeleteTrailingWS()

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


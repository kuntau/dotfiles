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
" Bundle 'mattn/livestyle-vim'
" Bundle 'flomotlik/vim-livereload'
" Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" Bundle 'vim-scripts/Gist.vim'
Bundle 'majutsushi/tagbar'
" Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Rykka/colorv.vim'
Bundle 'mattn/webapi-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'joequery/Stupid-EasyMotion'
Bundle 'danro/rename.vim'
" Bundle 'Yggdroot/indentLine'

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
" Bundle 'puppetlabs/puppet-syntax-vim'
" Bundle 'scrooloose/nerdcommenter'
" Bundle 'tpope/vim-commentary'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'godlygeek/tabular'

" html, Javascript & css bundles
Bundle 'leshill/vim-json'
Bundle 'kchmck/vim-coffee-script'
" Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-markdown'
Bundle 'othree/html5.vim'
Bundle 'itspriddle/vim-jquery'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'mattn/emmet-vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'mklabs/grunt.vim'
Bundle 'ap/vim-css-color'
Bundle 'Valloric/MatchTagAlways'

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
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'mgutz/vim-colors'
Bundle 'tpope/vim-speeddating'
Bundle 'chriskempson/base16-vim'
Bundle 'chreekat/vim-paren-crosshairs'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/CSApprox'

" Misc bundle
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'wesQ3/vim-windowswap'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rizzatti/dash.vim'

filetype plugin indent on     " required!

" Configurations
""""""""""""""""
if !has("gui_running")
    " set term=xterm-256color
    " set t_Co=256
    " let &t_AB="\e[48;5;%dm"
    " let &t_AF="\e[38;5;%dm"
    " let g:molokai_original=1
    " let g:rehash256=1
    set background=dark
    colorscheme molokai

    " fix terminal timeout when pressing escape
    set ttimeout
    set ttimeoutlen=10
    augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
    augroup END
else
    colorscheme molokai
endif

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

" Basic
syntax enable
set rnu                " show relative number instead
set number               " always show line numbers
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
    set gfn=PragmataPro\ for\ Powerline:h12
  elseif has('gui_gtk2')
    set gfn=PragmataPro\ 9
    " set lines=50 columns=100
  endif
endif

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:»\ ,trail:·

" Change vertical character so we don't get that ugly pane separator
set fillchars+=vert:\ 

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
nnoremap / /\v
vnoremap / /\v

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

" Ruby Configurations
"""""""""""""""""""""
autocmd filetype ruby setlocal noexpandtab shiftwidth=2 tabstop=2

" PHP Configurations
""""""""""""""""""""
autocmd FileType php setlocal colorcolumn=100

" HTML configurations
"""""""""""""""""""""
" autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
au BufNewFile,BufReadPost *.html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" CSS configurations
"""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
au BufNewFile,BufReadPost *.css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Javascript configurations
"""""""""""""""""""""""""""
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab

" Coffeescript configurations
"""""""""""""""""""""""""""""
au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent shiftwidth=2 expandtab
autocmd FileType coffeescript setlocal colorcolumn=80

" Python configurations
"""""""""""""""""""""""
autocmd FileType python setlocal shiftwidth=4 expandtab tabstop=4 softtabstop=4
autocmd FileType python setlocal colorcolumn=80
autocmd FileType python map <buffer> <F4> :call Flake8()<CR>
autocmd FileType python autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType python set omnifunc=pythoncomplete#Complete

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
""""""""""""""""""

" Toggle comment shorthand
" noremap <leader>cc :TComment<CR>

" Genral
noremap <silent> <F4> :QFix<CR>

" Change leader
let mapleader = ","
let g:mapleader = ","

" Get rid of search hilighting with ,/
nnoremap <silent> <leader><space> :nohlsearch<CR>

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null

" Core fix -Kuntau-
" use space instead of ';'
noremap <space> :
" noremap ; :
" noremap : ;
noremap <leader>ei :e$MYVIMRC<CR>
noremap <leader>so :w!<cr> :so %<CR>

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
noremap 0 0
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
inoremap jj <esc>

" insert mode movement mapping
inoremap <c-j> <esc>^o
inoremap <c-k> <esc>^O
inoremap <c-e> <esc>A
inoremap <c-a> <esc>I

" faster way to terminate the line
" inoremap <c-e> <esc>A;<esc>

" Match tag
map <c-space> %

" Working with split windows
nnoremap <leader>vs <C-w>v<C-w>l
nnoremap <tab> <c-w>w
" noremap <c-j> <C-w>j
" noremap <c-k> <C-w>k
" noremap <c-h> <C-w>h
" noremap <c-l> <C-w>l
noremap <c-w>< <c-w>10<
noremap <c-w>> <c-w>10>
noremap <c-w>+ <c-w>10+
noremap <c-w>- <c-w>10-
" noremap <c-left>  <c-w>10<
" noremap <c-right> <c-w>10>
" noremap <c-up>    <c-w>10+
" noremap <c-down>  <c-w>10-

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
noremap <right> :bn<cr>
noremap <left>  :bp<cr>

" Retain selection after indent or formating
" Use `gv` if we want to reselect
" vmap > >gv
" vmap < <gv
" vmap = =gv

" Tab configuration; not using tab currently
" map <c-Tab> :tabnext<cr>
" map <s-Tab> :tabprev<cr>
" map <leader>tn :tabnew<cr>
" map <leader>te :tabedit
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" nmap <a-j> mz:m+<cr>`z
" nmap <a-k> mz:m-2<cr>`z
" vmap <a-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <a-k> :m'<-2<cr>`>my`<mzgv`yo`z
" imap <a-j> <Esc>:m .+1<CR>==gi
" imap <a-k> <Esc>:m .-2<CR>==gi

" Alternate version which don't use bookmark
nnoremap <m-j> :m .+1<CR>==
nnoremap <m-k> :m .-2<CR>==
vnoremap <m-j> :m '>+1<CR>gv=gv
vnoremap <m-k> :m '<-2<CR>gv=gv
inoremap <m-j> <Esc>:m .+1<CR>==gi
inoremap <m-k> <Esc>:m .-2<CR>==gi

" make it cross platform
if has("mac") || has("macunix")
  nmap <d-j> <m-j>
  nmap <d-k> <m-k>
  vmap <d-j> <m-j>
  vmap <d-k> <m-k>
  " noremap <d-right> <m-right>
  " noremap <d-left> <m-left>
  " noremap <d-up> <m-up>
  " noremap <d-down> <m-down>
endif

" When pressing <leader>cd switch to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
noremap <leader>sp :setlocal paste!<cr>
noremap <F2> :set paste!<cr>
" noremap <leader>pp "+p
" noremap <leader>pP "+P

" Plugin configurations
"""""""""""""""""""""""

" Let ack.vim use ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 2
let g:gist_show_privates = 1

" TaskList
" map <leader>l <Plug>TaskList

" TagBar
nnoremap <silent> <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1

" crtl-p
let g:ctrlp_map = '<c-p>'
" use ag with ctrlp
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git/', 'cd %s && git ls-files --exclude-standard -co'],
    \ },
  \ 'fallback': 'ag %s -l --nocolor --hidden -g ""'
  \ }
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename  = 0
let g:ctrlp_switch_buffer  = 'Et'
" let g:ctrlp_custom_ignore = '\v(node_modules|bower_components|components)$'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

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
" let g:jedi#goto_command = "<leader>g"

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

" Javascript-libraries-syntax
let g:used_javascript_libs = 'jquery, underscore, angularjs'

" Indent Guides
" let g:indent_guides_guide_size = 1
" let g:indent_guides_indent_levels = 3
" let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" IndentLine
let g:indentLine_color_term = 245
let g:indentLine_color_gui = '#A4E57E'
" let g:indentLine_char = '┊'
" let g:indentLine_char = '┆'
" let g:indentLine_char = '⁞'
let g:indentLine_char = '⋮'
" http://unicode-table.com/en/search/?q=dash

" Plasticboy Markdown
let g:vim_markdown_folding_disabled = 1

" Vim Tmux Navigator
let g:tmux_navigator_no_mappings = 1
noremap <silent> <c-j> :TmuxNavigateDown<cr>
noremap <silent> <c-k> :TmuxNavigateUp<cr>
noremap <silent> <c-h> :TmuxNavigateLeft<cr>
noremap <silent> <c-l> :TmuxNavigateRight<cr>

" Emmet Vim
" let g:user_emmet_mode='a'
" let g:user_emmet_leader_key= '<c-y>'

" Dash plugin
nmap <silent> <leader>d <plug>DashSearch

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
autocmd BufWrite *.styl :call DeleteTrailingWS()

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

" Highlight repeat!
function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

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

" :map <F8> :call DistractionFreeWriting()<CR>

" Toggle spellcheck in normal mode
" :map <F5> :setlocal spell! spelllang=en_us<CR>

" Ag: The Silver Searcher
if executable('ag')
  "use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  "ag is fast enough to let ctrlp not use cache
  " let g:ctrlp_use_caching = 0
endif

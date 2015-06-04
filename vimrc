set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!

" Plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

" Plug help
""""""""""""""
" :PlugStatus          - list configured bundles
" :PlugInstall(!)    - install(update) bundles
" :PlugUpdate - search(or refresh cache first) for foo
" :PlugClean(!)      - confirm(or auto-approve) removal of unused bundles


" VCS
Plug 'tpope/vim-fugitive'

" System
" Plug 'sophacles/vim-bundle-sparkup'
" Plug 'mattn/livestyle-vim'
" Plug 'flomotlik/vim-livereload'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'jistr/vim-nerdtree-tabs'
" Plug 'vim-scripts/Gist.vim'
Plug 'majutsushi/tagbar' ", { 'on': 'TagbarToggle' }
" Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
" Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mattn/webapi-vim'
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'terryma/vim-multiple-cursors'
Plug 'joequery/Stupid-EasyMotion'
Plug 'danro/rename.vim'
" Plug 'Yggdroot/indentLine'

" Syntaxes and such.
" Plug 'tpope/vim-cucumber'
" Plug 'tpope/vim-liquid'
" Plug 'tpope/vim-haml'
Plug 'groenewege/vim-less', { 'for': [ 'less' ] }
" Plug 'jcf/vim-latex'
Plug 'mutewinter/nginx.vim', { 'for': 'conf' }
" Plug 'msanders/cocoa.vim'
" Plug 'empanda/vim-varnish'
" Plug 'atourino/jinja.vim'
" Plug 'puppetlabs/puppet-syntax-vim'
" Plug 'scrooloose/nerdcommenter'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/vim-easy-align'
" Plug 'godlygeek/tabular'

" html, Javascript & css bundles
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json', { 'for': 'json' }
Plug 'kchmck/vim-coffee-script', { 'for': [ 'coffee' ] }
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'tpope/vim-markdown'
Plug 'othree/html5.vim'
" Plug 'itspriddle/vim-jquery'
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'wavded/vim-stylus', { 'for': 'styl' }
Plug 'mattn/emmet-vim'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'js' }
" Plug 'mklabs/grunt.vim'
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'Valloric/MatchTagAlways', { 'for': [ 'html', 'xml' ] }
Plug 'marijnh/tern_for_vim', { 'on': [] }

" Python bundles
" Plug 'nvie/vim-flake8'
" Plug 'fs111/pydoc.vim'
" Plug 'vim-scripts/python_match.vim'
" Plug 'ehamberg/vim-cute-python'
" Plug 'jmcantrell/vim-virtualenv'

" Ruby specific
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-endwise'

" Fun, but not useful
" Plug 'Rykka/colorv.vim' " add 180ms startup time
" Plug 'davidoc/taskpaper.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plug 'mgutz/vim-colors'
" Plug 'tpope/vim-speeddating'
" Plug 'chriskempson/base16-vim'
Plug 'chreekat/vim-paren-crosshairs'
Plug 'tomasr/molokai'
" Plug 'vim-scripts/CSApprox'
" Plug 'yearofmoo/Vim-Darkmate'

" Misc bundle
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'Valloric/YouCompleteMe', { 'on': [] }
Plug 'SirVer/ultisnips', { 'on': [] } | Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wesQ3/vim-windowswap'
Plug 'rizzatti/dash.vim', { 'on': [ 'Dash', 'DashSearch' ] }

call plug#end()

filetype plugin indent on     " required!

" Configurations
""""""""""""""""
if !has("gui_running")
    " set term=xterm-256color
    " set t_Co=256
    " let &t_AB="\e[48;5;%dm"
    " let &t_AF="\e[38;5;%dm"
    let g:molokai_original=1
    " let g:solarized_termcolors=256
    " let g:rehash256=1
    colorscheme molokai
    set background=dark

    " fix terminal timeout when pressing escape
    " set ttimeout
    set ttimeoutlen=50
    " augroup FastEscape
    "   autocmd!
    "   au InsertEnter * set timeoutlen=0
    "   au InsertLeave * set timeoutlen=1000
    " augroup END
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
set rnu                  " show relative number instead
set number               " always show line numbers
set hidden               " Allow un-saved buffers in background
set clipboard=unnamed    " Share system clipboard.
set backspace=indent,eol,start " Make backspace behave normally.
set noswapfile           " no swap files
set nobackup             " no backup files
set nowritebackup        " no undo files
set directory=/tmp//     " swap files
set backupskip=/tmp/*,/private/tmp/*
set ffs=unix,dos,mac     " Default file types
set nowrap               " don't wrap lines
set showmatch            " set show matching parenthesis
set ignorecase           " ignore case when searching
set smartcase            " ignore case if search pattern is all lowercase,
                         " case-sensitive otherwise
set hlsearch             " highlight search terms
set incsearch            " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" More settings borrowed from gh.com/tarruda/dot-files/
set showcmd              " display incomplete command
set completeopt=menu,menuone,longest
set complete=.,w,b,u,t   " h: 'complete'
set pumheight=15         " limit completion menu height
set splitbelow           " put horizontal split below
set splitright           " put vertical split below
set modelines=0          " running code in comments is not cool
set matchtime=2          " time in decisecons to jump back from matching brackets
set synmaxcol=500        " maximum length to apply syntax highlight

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
" set gfn=PragmataPro\ for\ Powerline:h12

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:»\ ,trail:·
set fillchars+=vert:\     " fix ugly vertical pane separator

" Default Tabs & spaces
set tabstop=2     " a tab is two spaces
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
set nofoldenable          " don't fold by default
set foldlevel=99
set foldnestmax=10        " max fold nest

" Highlight VCS conflict markers
""""""""""""""""""""""""""""""""
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" I CAN HAZ NORMAL REGEXES?
"""""""""""""""""""""""""""
" nnoremap / /\v
" vnoremap / /\v

" General auto-commands
"""""""""""""""""""""""
autocmd FileType * setlocal colorcolumn=100
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
autocmd FileType javascript setlocal colorcolumn=80
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab

" Coffeescript configurations
"""""""""""""""""""""""""""""
au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent shiftwidth=2 expandtab
autocmd FileType coffeescript setlocal colorcolumn=100

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
noremap <space> :
noremap <leader>ei :e$MYVIMRC<CR>
noremap <leader>so :w!<cr> :source %<CR>

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
" inoremap jj <esc>

" insert mode movement mapping
inoremap <c-j> <esc>^o
inoremap <c-k> <esc>^O
inoremap <c-e> <esc>A
inoremap <c-a> <esc>I

" faster way to terminate the line
" inoremap <c-e> <esc>A;<esc>

" Match tag
" map <c-space> %

" Working with split windows
" nnoremap <leader>vs <C-w>v<C-w>l
" nnoremap <leader>ss <C-w>s
" nnoremap <leader>vv <C-w>v
nnoremap <c-w>\| <c-w>v
nnoremap <c-w>\- <c-w>s
nnoremap <tab> <c-w>w
" noremap <c-j> <C-w>j
" noremap <c-k> <C-w>k
" noremap <c-h> <C-w>h
" noremap <c-l> <C-w>l
noremap <c-w>< <c-w>10<
noremap <c-w>> <c-w>10>
" noremap <c-w>+ <c-w>10+
" noremap <c-w>- <c-w>10-
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
" noremap <F2> :set paste!<cr>
set pastetoggle=<F2>
" noremap <leader>pp "+p
" noremap <leader>pP "+P

" Plugin configurations
"""""""""""""""""""""""

" Let ack.vim use ag instead of ack
" if exists(":Ack")
  let g:ackprg = 'ag --nogroup --nocolor --column'
" endif

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 2
let g:gist_show_privates = 1

" TaskList
" map <leader>l <Plug>TaskList

" if exists(":TagBar")
  nnoremap <silent> <F3> :TagbarToggle<CR>
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
  let g:tagbar_autoshowtag = 1
  let g:tagbar_autofocus = 1
" endif

" if exists(":Tabularize")
  " nmap <Leader>a= :Tabularize /=<CR>
  " vmap <Leader>a= :Tabularize /=<CR>
  " nmap <Leader>a: :Tabularize /:\zs<CR>
  " vmap <Leader>a: :Tabularize /:\zs<CR>
" endif

" if exists(":vim-easy-align")
  vmap <Enter> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
" endif

" crtl-p
" if exists(":CtrlP")
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
" endif

" NERDTreeTabs
" if exists(":NERDTree")
  let g:nerdtree_tabs_open_on_gui_startup = 0
  let g:nerdtree_tabs_open_on_console_startup = 0
  let g:nerdtree_tabs_open_on_new_tab = 0
" endif

" NERDTree
" if exists(":NERDTreeTabsToggle")
  nnoremap <Leader>f :NERDTreeToggle<CR>
  nnoremap <leader>cd :NERDTreeCWD<CR>
  nnoremap <leader>nf :NERDTreeFind<CR>
  let NERDTreeBookmarksFile=$HOME.'/.vim/.NERDTreeBookmarks'
  let NERDTreeDirArrows=1
  let NERDTreeMinimalUI=1
  let NERDTreeShowBookmarks=1
  let NERDChristmasTree=0
" endif

" SnipMate
" let g:snippets_dir = "~/.vim/bundle/snipmate-snippets"

" make YCM compatible with UltiSnips (using supertab)
" if exists(":YcmDiags")
  let g:ycm_key_list_select_completion = ['<C-n>']
  let g:ycm_key_list_previous_completion = ['<C-p>']
  " let g:SuperTabDefaultCompletionType = '<C-n>'
" endif

" UltiSnips
" if exists(":UltiSnipsEdit")
  " let g:UltiSnipsExpandTrigger='<tab>'
  " let g:UltiSnipsJumpForwardTrigger='<tab>'
  " let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
  let g:UltiSnipsEditSplit='vertical'
  let g:UltiSnipsSnippetDirectory=['bundle/vim-snippets/UltiSnips']
  " let g:UltiSnipsListSnippets='<NUL>'
" endif

" UltiSnipsLazyLoad
  " augroup LazyLoadUltiSnips
  "   autocmd!
  "   autocmd InsertEnter * call plug#load('ultisnips') |
  "         \ call UltiSnips#ExpandSnippet() |
  "         \ autocmd! LazyLoadUltiSnips
  " augroup END

  augroup load_us_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe', 'tern_for_vim')
                      \| call youcompleteme#Enable() | autocmd! load_us_ycm
  augroup END

  " inoremap <silent> <NUL> <c-r>=LoadUltiSnips()<cr>
  " function! LoadUltiSnips()
  "   let l:curpos = getcurpos()
  "   execute plug#load('ultisnips')
  "   call cursor(l:curpos[1], l:curpos[2])
  "   call UltiSnips#ExpandSnippet()
  "   return ""
  " endfunction
" endif

" Jedi
" let g:jedi#goto_command = "<leader>g"

" Double rainbow - What does it mean!?
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Syntastic settings
" if exists(":SyntasticInfo")
  nmap <leader>sy :SyntasticToggleMode<cr>
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_enable_signs = 1
  let g:syntastic_auto_jump = 0
  let g:syntastic_error_symbol = "✗"
  let g:syntastic_warning_symbol = "⚠"
  let g:syntastic_style_error_symbol = '✠'
  let g:syntastic_style_warning_symbol = '≈'
  " let g:syntastic_javascript_checkers = ['jshint', 'jscs']
  let g:syntastic_javascript_checkers = []
  let g:syntastic_coffee_checkers = ['coffeelint']
  let g:syntastic_css_checkers = ['csslint']
  let g:syntastic_html_tidy_exec = 'tidy5'
  " let g:syntastic_html_checkers = ['tidy']
  let g:syntastic_html_tidy_ignore_errors = [
    \' proprietary attribute "ng-',
    \'proprietary attribute "ui-',
    \'<ng-',
    \'</ng-'
    \]
" endif

" Powerline & airline
set noshowmode      " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2    " Always dislay the statusline in all windows
" if exists("g:airline_powerline_fonts")
" if exists(":AirlineToggle") || exists(":PowerlineToggle")
  let g:Powerline_symbols = 'fancy'
  let g:airline_powerline_fonts = 1
" endif

" if exists("g:airline_symbols")
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols = "\ua0"

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
" let g:vim_markdown_folding_disabled = 1

" Vim Tmux Navigator
" if exists(":TmuxNavigateUp")
  " let g:tmux_navigator_no_mappings = 1
  " nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
  " nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
  " nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
  " nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
  if has('nvim')
    nmap <BS> <C-W>h
    " nmap <BS> :TmuxNavigateLeft<cr>
  endif
" else
"   noremap <c-j> <c-w>j
"   noremap <c-k> <c-w>k
"   noremap <c-h> <c-w>h
"   noremap <c-l> <c-w>l
" endif

" Emmet Vim
" if exists(":Emmet")
  let g:user_emmet_mode='inv'
  " let g:user_emmet_leader_key='<c-y>'
" endif

" Dash plugin
" if exists(":Dash")
  nmap <silent> <leader>d <plug>DashSearch
" endif

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

" YCM+UltiSnips: The best combo
" See: https://github.com/Valloric/YouCompleteMe/issues/36
" function! g:UltiSnips_Complete()
"     call UltiSnips#ExpandSnippet()
"     if g:ulti_expand_res == 0
"         if pumvisible()
"             return "\<C-n>"
"         else
"             call UltiSnips#JumpForwards()
"             if g:ulti_jump_forwards_res == 0
"                return "\<TAB>"
"             endif
"         endif
"     endif
"     return ""
" endfunction

" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise

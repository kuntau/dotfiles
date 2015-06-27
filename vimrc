set encoding=utf-8
set nocompatible               " be iMproved

filetype off                   " required!

" Plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" set rtp+=~/.fzf
call plug#begin('~/.vim/bundle')

" Plug help
""""""""""""""
" :PlugStatus          - list configured bundles
" :PlugInstall(!)    - install(update) bundles
" :PlugUpdate - search(or refresh cache first) for foo
" :PlugClean(!)      - confirm(or auto-approve) removal of unused bundles


" VCS
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'

" System
if executable('fzf') && !has('gui_running')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
else
  Plug 'ctrlpvim/ctrlp.vim'
endif
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar' ", { 'on': 'TagbarToggle' }
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'mattn/webapi-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'joequery/Stupid-EasyMotion'
Plug 'danro/rename.vim'
Plug 'Valloric/YouCompleteMe', { 'on': [] }
Plug 'SirVer/ultisnips', { 'on': [] } | Plug 'honza/vim-snippets'
Plug 'tpope/vim-rsi'
" Plug 'rking/ag.vim'
" Plug 'ervandew/supertab'

" Syntaxes and such.
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/vim-easy-align'
Plug 'groenewege/vim-less'
Plug 'mutewinter/nginx.vim'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-haml'
Plug 'jcf/vim-latex'
Plug 'msanders/cocoa.vim'
Plug 'empanda/vim-varnish'
Plug 'atourino/jinja.vim'
Plug 'puppetlabs/puppet-syntax-vim'

" html, Javascript & css bundles
Plug 'marijnh/tern_for_vim', { 'on': [], 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'itspriddle/vim-jquery', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'kchmck/vim-coffee-script', { 'for': [ 'coffeescript' ] }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'Valloric/MatchTagAlways', { 'for': [ 'html', 'xml' ] }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'mklabs/grunt.vim'

" Python bundles
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'fs111/pydoc.vim', { 'for': 'python' }
Plug 'vim-scripts/python_match.vim', { 'for': 'python' }
Plug 'ehamberg/vim-cute-python', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }

" Ruby specific
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }

" Fun, but not useful
Plug 'bling/vim-airline'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'chreekat/vim-paren-crosshairs'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim'
" Plug 'mgutz/vim-colors'
" Plug 'tpope/vim-speeddating'
" Plug 'vim-scripts/CSApprox'
" Plug 'Rykka/colorv.vim' " add 180ms startup time
" Plug 'davidoc/taskpaper.vim'

" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'flazz/vim-Colorschemes'
" Plug 'goatslacker/mango.vim'

" Misc bundle
Plug 'junegunn/vim-peekaboo'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wesQ3/vim-windowswap'
Plug 'rizzatti/dash.vim', { 'on': [ 'Dash', 'DashSearch' ] }
" Plug 'mattn/livestyle-vim'
" Plug 'flomotlik/vim-livereload'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Yggdroot/indentLine'

call plug#end()

filetype plugin indent on     " required!

" Configurations
""""""""""""""""
if !has("gui_running")
    " set term=xterm-256color
    " set t_Co=256
    " let &t_AB="\e[48;5;%dm"
    " let &t_AF="\e[38;5;%dm"
    " let g:molokai_original=1
    " let g:solarized_termcolors=256
    " let g:rehash256=1
    colorscheme molokai
    set background=dark

    " fix terminal timeout when pressing escape
    " set ttimeout
    " set ttimeoutlen=50
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
set wildignore+=.hg,.git,.svn,.idea              " Version control
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
" noremap <silent> <F4> :QFix<CR>

" Change leader
let localleader = ","
let mapleader = ","
let g:mapleader = ","

" Get rid of search hilighting with ,/
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null

" Core fix -Kuntau-
noremap <space> :
noremap <leader>ei :vsplit ~/dotfiles/vimrc<CR>
noremap <leader>so :w!<cr> :source %<CR>

" give me normal jk!! ** should enable with softwrap only **
" map j gj
" map k gk

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
" NOTE: Most of this was replaced by vim-rsi
inoremap <c-j> <C-o>o
inoremap <c-k> <C-o>O

" Match tag
map <c-space> %

" Working with split windows
map <c-tab> <c-w>w
map <c-s-tab> <c-w>W
nnoremap <c-w>\| <c-w>v
nnoremap <c-w>- <c-w>s
noremap <c-w>< <c-w>10<
noremap <c-w>> <c-w>10>
" noremap <c-w>+ <c-w>10+
" noremap <c-w>- <c-w>10-
noremap <m-left>  <c-w>10<
noremap <m-right> <c-w>10>
noremap <m-up>    <c-w>10+
noremap <m-down>  <c-w>10-
noremap <d-left>  <m-left>
noremap <d-right> <m-right>
noremap <d-up>    <m-up>
noremap <d-down>  <m-down>

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
" nmap <m-j> mz:m+<cr>`z
" nmap <m-k> mz:m-2<cr>`z
" vmap <m-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <m-k> :m'<-2<cr>`>my`<mzgv`yo`z
" imap <m-j> <Esc>:m .+1<CR>==gi
" imap <m-k> <Esc>:m .-2<CR>==gi

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
" noremap <leader>sp :setlocal paste!<cr>
noremap <F2> :set paste!<cr>
" set pastetoggle=<F2>
" noremap <leader>pp "+p
" noremap <leader>pP "+P

" Plugin configurations
"""""""""""""""""""""""

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

" ----------------------------------------------------------------------------
" {{{ FZF
" ----------------------------------------------------------------------------
if executable('fzf') && !has('gui_running')
  if has('nvim')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
  endif
  nnoremap <silent> <c-p> :FZF<CR>
  " nnoremap <silent> <c-p> :FZF %:p:h<CR>

  " Choose color scheme
  " ----------------------------------------------------------------------------
  nnoremap <silent> <Leader>fc :call fzf#run({
  \   'source':
  \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
  \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
  \   'sink':     'colo',
  \   'options':  '+m',
  \   'left':     30,
  \ })<CR>

  " Select buffer
  " ----------------------------------------------------------------------------
  function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
  endfunction

  function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
  endfunction

  nnoremap <silent> <Leader>fb :call fzf#run({
  \   'source':  reverse(<sid>buflist()),
  \   'sink':    function('<sid>bufopen'),
  \   'options': '+m --prompt="Buf> "',
  \   'down':    len(<sid>buflist()) + 2
  \ })<CR>

  " Search in buffer
  " ----------------------------------------------------------------------------
  function! s:line_handler(l)
    let keys = split(a:l, ':\t')
    exec 'buf' keys[0]
    exec keys[1]
    normal! ^zz
  endfunction

  function! s:buffer_lines()
    let res = []
    for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
      call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
    endfor
    return res
  endfunction

  noremap <silent> <Leader>fs :FZFLines<CR>
  command! FZFLines call fzf#run({
  \   'source':  <sid>buffer_lines(),
  \   'sink':    function('<sid>line_handler'),
  \   'options': '--extended --nth=3..',
  \   'down':    '60%'
  \})

  command! -nargs=1 Locate call fzf#run(
        \ {'source': 'locate <q-args>', 'sink': 'e', 'options': '-m'})

  " Ag
  " ----------------------------------------------------------------------------
  function! s:ag_handler(lines)
    if len(a:lines) < 2 | return | endif

    let [key, line] = a:lines[0:1]
    let [file, line, col] = split(line, ':')[0:2]
    let cmd = get({'ctrl-x': 'split', 'ctrl-v': 'vertical split', 'ctrl-t': 'tabe'}, key, 'e')
    execute cmd escape(file, ' %#\')
    execute line
    execute 'normal!' col.'|zz'
  endfunction

  command! -nargs=1 Ag call fzf#run({
  \ 'source':  'ag --nogroup --column --color "'.escape(<q-args>, '"\').'"',
  \ 'sink*':    function('<sid>ag_handler'),
  \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --no-multi --color hl:68,hl+:110',
  \ 'down':    '50%'
  \ })

  " MRU search
  " ----------------------------------------------------------------------------
  noremap <silent> <Leader>fm :FZFMru<CR>
  command! FZFMru call fzf#run({
              \'source': v:oldfiles,
              \'sink' : 'e ',
              \'options' : '-m',
              \})

else
  " fallback to CTRLP if FZF not found in system or we are running on GUI
  let g:ctrlp_map = '<c-p>'
  " use ag with ctrlp
  " let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }
  " let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
  let g:ctrlp_user_command = {
    \ 'types': {
    \ 1: ['.git/', 'cd %s && git ls-files --exclude-standard -co'],
    \ },
    \ 'fallback': 'ag %s -l --nocolor --hidden -g ""'
    \ }
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_lazy_update = 350
  let g:ctrlp_clear_cache_on_exit = 0
  let g:ctrlp_max_files = 1000
  let g:ctrlp_by_filename  = 0
  let g:ctrlp_switch_buffer  = 'Et'
  let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|idea)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }
endif
" ----------------------------------------------------------------------------
" FZF }}}


" NERDTreeTabs
" if exists(":NERDTree")
  let g:nerdtree_tabs_open_on_gui_startup = 0
  let g:nerdtree_tabs_open_on_console_startup = 0
  let g:nerdtree_tabs_open_on_new_tab = 0
" endif

" NERDTree
" if exists(":NERDTreeTabsToggle")
  nnoremap <Leader>ft :NERDTreeToggle<CR>
  " nnoremap <leader>cd :NERDTreeCWD<CR>
  " nnoremap <leader>nf :NERDTreeFind<CR>
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
  let g:UltiSnipsExpandTrigger='<tab>'
  let g:UltiSnipsJumpForwardTrigger='<tab>'
  let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
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
" let g:jedi#goto_command = "<leader>g

" Double rainbow - What does it mean!?
au VimEnter * RainbowParentheses
" au Syntax * RainbowParenthesesLoadRound

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
  let g:syntastic_html_checkers = []
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
let g:vim_markdown_folding_disabled = 1

" Vim Tmux Navigator
" if exists(":TmuxNavigator")
if has('nvim')
  nmap <silent> <BS> :TmuxNavigateLeft<CR>
endif

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

" Goyo & Limelight
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Toggle spellcheck in normal mode
" :map <F5> :setlocal spell! spelllang=en_us<CR>

" Ag: The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
else
  set grepprg=grep\ -rn\ $*\ *
endif

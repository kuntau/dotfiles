if !has('nvim')
  set encoding=utf-8
  set nocompatible               " be iMproved
endif

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
" if executable('fzf') && !has('gui_running') && (has('nvim') || (v:version > 800))
" if executable('fzf') && has('nvim') && !has('gui_running')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-ycino/fzf-preview.vim'
" elseif has("gui_running")
  " Plug 'yggdroot/leaderf', { 'do': './install.sh' }
  " Plug 'ctrlpvim/ctrlp.vim'
" endif
Plug 'mhinz/vim-startify'
Plug 'sjl/gundo.vim',       { 'on': 'GundoToggle' }

Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'mattn/webapi-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'joequery/Stupid-EasyMotion'
Plug 'danro/rename.vim'
Plug 'tpope/vim-rsi'
Plug 'rking/ag.vim'
" Plug 'jremmen/vim-ripgrep'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'ervandew/supertab'

" Completion & syntax checking
if has('nvim') || (v:version > 800)
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  " coc.nvim plugins~~
  " Plug 'weirongxu/coc-explorer',
  Plug 'neoclide/coc-git',
  Plug 'neoclide/coc-snippets',
  Plug 'neoclide/coc-yank',
  Plug 'neoclide/coc-emmet',
  " coc.nvim language specific plugins~~
  Plug 'neoclide/coc-eslint',
  Plug 'neoclide/coc-css',
  Plug 'neoclide/coc-html',
  Plug 'neoclide/coc-json',
  Plug 'neoclide/coc-python',
  Plug 'neoclide/coc-tsserver',
  Plug 'neoclide/coc-vetur',
  Plug 'neoclide/coc-yaml',
  Plug 'marlonfan/coc-phpls',
  Plug 'iamcco/coc-vimlsp',
else
  Plug 'scrooloose/syntastic'
  Plug 'Valloric/YouCompleteMe', { 'on': [] }
endif
" Plug 'SirVer/ultisnips', { 'on': [] } ---- we're using coc-snippets now
Plug 'honza/vim-snippets'
Plug 'bingeboy/snipmate-nodejs'
Plug 'wellle/tmux-complete.vim'

" A solid language pack for Vim
Plug 'sheerun/vim-polyglot'

" Syntaxes and such.
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/vim-easy-align'
" Plug 'mutewinter/nginx.vim'
" Plug 'groenewege/vim-less'
" Plug 'tpope/vim-cucumber'
" Plug 'tpope/vim-liquid'
" Plug 'tpope/vim-haml'
" Plug 'jcf/vim-latex'
" Plug 'msanders/cocoa.vim'
" Plug 'empanda/vim-varnish'
" Plug 'atourino/jinja.vim'
" Plug 'puppetlabs/puppet-syntax-vim'

" html bundles
Plug 'mattn/emmet-vim',                        { 'for': [ 'html', 'php', 'vue', 'javascript', 'blade' ] }
Plug 'Valloric/MatchTagAlways',                { 'for': [ 'html', 'xml' ] }
" Plug 'plasticboy/vim-markdown',                { 'for': 'markdown' }
" Plug 'othree/html5.vim',                       { 'for': 'html' }
" Plug 'digitaltoad/vim-jade', { 'for': 'jade' }

" CSS bundles
Plug 'hail2u/vim-css3-syntax',                 { 'for': 'css' }
" Plug 'wavded/vim-stylus',                      { 'for': [ 'stylus', 'vue' ] }
Plug 'ap/vim-css-color',                       { 'for': [ 'css', 'vue' ] }

" Javascript bundles
" Plug 'pangloss/vim-javascript',                { 'for': [ 'javascript', 'javascript.jsx', 'vue' ] }
" Plug 'othree/yajs.vim',                        { 'for': [ 'javascript', 'javascript.jsx', 'vue' ] }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': [ 'javascript', 'javascript.jsx' ] }
" Plug 'othree/jspc.vim',                        { 'for': [ 'javascript', 'javascript.jsx' ] }
" Plug 'itspriddle/vim-jquery',                  { 'for': [ 'javascript', 'javascript.jsx' ] }
" Plug 'mxw/vim-jsx',                            { 'for': [ 'javascript', 'javascript.jsx' ] }
Plug 'kchmck/vim-coffee-script',               { 'for': [ 'coffeescript' ] }
Plug 'posva/vim-vue',                          { 'for': [ 'vue' ] }
Plug 'elzr/vim-json',                          { 'for': 'json' }
" Plug 'jelera/vim-javascript-syntax',           { 'for': [ 'javascript', 'javascript.jsx', 'vue' ] }

" Python bundles
Plug 'nvie/vim-flake8',              { 'for': 'python' }
Plug 'fs111/pydoc.vim',              { 'for': 'python' }
Plug 'vim-scripts/python_match.vim', { 'for': 'python' }
Plug 'ehamberg/vim-cute-python',     { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv',    { 'for': 'python' }

" Ruby specific
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }

" PHP bundles
Plug 'tpope/vim-ragtag',                    { 'for': [ 'php', 'blade' ] }
" Plug 'm2mdas/phpcomplete-extended',         { 'for': [ 'php', 'blade' ] }
" Plug 'm2mdas/phpcomplete-extended-laravel', { 'for': [ 'php', 'blade' ] }
" Plug 'noahfrederick/vim-laravel',           { 'for': [ 'php', 'blade' ] }
" Plug 'jwalton512/vim-blade',                { 'for': 'php' }
" Plug 'StanAngeloff/php.vim',               { 'for': 'php' }
" Plug 'shawncplus/phpcomplete.vim',         { 'for': 'php' }

" Fun, but not useful
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'chreekat/vim-paren-crosshairs'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim'
" Plug 'mgutz/vim-colors'
" Plug 'tpope/vim-speeddating'
" Plug 'vim-scripts/CSApprox'
" Plug 'Rykka/colorv.vim' " add 180ms startup time
" Plug 'davidoc/taskpaper.vim'

" Colorschemes
Plug 'flazz/vim-Colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'lifepillar/vim-solarized8'
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
Plug 'bogado/file-line'
Plug 'ryanoasis/vim-devicons'

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
    colorscheme solarized
    if strftime("%H") > 8 && strftime("%H") < 19
      set background=light
    else
      set background=dark
    endif
    if has("termguicolors")
      " set t_8f=^[[38;2;%lu;%lu;%lum
      " set t_8b=^[[48;2;%lu;%lu;%lum
      " colorscheme solarized8_dark
      let ayucolor="mirage"
      colorscheme ayu
      set termguicolors
    endif

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

" Even more setting as suggested by coc.vim readme
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" diff always open in vertical split
set diffopt+=vertical

" Remove the toolbar if we're running under a GUI (e.g. MacVIM).
if has("gui_running")
  set guioptions=-t
  if has('win32') || has('win64')
    set gfn=Consolas:h10                " font to use
  elseif has('mac') || has('macunix')
    " set gfn=PragmataPro\ for\ Powerline:h12
  elseif has('gui_gtk2')
    set gfn=PragmataPro\ 9
    " set lines=50 columns=100
  endif
endif

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
set foldmethod=indent

" Highlight VCS conflict markers
""""""""""""""""""""""""""""""""
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" I CAN HAZ NORMAL REGEXES?
"""""""""""""""""""""""""""
nnoremap / /\v
vnoremap / /\v

" General auto-commands
"""""""""""""""""""""""
autocmd FileType * setlocal colorcolumn=100
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Get rid of trailing whitespace highlighting in mutt.
autocmd FileType mail highlight clear ExtraWhitespace
autocmd FileType mail setlocal listchars=

" Reformat XML files
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Crontab auto-commands
"""""""""""""""""""""""
autocmd FileType crontab setlocal backupcopy=yes

" Ruby Configurations
"""""""""""""""""""""
autocmd filetype ruby setlocal noexpandtab shiftwidth=2 tabstop=2

" PHP Configurations
""""""""""""""""""""
autocmd FileType php,blade setlocal omnifunc=phpcomplete_extended#CompletePHP colorcolumn=80

" HTML configurations
"""""""""""""""""""""
" autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
au BufNewFile,BufReadPost *.html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" CSS configurations
"""""""""""""""""""""""""""
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
au BufNewFile,BufReadPost *.css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Javascript configurations
"""""""""""""""""""""""""""
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType javascript setlocal colorcolumn=80
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab
" autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Coffeescript configurations
"""""""""""""""""""""""""""""
autocmd FileType coffeescript setlocal colorcolumn=100
au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent shiftwidth=2 expandtab

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
let mapleader   = ","
let g:mapleader = ","

" Get rid of search hilighting with ,/
" nnoremap <silent> <leader>/ :nohlsearch<CR> --- use vim-unimpaired *yoh* instead

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null

" Core fix -Kuntau-
noremap <space><space> :
noremap <leader>ei :e ~/dotfiles/vimrc<CR>
noremap <leader>so :w!<cr> :source %<CR>
noremap \ :Rg<CR>

nnoremap <F4> :w!<CR>
inoremap <F4> <c-o>:w!<CR>

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
vnoremap <Leader>d "_d
vnoremap p "_dP

" Easier movement and copy paste combo
" noremap 0 0
" noremap H ^
" noremap L $
" noremap yp yyp
" noremap yP yyP
" noremap yd yydd

" Line mod time saver --------- please use vim-unimpaired
" nnoremap <enter> i<enter><esc>
" nnoremap <down> m`o<esc>``
" nnoremap <up> m`O<esc>``

" Escape key mapping
inoremap jj <esc>

" Match tag
nnoremap <c-space> %

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

" Close all the buffers including currently viewed
map <leader>ba :bufdo bd<cr>

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

" if exists(":delimitMate")
  let delimitMate_expand_cr = 2
  let delimitMate_expand_space = 2
" endif

" ----------------------------------------------------------------------------
" {{{ FZF
" ----------------------------------------------------------------------------
" if executable('fzf') && !has('gui_running')
if executable('fzf')
  if has('nvim')
    function! FloatingFZF(width, height, border_highlight)
      function! s:create_float(hl, opts)
        let buf = nvim_create_buf(v:false, v:true)
        let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
        let win = nvim_open_win(buf, v:true, opts)
        call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
        call setwinvar(win, '&colorcolumn', '')
        return buf
      endfunction

      " Size and position
      let width = float2nr(&columns * a:width)
      let height = float2nr(&lines * a:height)
      let row = float2nr((&lines - height) / 2)
      let col = float2nr((&columns - width) / 2)

      " Border
      let top = '╭' . repeat('─', width - 2) . '╮'
      let mid = '│' . repeat(' ', width - 2) . '│'
      let bot = '╰' . repeat('─', width - 2) . '╯'
      let border = [top] + repeat([mid], height - 2) + [bot]

      " Draw frame
      let s:frame = s:create_float(a:border_highlight, {'row': row, 'col': col, 'width': width, 'height': height})
      call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)

      " Draw viewport
      call s:create_float('Normal', {'row': row + 1, 'col': col + 2, 'width': width - 4, 'height': height - 2})
      autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
    endfunction

    let g:fzf_layout = { 'window': 'call FloatingFZF(0.9, 0.6, "Comment")' }

    " nnoremap <silent> <c-p> :FzfPreviewProjectFiles<CR>
    nnoremap <silent> <c-p> :Files<CR>
  " else
    " check if in git project ~k
    " let isGitProject = call IsGitProject()
    " nnoremap <silent> <c-p> :Leaderf<CR>
    " if (l:isGitProject != true)
    "   nnoremap <silent> <c-p> :FzfPreviewProjectFiles<CR>
    " elseif
    "   nnoremap <silent> <c-p> :FZF<CR>
    " endif
  endif
endif

" FZF hide statusline
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

map <leader>/ :Rg<Cr>

" add --no-ignore to respect .gitignore list
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --hidden --fixed-strings --follow --ignore-case --glob "!.git/*" --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', 'ctrl-p'), <bang>0)
" coc-explorer
  " nnoremap <space>e :CocCommand explorer --toggle --sources=buffer+,file+ /root/path<CR>
  nnoremap <space>e :CocCommand explorer<CR>
  let g:coc_explorer_global_presets = {
  \   '.vim': {
  \      'root-uri': '~/.vim',
  \   },
  \   'floating': {
  \      'position': 'floating',
  \   },
  \   'floatingLeftside': {
  \      'position': 'floating',
  \      'floating-position': 'left-center',
  \      'floating-width': 50,
  \   },
  \   'floatingRightside': {
  \      'position': 'floating',
  \      'floating-position': 'left-center',
  \      'floating-width': 50,
  \   },
  \   'simplify': {
  \     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
  \   }
  \ }

" Use preset argument to open it
  nmap <space>ed :CocCommand explorer --preset .vim<CR>
  nmap <space>ef :CocCommand explorer --preset floating<CR>

" List all presets
  nmap <space>el :CocList explPresets

" NERDTreeTabs -------- replaced by coc-explorer
" if exists(":NERDTree")
  let g:nerdtree_tabs_open_on_gui_startup = 0
  let g:nerdtree_tabs_open_on_console_startup = 0
  let g:nerdtree_tabs_open_on_new_tab = 0
" endif

" NERDTree -------- replaced by coc-explorer
" if exists(":NERDTreeTabsToggle")
  nnoremap <Leader>ft :NERDTreeToggle<CR>
  nnoremap <F1> :NERDTreeToggle<CR>
  " nnoremap <leader>cd :NERDTreeCWD<CR>
  " nnoremap <leader>nf :NERDTreeFind<CR>
  let NERDTreeBookmarksFile=$HOME.'/.vim/.NERDTreeBookmarks'
  let NERDTreeDirArrows=1
  let NERDTreeMinimalUI=1
  let NERDTreeShowBookmarks=1
  let NERDChristmasTree=0
" endif

" SnipMate
let g:snippets_dir = "~/.vim/bundle/snipmate-snippets"

if has('nvim') || (v:version > 800)
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  " inoremap <silent><expr> <TAB>
  "       \ pumvisible() ? "\<C-n>" :
  "       \ <SID>check_back_space() ? "\<TAB>" :
  "       \ coc#refresh()
  " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  "
  " function! s:check_back_space() abort
  "   let col = col('.') - 1
  "   return !col || getline('.')[col - 1]  =~# '\s'
  " endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  let g:coc_snippet_next = '<tab>'

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " Or use `complete_info` if your vim support it, like:
  " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Create mappings for function text object, requires document symbols feature of languageserver.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

  "
  " START YouCompleteMe SETTINGS
  "
else
" make YCM compatible with UltiSnips (using supertab)
  " let g:ycm_key_list_select_completion = ['<C-n>']
  " let g:ycm_key_list_previous_completion = ['<C-p>']
  " let g:SuperTabDefaultCompletionType = '<C-n>'
  " augroup load_us_ycm
  "   autocmd!
  "   autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe', 'tern_for_vim')
  "                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
  " augroup END
endif

" CoC Settings
nmap <space>e :CocCommand explorer<CR>
nmap <space>y :CocList -A --normal yank<CR>

" let g:coc_global_extensions = [
"       \'coc-vetur',
"       \'coc-explorer',
"       \'coc-json',
"       \'coc-git',
"       \'coc-html',
"       \'coc-css',
"       \'coc-markdownlint',
"       \'coc-highlight',
"       \'coc-go',
"       \'coc-python'
"       \]

" coc-snippets settings
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" UltiSnips
" if exists(":UltiSnipsEdit")
  let g:UltiSnipsExpandTrigger='<tab>'
  " let g:UltiSnipsExpandTrigger='<C-j>'
  let g:UltiSnipsJumpForwardTrigger='<tab>'
  let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
  let g:UltiSnipsEditSplit='vertical'
  " let g:UltiSnipsSnippetDirectory=['bundle/vim-snippets/UltiSnips']
  " let g:UltiSnipsListSnippets='<NUL>'
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
" let g:CSApprox_loaded = 1

" Javascript-libraries-syntax
let g:used_javascript_libs = 'jquery, underscore, angularjs, react, vue'

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
" if has('nvim')
  " nmap <silent> <BS> :TmuxNavigateLeft<CR>
  " nmap <silent> <c-h> :TmuxNavigateLeft<CR>
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

" Check if current directory is git project
function! IsGitProject() abort
  silent !git rev-parse --show-toplevel
  if v:shell_error
    return true
  endif
endfunction

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
  let g:limelight_conceal_ctermfg = 'gray'
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
:map <F11> :Goyo<CR>

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Toggle spellcheck in normal mode
:nmap <F5> :setlocal spell! spelllang=en_us<CR>

" Rg: ripgrep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
else
  set grepprg=grep\ -rn\ $*\ *
endif

" Ag: The Silver Searcher
" if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor\ --column
" else
"   set grepprg=grep\ -rn\ $*\ *
" endif

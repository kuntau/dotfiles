" vim: set foldmethod=marker foldlevel=0 nomodeline:
" ==================================================

" Initialization {{{
if (v:version < 800)
  set encoding=utf-8
  set nocompatible               " be iMproved
  filetype off                   " required!
else
  unlet! skip_defaults_vim       " Vim 8 defaults
  silent! source $VIMRUNTIME/defaults.vim
endif

augroup vimrc
  autocmd!
augroup END
" }}}

" Plug automatic installation {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}

" Plugins begin {{{
call plug#begin('~/.vim/bundle')

" local
" Plug 'file://'.expand('~/coding/vim-osc52')

" VCS
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'junegunn/gv.vim', { 'on': 'GV' }

" System
" if executable('fzf') && has('nvim') && !has('gui_running')
if executable('fzf') && (has('nvim') || (v:version >= 800))
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
endif
Plug 'kuntau/vim-osc52'
vmap <c-c> <Plug>(YankOSC52)
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree',       { 'on': 'UndotreeToggle' }
  let g:undotree_WindowsLayout = 2
  nnoremap U :UndotreeToggle<CR>
" Plug 'sjl/gundo.vim',       { 'on': 'GundoToggle' }
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
Plug 'liuchengxu/vista.vim'
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapCh=1 " Remove <c-h> map in insert mode to cancel pair
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'
Plug 'yegappan/mru'

" Completion & syntax checking
if has('nvim') || (v:version >= 800)
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
else
  Plug 'scrooloose/syntastic'
  Plug 'Valloric/YouCompleteMe', { 'on': [] }
endif
" "---- we're using coc-snippets now
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'bingeboy/snipmate-nodejs'
Plug 'wellle/tmux-complete.vim'

" A solid language pack for Vim
Plug 'sheerun/vim-polyglot'

" Syntaxes and such.
Plug 'sgur/vim-editorconfig'
Plug 'AndrewRadev/splitjoin.vim' " gS for splitting & gJ for joining
Plug 'tomtom/tcomment_vim' " more feature but slower
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
" nmap z <Plug>Sneak_s
" nmap Z <Plug>Sneak_S
" map f <Plug>Sneak_s
" map F <Plug>Sneak_S
map t <Plug>Sneak_s
map T <Plug>Sneak_S
" Plug 'tpope/vim-git'
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
Plug 'mattn/emmet-vim',                        { 'for': [ 'html', 'php', 'vue', 'css', 'stylus', 'scss', 'sass' ] }
Plug 'Valloric/MatchTagAlways',                { 'for': [ 'html', 'xml' ] }
" Plug 'plasticboy/vim-markdown',                { 'for': 'markdown' }
" Plug 'othree/html5.vim',                       { 'for': 'html' }
" Plug 'digitaltoad/vim-jade', { 'for': 'jade' }

" CSS bundles
" Plug 'hail2u/vim-css3-syntax',                 { 'for': 'css' }
" Plug 'wavded/vim-stylus',                      { 'for': [ 'stylus', 'vue' ] }
" Plug 'ap/vim-css-color',                       { 'for': [ 'css', 'vue', 'vim' ] }

" Javascript bundles
" Plug 'pangloss/vim-javascript',                { 'for': [ 'javascript', 'javascript.jsx', 'vue' ] }
" Plug 'othree/yajs.vim',                        { 'for': [ 'javascript', 'javascript.jsx', 'vue' ] }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': [ 'javascript', 'javascript.jsx' ] }
" Plug 'othree/jspc.vim',                        { 'for': [ 'javascript', 'javascript.jsx' ] }
" Plug 'itspriddle/vim-jquery',                  { 'for': [ 'javascript', 'javascript.jsx' ] }
" Plug 'mxw/vim-jsx',                            { 'for': [ 'javascript', 'javascript.jsx' ] }
Plug 'kchmck/vim-coffee-script',               { 'for': [ 'coffeescript' ] }
Plug 'posva/vim-vue',                          { 'for': 'vue' }
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
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/rainbow_parentheses.vim', { 'on': 'RainbowParentheses' }
" Plug 'chreekat/vim-paren-crosshairs'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim'

" Colorschemes
Plug 'kuntau/ayu-vim', { 'branch': 'italic' }
let g:ayu_comment_italic=1
let g:ayu_string_italic=0
let g:ayu_type_italic=0
let g:ayu_keyword_italic=1
Plug 'lifepillar/vim-solarized8'
let g:solarized_statusline="flat"
let g:solarized_italics=1
let g:solarized_old_cursor_style=0
Plug 'gruvbox-community/gruvbox'
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='soft'
let g:gruvbox_italicize_strings=1
Plug 'arcticicestudio/nord-vim'
Plug 'fatih/molokai'
Plug 'skielbasa/vim-material-monokai'
let g:materialmonokai_italic=1
let g:materialmonokai_subtle_spell=1
let g:materialmonokai_custom_lint_indicator=1
Plug 'rakr/vim-one'
let g:one_allow_italics=1
" Plug 'flazz/vim-Colorschemes'
" Plug 'junegunn/seoul256.vim'

" Misc bundle
Plug 'junegunn/vim-peekaboo'
if has('nvim')
  let g:peekaboo_window="call CreateCenteredFloatingWindow()"
endif
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wesQ3/vim-windowswap'
Plug 'rizzatti/dash.vim', { 'on': [ 'Dash', 'DashSearch' ] }
Plug 'justinmk/vim-gtfo'
Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}

" Configurations {{{
filetype plugin indent on     " required!
if !has("gui_running")
  if has("termguicolors")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
    if strftime("%H") > 8 && strftime("%H") < 19
      let ayucolor="light"
      set background=light
    else
      let ayucolor="mirage"
      set background=dark
    endif
    " set background=dark
    colorscheme one
    " fix terminal timeout when pressing escape
    " set ttimeout
    " set ttimeoutlen=50
    " augroup FastEscape
    "   autocmd!
    "   au InsertEnter * set timeoutlen=0
    "   au InsertLeave * set timeoutlen=1000
    " augroup END
else
    colorscheme solarized8_flat
endif

" Remove the toolbar if we're running under a GUI (e.g. MacVIM).
if has("gui_running")
  set guioptions=-t
  if has('win32') || has('win64')
    set gfn=Consolas:h10                " font to use
  elseif has('mac') || has('macunix')
    " guifont not supported in neovim
    set guifont=PragmataPro\ for\ Powerline:h12
  elseif has('gui_gtk2')
    set gfn=PragmataPro\ 9
    " set lines=50 columns=100
  endif
endif
" }}}

" (Neo)Vim settings {{{
" Wildmenu completion {{{
set wildmenu
set wildmode=full
" set wildmode=list:longest
set wildignore+=.hg,.git,.svn,.idea              " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=**.class                         " Cursed Java class files
" }}}

" Save when losing focus
set autowriteall " Auto-save files when switching buffers or leaving vim.
au FocusLost * silent! noautocmd up
" au FocusLost,TabLeave,WinLeave * silent! noautocmd up

" update buffer if file changed outside vim
set autoread
" au FocusGained,BufEnter * silent! noautocmd checktime
au FocusGained * silent! noautocmd checktime

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Basic
syntax enable
set lazyredraw
set rnu                  " show relative number instead
set number               " always show line numbers
set hidden               " Allow un-saved buffers in background
set clipboard+=unnamedplus     " Share system clipboard.
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
set smartcase            " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch             " highlight search terms
set incsearch            " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set undofile             " enable persistent undo so history persists
set undodir=/tmp,.       " directory for persistent undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set modelines=2          " only check 2 lines for modeline

" More settings borrowed from tarruda/dot-files, junegunn/dotfiles
set showcmd              " display incomplete command
set completeopt=menu,menuone,longest
set complete=.,w,b,u,t   " h: 'complete'
set pumheight=15         " limit completion menu height
set splitbelow           " put horizontal split below
set splitright           " put vertical split below
set matchtime=2          " time in decisecons to jump back from matching brackets
set synmaxcol=500        " maximum length to apply syntax highlight
set nostartofline        " keep cursor on the same column
set nocursorline
set nrformats=hex

" Status line config
set cmdheight=2     " coc.nvim readme suggest cmdheight=2
set noshowmode      " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2    " Always dislay the statusline in all windows

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" diff always open in vertical split
set diffopt+=vertical

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:»\ ,trail:·
set fillchars+=vert:\     " fix ugly vertical pane separator
if has('nvim')
  set fillchars+=eob:\    " unfortunately vim still haven't support this https://github.com/vim/vim/issues/3820
  " https://github.com/neovim/neovim/issues/2897#issuecomment-115464516
  let g:terminal_color_0 = '#4e4e4e'
  let g:terminal_color_1 = '#d68787'
  let g:terminal_color_2 = '#5f865f'
  let g:terminal_color_3 = '#d8af5f'
  let g:terminal_color_4 = '#85add4'
  let g:terminal_color_5 = '#d7afaf'
  let g:terminal_color_6 = '#87afaf'
  let g:terminal_color_7 = '#d0d0d0'
  let g:terminal_color_8 = '#626262'
  let g:terminal_color_9 = '#d75f87'
  let g:terminal_color_10 = '#87af87'
  let g:terminal_color_11 = '#ffd787'
  let g:terminal_color_12 = '#add4fb'
  let g:terminal_color_13 = '#ffafaf'
  let g:terminal_color_14 = '#87d7d7'
  let g:terminal_color_15 = '#e4e4e4'

  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

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
set foldmethod=indent
set nofoldenable          " don't fold by default
set foldlevel=99
set foldnestmax=10        " max fold nest
set foldmethod=indent

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" I CAN HAZ NORMAL REGEXES?
" nnoremap / /\v
" vnoremap / /\v
" }}}

" FileType autocommand {{{
" autocmd FileType * setlocal colorcolumn=100
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Get rid of trailing whitespace highlighting in mutt.
autocmd FileType mail highlight clear ExtraWhitespace
autocmd FileType mail setlocal listchars=

" Reformat XML files
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Crontab auto-commands
autocmd FileType crontab setlocal backupcopy=yes

" Ruby Configurations
autocmd filetype ruby setlocal noexpandtab shiftwidth=2 tabstop=2

" PHP Configurations
" autocmd FileType php,blade setlocal omnifunc=phpcomplete_extended#CompletePHP colorcolumn=80

" HTML configurations
" autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
au BufNewFile,BufReadPost *.html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" CSS configurations
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
au BufNewFile,BufReadPost *.css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Javascript configurations
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType javascript setlocal omnifunc=tern#Complete
" autocmd FileType javascript setlocal colorcolumn=80
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab
" autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Coffeescript configurations
" autocmd FileType coffeescript setlocal colorcolumn=100
au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent shiftwidth=2 expandtab

" Python configurations
autocmd FileType python setlocal shiftwidth=4 expandtab tabstop=4 softtabstop=4
" autocmd FileType python setlocal colorcolumn=80
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
" }}}

" Mappings {{{
" Change leader
let localleader = ","
let mapleader   = ","
let g:mapleader = ","

" kuntau
nnoremap <space><space> :
nnoremap <leader>ei :e ~/dotfiles/vimrc<CR>
nnoremap <leader>so :up!<cr> :source %<CR>
nnoremap <leader>S :Startify<CR>
nnoremap \ :Rg<CR>

nnoremap <F4> :up!<CR>
inoremap <F4> <c-o>:up!<CR>

" Movement in insert mode
inoremap <m-h> <C-o>h
inoremap <m-l> <C-o>l
inoremap <m-j> <C-o>j
inoremap <m-k> <C-o>k
inoremap <C-^> <C-o><C-^>

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
" inoremap jj <esc>

" Working with split windows - resize
nnoremap <silent> <m-left> :vertical resize-2<cr>
nnoremap <silent> <m-right> :vertical resize+2<cr>
nnoremap <silent> <m-up> :resize+2<cr>
nnoremap <silent> <m-down> :resize-2<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers including currently viewed
map <leader>ba :bufdo bd<cr>

" Use the arrows to something usefull
nnoremap <right> :bn<cr>
nnoremap <left>  :bp<cr>

" Retain selection after indent or formating
" Use `gv` if we want to reselect
" vmap > >gv
" vmap < <gv
" vmap = =gv

" Tab configuration; not using tab currently
" Use gt & gT to switch tab
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
" inoremap <m-j> <Esc>:m .+1<CR>==gi
" inoremap <m-k> <Esc>:m .-2<CR>==gi

" qq to record, Q to replay
nnoremap Q @q

" Zoom
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" Last inserted text
nnoremap g. :normal! `[v`]<cr><left>

" Disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>
" nnoremap <expr> <leader>cd ":echom".(<SID>isGitRepo ? "ok" : "not ok")."<cr>"

" Remove the Windows ^M - when the encodings gets messed up
nnoremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
" noremap <leader>sp :setlocal paste!<cr>
noremap <F2> :set paste!<cr>
" set pastetoggle=<F2>
" noremap <leader>pp "+p
" noremap <leader>pP "+P

" #!! | Shebang
" ----------------------------------------------------------------------------
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)
" }}}

" Plugin's configurations {{{

" Git functions {{{
function! s:isGitRepo() abort
  silent! !git rev-parse --is-inside-work-tree
  return v:shell_error ? v:false : v:true
endfunction

function! s:getGitRoot() abort
  if <SID>isGitRepo()
    return system("git rev-parse --show-toplevel")
  endif
endfunctio>

" returns all modified files of the current git repo
function! s:gitModified() abort
  if <SID>isGitRepo()
    let files = systemlist('git ls-files -m')
    return map(files, "{'line': v:val, 'path': v:val}")
  endif
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked() abort
  if <SID>isGitRepo()
    let files = systemlist('git ls-files -o --exclude-standard')
    return map(files, "{'line': v:val, 'path': v:val}")
  endif
endfunction
" }}}

" Startify {{{
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': function('<SID>gitModified'),  'header': ['   git modified']},
  \ { 'type': function('<SID>gitUntracked'), 'header': ['   git untracked']},
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
let g:startify_bookmarks = [
  \ {'d': '~/dotfiles/'},
  \ '~/.config/nvim/bundle',
  \ '~/Coding/gigpos/',
  \ '~/Coding/gigpos-ui/',
  \ '~/Coding/donbarberweb/'
  \]
let g:startify_commands = [
  \ {'p': ['Upgrade Plug', 'PlugUpgrade']},
  \ {'u': ['Update Plugins', 'PlugUpdate']},
  \ {'c': ['Update CoC Extensions', 'CocUpdateSync']},
  \ ]
let g:startify_fortune_use_unicode = 1
let g:startify_padding_left = 3
let g:startify_session_sort = 1
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0
let g:startify_custom_header = 'startify#center(startify#fortune#boxed())'
" }}}

" Vista {{{
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" }}}

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 2
let g:gist_show_privates = 1

" fugitive
nmap <space>gc :Gcommit<CR>
nmap <space>gs :G<CR>

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" FZF {{{
if executable('fzf')
  " https://github.com/junegunn/fzf.vim/issues/821#issuecomment-581481211
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'horizontal' } }
  let g:fzf_preview_window = 'right:60%'
  if has('nvim') || v:version >= 800
    nmap <silent> <c-p> :Files<CR>
    nmap <silent> <space>fc :Commands<CR>
    nmap <silent> <space>ff :Buffers<CR>
    nmap <silent> <space>fm :Maps<CR>
    nmap <silent> <space>ft :BTags<CR>
    nmap <silent> <space>fv :Vista finder<CR>
  endif
endif

" All files
command! -nargs=? -complete=dir AF
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))
" }}}

" SnipMate
let g:snippets_dir = "~/.vim/bundle/snipmate-snippets"

" CoC completion routine {{{
if has('nvim') || (v:version >= 800)
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

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation
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

  " Symbol renaming
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

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')
  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>ca  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>ce  :<C-u>CocList --normal extensions<cr>
  " Show commands
  nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

  " ----------------------------
  " START YouCompleteMe SETTINGS
  " ----------------------------
endif
" }}}

" CoC Mappings {{{
" nmap <space>y :CocList -A --normal yank<CR>
nmap <space>y :CocList --normal yank<CR>

" coc-snippets settings
" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

let g:markdown_fenced_languages = [ 'vim', 'help' ] " coc-vimlsp config
" }}}

" CoC Extensions & settings! {{{
" CoC Extensions list: {{{
let g:coc_global_extensions = [
    \'coc-explorer',
    \'coc-snippets',
    \'coc-lists',
    \'coc-highlight',
    \'coc-emmet',
    \'coc-yank',
    \'coc-git',
    \'coc-smartf',
    \'coc-prettier',
    \'coc-eslint',
    \'coc-stylelint',
    \'coc-markdownlint',
    \'coc-tsserver',
    \'coc-json',
    \'coc-vetur',
    \'coc-html',
    \'coc-css',
    \'coc-xml',
    \'coc-go',
    \'coc-phpls',
    \'coc-clangd',
    \'coc-flutter',
    \'coc-python',
    \'coc-rls',
    \'coc-yaml',
    \'coc-vimlsp'
    \]
" }}}

" CoC Extensions Settings {{{

" coc-git
" navigate chunks of current buffer
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap <leader>hp <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap <leader>hc <Plug>(coc-git-commit)
nmap <silent> <leader>hs :CocCommand git.chunkStage<cr>
nmap <silent> <leader>hu :CocCommand git.chunkUndo<cr>
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" coc-explorer
nmap <silent> <space>ee :CocCommand explorer<CR>
" }}}
" }}}


" UltiSnips
" let g:UltiSnipsExpandTrigger='<tab>'
" let g:UltiSnipsExpandTrigger='<C-j>'
" let g:UltiSnipsJumpForwardTrigger='<c-j>'
" let g:UltiSnipsJumpBackwardTrigger='<c-k>'
" let g:UltiSnipsEditSplit='vertical'
" let g:UltiSnipsSnippetDirectory=['bundle/vim-snippets/UltiSnips']
" let g:UltiSnipsListSnippets='<NUL>'

" Powerline & airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" Plasticboy Markdown
let g:vim_markdown_folding_disabled = 1

" Vim Tmux Navigator
" if exists(":TmuxNavigator")
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
  " nnoremap <silent> <c-w> :TmuxNavigatePrevious<cr>
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

" }}}

" Useful functions that can't be fit up top functions {{{

" let $FZF_DEFAULT_OPTS='--reverse  --margin=1,6 --inline-info'

" Terminal buffer options for fzf
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set noshowmode noruler nornu nonu signcolumn=no
endif

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

" Help in new tabs
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd vimrc BufEnter *.txt call s:helptab()

" Create floating window
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" Copy yank buffer to system clipboard
" USE OSC52 to put things into the system clipboard, works over SSH!
function! Osc52Yank() abort
  let buffer=system('base64 -w0', @0)  " -w0 to disable 76 char line wrapping
  let buffer='\ePtmux;\e\e]52;c'.buffer.'\x07\e\\'
  silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)
endfunction

nnoremap <leader>y :call Osc52Yank()<cr>

" augroup vimrc " goodbye_netrw
  " autocmd!
  " autocmd VimEnter * silent! au! FileExplorer *
  " autocmd VimEnter * if !argc() | Startify | CocCommand explorer | wincmd w | endif
  " autocmd VimEnter * if argv(0) == '.' | Startify | CocCommand explorer | endif
  " autocmd VimEnter * CocCommand explorer
" augroup END

" augroup vimrc " slash
"   autocmd!
"   autocmd CursorMoved,CursorMovedI * set nohlsearch | autocmd! slash
" augroup END

" }}}

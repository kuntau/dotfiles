" vim: set foldmethod=marker foldlevel=0 nomodeline:
" ==================================================

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

" Plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" set rtp+=~/.fzf
call plug#begin('~/.vim/bundle')

" VCS
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'
Plug 'junegunn/gv.vim'

" System
" if executable('fzf') && has('nvim') && !has('gui_running')
if executable('fzf') && (has('nvim') || (v:version >= 800))
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
endif
Plug 'mhinz/vim-startify'
Plug 'sjl/gundo.vim',       { 'on': 'GundoToggle' }
Plug 'liuchengxu/vista.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
" Plug 'joequery/Stupid-EasyMotion'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'

" Completion & syntax checking
if has('nvim') || (v:version >= 800)
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  " coc.nvim plugins~~
  Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
  " coc.nvim language specific plugins~~
  Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
  Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile'}
  Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
else
  Plug 'scrooloose/syntastic'
  Plug 'Valloric/YouCompleteMe', { 'on': [] }
endif
" "---- we're using coc-snippets now
Plug 'SirVer/ultisnips'
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
Plug 'tpope/vim-git'
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
" Plug 'tpope/vim-speeddating'

" Colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'lifepillar/vim-solarized8'
" Plug 'flazz/vim-Colorschemes'
" Plug 'tomasr/molokai'
" Plug 'junegunn/seoul256.vim'

" Misc bundle
Plug 'junegunn/vim-peekaboo'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wesQ3/vim-windowswap'
Plug 'rizzatti/dash.vim', { 'on': [ 'Dash', 'DashSearch' ] }
Plug 'bogado/file-line'
Plug 'ryanoasis/vim-devicons'

call plug#end()

filetype plugin indent on     " required!

" Configurations
""""""""""""""""
if !has("gui_running")
    if strftime("%H") > 8 && strftime("%H") < 19
      set background=light
    else
      set background=dark
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
    colorscheme solarized8_flat
endif

if has("termguicolors")
  set termguicolors
  let ayucolor="mirage"
  colorscheme ayu
  " colorscheme solarized8
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
set cmdheight=1

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
if has('nvim')
  set fillchars+=eob:\    " unfortunately vim still haven't support this https://github.com/vim/vim/issues/3820
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

" Change leader
let localleader = ","
let mapleader   = ","
let g:mapleader = ","

" Core fix -Kuntau-
noremap <space><space> :
noremap <leader>ei :e ~/dotfiles/vimrc<CR>
noremap <leader>so :w!<cr> :source %<CR>
noremap <leader>S :Startify<CR>
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
nmap <m-j> mz:m+<cr>`z
nmap <m-k> mz:m-2<cr>`z
vmap <m-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <m-k> :m'<-2<cr>`>my`<mzgv`yo`z
imap <m-j> <Esc>:m .+1<CR>==gi
imap <m-k> <Esc>:m .-2<CR>==gi

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

"======================
" Plugin's configurations
"======================

" Startify
let g:startify_bookmarks = [
  \ {'d': '~/dotfiles/'},
  \ {'v': '~/.config/nvim/bundle'},
  \ {'g': '~/Coding/gigpos/'},
  \ '~/Coding/donbarberweb/'
  \]
let g:startify_session_persistence = 1

" Vista
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

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 2
let g:gist_show_privates = 1

" fugitive
nmap <space>gc :Gcommit<CR>

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" FZF
" ====================================
if executable('fzf')
  if has('nvim')
    nnoremap <silent> <c-p> :Files<CR>
  endif
endif

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,    fzf#vim#with_preview(s:fzf_preview_side().':60%','?'), <bang>0)
command! -bang -nargs=?               GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(s:fzf_preview_side().':60%','?'), <bang>0)
command! -bang -nargs=+ -complete=dir Locate
  \ call fzf#vim#locate(<q-args>,   fzf#vim#with_preview(s:fzf_preview_side().':60%:hidden','?'), <bang>0)
command! -bar  -bang                  Snippets
  \ call fzf#vim#snippets(<bang>0)
" All files
command! -nargs=? -complete=dir AF
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))

" command! -bang LS call fzf#run(fzf#wrap({'source': 'ls', 'options': [ '--reverse', '--preview', '--inline-info' ]},fzf#vim#with_preview('left')))
" add --no-ignore to respect .gitignore list
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --hidden --fixed-strings --follow --ignore-case --glob "!.git/*" --color=always '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
"   \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
"   \   <bang>0)

" FZF hide statusline
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

map <leader>/ :Rg<Cr>

" add --no-ignore to respect .gitignore list
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --hidden --fixed-strings --follow --ignore-case --glob "!.git/*" --color=always '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
"   \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
"   \   <bang>0)
"
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', 'ctrl-p'), <bang>0)

" coc-explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': '~/.vim',
\   },
\   'floating': {
\      'position': 'floating',
\   },
\   'simplify': {
\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Use preset argument to open it
  nmap <space>ee :CocCommand explorer<CR>
  " nmap <space>ed :CocCommand explorer --preset .vim<CR>
  " nmap <space>ef :CocCommand explorer --preset floating<CR>

" list all presets
nmap <space>el :coclist explpresets<cr>

" SnipMate
let g:snippets_dir = "~/.vim/bundle/snipmate-snippets"

" ----------------------
" CoC completion routine
" ----------------------
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
  nnoremap <silent> <space>ca  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
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
nmap <space>y :CocList -A --normal yank<CR>

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

let g:markdown_fenced_languages = [ 'vim', 'help' ] " coc-vimlsp config

" coc-smartf
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

augroup smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

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

" UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
" let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit='vertical'
" let g:UltiSnipsSnippetDirectory=['bundle/vim-snippets/UltiSnips']
" let g:UltiSnipsListSnippets='<NUL>'

" Powerline & airline
set noshowmode      " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2    " Always dislay the statusline in all windows
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
" let g:airline_extensions = [ 'coc', 'fugitiveline', 'quickfix', 'vista' ]

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

" =============================================== "
" Useful, Core that can't be fit up top functions "
" =============================================== "

" ------------------- "
" FZF Floating Window "
" ------------------- "
let g:fzf_layout = { 'window': 'call FloatingFZF1(0.9, 0.6, "Comment")' }
let $FZF_DEFAULT_OPTS='--reverse  --margin=1,2 --inline-info'

" --- Style 1 ---
function! FloatingFZF1(width, height, border_highlight)
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
" let $FZF_DEFAULT_OPTS='--color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:15,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,2'

" --- Style 2 ---
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
" let g:fzf_layout = { 'window': 'call FloatingFZF2()' }

function! FloatingFZF2()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let width = float2nr(80)
  let height = float2nr(20)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" FZF matching with vim colorscheme https://github.com/junegunn/fzf.vim/issues/59
function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd ColorScheme * call <sid>update_fzf_colors()
augroup END

function! s:fzf_preview_side()
  return winwidth(0) * 1.0 / winheight(0) >= 2 ? 'right' : 'down'
endfunction

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

augroup goodbye_netrw
  au!
  autocmd VimEnter * silent! au! FileExplorer *
augroup END

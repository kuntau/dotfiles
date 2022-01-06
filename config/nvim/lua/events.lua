-- Autocmd events configs

local autocmd = require('utils').autocmd

-- Restore cursor position https://github.com/vim/vim/blob/18f4740f043b353abe47b7a00131317052457686/runtime/defaults.vim#L100-L112
autocmd('nvimStartup', [[BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif ]], true)

autocmd('focus_lost', [[FocusLost * silent! noautocmd up]], true) -- Save when lose focus
autocmd('focus_gain', [[FocusGained * silent! noautocmd checktime]], true) -- Check if file changed outside vim & re-read file
autocmd('yank', [[TextYankPost * silent! lua vim.highlight.on_yank()]], true) -- Highlight on yank
autocmd('term', [[TermOpen * startinsert! | setlocal nonu nornu signcolumn=no ]], true) -- Start terminal in insert mode

-- Re-source configs on save!
autocmd('nvim_compile', [[BufWritePost *nvim/lua/plugins.lua PackerCompile]], true)
autocmd('nvim_configs', [[BufWritePost *nvim/**.lua :source <afile>]], true)

-- Show listchars on insert mode
autocmd('show_listchars', [[InsertEnter * :setl list]])
autocmd('show_listchars', [[InsertLeave * :setl nolist]])

--[[ Filetypes autocmds ]]--

autocmd('ft_qc',[[FileType help,qf,startuptime,checkhealth lua require('utils').quickClosePane()]], true) -- Add `q` to quickly close this filetypes
autocmd('ft_lua', [[FileType lua let b:surround_70 = "function () \r end"]], true) -- Enhance `surround` for `lua`
autocmd('ft_git', [[FileType gitcommit,NeogitCommitMessage setl nocindent]], true) -- Disable `cindent` for `gitcommit`

-- TODO: Deal with this later
--[[
" FileType autocommand {{{
autocmd BufReadPre,FileReadPre *.nfo set ft=nfo
autocmd FileType nfo :setlocal fileencodings=cp437,utf-8
autocmd FileType nfo highlight clear ExtraWhitespace

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
autocmd FileType php,blade setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab colorcolumn=80
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
autocmd FileType python setlocal foldmethod=indent shiftwidth=4 expandtab tabstop=4 softtabstop=4
" autocmd FileType python setlocal colorcolumn=80
" autocmd FileType python map <buffer> <F4> :call Flake8()<CR>
" autocmd FileType python autocmd BufWritePre * :%s/\s\+$//e
" autocmd FileType python set omnifunc=pythoncomplete#Complete

" JSONc config
autocmd FileType json syntax match Comment +\/\/.\+$+

" Puppet configurations
"""""""""""""""""""""""
au FileType puppet setlocal noexpandtab

" Get jinja filetype selection working correctly for *.jinja.html files.
au BufNewFile,BufReadPost *.jinja.html setlocal filetype=htmljinja
--]]

-- Filetype specific configs

vim.cmd 'autocmd init_lua FileType help,qf,startuptime,checkhealth lua require("utils").quickClosePane()' -- 1st choice

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
